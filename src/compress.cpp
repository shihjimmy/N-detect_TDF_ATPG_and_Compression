#include "atpg.h"
#include <queue>

#define CONFLICT 2
#define PODEMX_LIMIT 3

int ATPG::tdf_podem_with_compression(const fptr fault, int &current_backtracks){
    int i, ncktwire, ncktin;
    wptr wpi; // points to the PI currently being assigned
    forward_list<wptr> decision_tree; // a LIFO stack
    wptr wfault;
    int attempt_num = 0;  // counts the number of pattern generated so far for the given fault
    v1_shift_out = U;

    /* initialize all circuit wires to unknown */
    ncktwire = sort_wlist.size();
    ncktin = cktin.size();
    for (i = 0; i < ncktwire; i++) {
      sort_wlist[i]->value = U;
    }
    no_of_backtracks = 0;
    find_test = false;
    no_test = false;

    mark_propagate_tree(fault->node);

    /* Fig 7 starts here */
    /* set the initial objective, assign the first PI.  Fig 7.P1 */
    switch (set_uniquely_implied_value(fault)) {
      case TRUE: // if a  PI is assigned
        sim();  // Fig 7.3
        wfault = fault_evaluate(fault);
        if (wfault != nullptr) forward_imply(wfault);// propagate fault effect
        if (check_test()) find_test = true; // if fault effect reaches PO, done. Fig 7.10
        break;
      case CONFLICT:
        no_test = true; // cannot achieve initial objective, no test
        break;
      case FALSE:
        break;  //if no PI is reached, keep on backtracing. Fig 7.A
    }

    /* loop in Fig 7.ABC
      * quit the loop when either one of the three conditions is met:
      * 1. number of backtracks is equal to or larger than limit
      * 2. no_test
      * 3. already find a test pattern AND no_of_patterns meets required total_attempt_num */
   
   
    /*
      For tdf atpg, we first get pattern2 to make sure we can propagate fault to PO 
      Second, we shift back 1 bit to get pattern1 
      we need to make sure pattern1's simulation can fit the fault's requirement
      ex: for STF,  we should make pattern1's simulation of the faulty wire be 1  
      */
   
    v1_fail:
    while ((no_of_backtracks < backtrack_limit) && !no_test &&
            !(find_test && (attempt_num == total_attempt_num))) {
            
      /* check if test possible.   Fig. 7.1 */
      if (wpi = test_possible(fault)) {
        wpi->set_changed();
        /* insert a new PI into decision_tree */
        decision_tree.push_front(wpi);
      } 
      else { 
          // no test possible using this assignment, backtrack.
        while (!decision_tree.empty() && (wpi == nullptr)) {
          /* if both 01 already tried, backtrack. Fig.7.7 */
          if (decision_tree.front()->is_all_assigned()) {
            decision_tree.front()->remove_all_assigned();  // clear the ALL_ASSIGNED flag
            decision_tree.front()->value = U; // do not assign 0 or 1
            decision_tree.front()->set_changed(); // this PI has been changed
            /* remove this PI in decision tree.  see dashed nodes in Fig 6 */
            decision_tree.pop_front();
          }
            /* else, flip last decision, flag ALL_ASSIGNED. Fig. 7.8 */
          else {
            decision_tree.front()->value = decision_tree.front()->value ^ 1; // flip last decision
            decision_tree.front()->set_changed(); // this PI has been changed
            decision_tree.front()->set_all_assigned();
            no_of_backtracks++;
            wpi = decision_tree.front();
          }
        } // while decision tree && ! wpi
        if (wpi == nullptr) 
          no_test = true; //decision tree empty,  Fig 7.9
      } // no test possible

  /* this again loop is to generate multiple patterns for a single fault 
    /* this part is NOT in the original PODEM paper  */
      again:
      if (wpi) {
        sim();
        if (wfault = fault_evaluate(fault)) forward_imply(wfault);
        if (check_test()) {
          find_test = true;
          /* if multiple patterns per fault, print out every test cube */
          if (total_attempt_num > 1) {
            if (attempt_num == 0) {
              display_fault(fault);
            }
            //display_io();
          }
          attempt_num++; // increase pattern count for this fault

          /* keep trying more PI assignments if we want multiple patterns per fault
            * this is not in the original PODEM paper*/
          if (total_attempt_num > attempt_num) {
            wpi = nullptr;
            while (!decision_tree.empty() && (wpi == nullptr)) {
              /* backtrack */
              if (decision_tree.front()->is_all_assigned()) {
                decision_tree.front()->remove_all_assigned();
                decision_tree.front()->value = U;
                decision_tree.front()->set_changed();
                decision_tree.pop_front();
              }
                /* flip last decision */
              else {
                decision_tree.front()->value = decision_tree.front()->value ^ 1;
                decision_tree.front()->set_changed();
                decision_tree.front()->set_all_assigned();
                no_of_backtracks++;
                wpi = decision_tree.front();
              }
            }
            if (!wpi) no_test = true;
            goto again;  // if we want multiple patterns per fault
          } // if total_attempt_num > attempt_num
        }  // if check_test()
      } // again
    } // while (three conditions)

    if (find_test){
      last_PIs.clear();

      for (i = 0; i < ncktin; i++){
          last_PIs.push_back(sort_wlist[i]->value);
      }

      // last_PIs store v2 pattern
      // v1_gen determine whether it is successful to get valid v1 or not
      bool v1_gen = check_vector1(fault);

      if(!v1_gen){
          find_test = false;

          for (i = 0; i < ncktin; i++){
              sort_wlist[i]->value = last_PIs[i];
              sort_wlist[i]->set_changed();
          }

          wpi = nullptr;
          while (!decision_tree.empty() && (wpi == nullptr)) {
              if (decision_tree.front()->is_all_assigned()) {
                  decision_tree.front()->remove_all_assigned(); 
                  decision_tree.front()->value = U;
                  decision_tree.front()->set_changed();
                  /* remove this PI in decision tree.  see dashed nodes in Fig 6 */
                  decision_tree.pop_front();
              }
                  /* else, flip last decision, flag ALL_ASSIGNED. Fig. 7.8 */
              else {
                  decision_tree.front()->value = decision_tree.front()->value ^ 1; // flip last decision
                  decision_tree.front()->set_changed(); // this PI has been changed
                  decision_tree.front()->set_all_assigned();
                  no_of_backtracks++;
                  wpi = decision_tree.front();
                  sim();  
              }
          } // while decision tree && ! wpi

          if (!wpi) 
              no_test = true;
          else 
              goto v1_fail;
      } 
      else { 
          // v1 successfully generated
          v2_shiftin = last_PIs[0];
          last_PIs.clear();
      }
    }

    /* clear everything */
    for (wptr wptr_ele: decision_tree) {
      wptr_ele->remove_all_assigned();
    }
    decision_tree.clear();

    current_backtracks = no_of_backtracks;
    unmark_propagate_tree(fault->node);

    if (find_test) {
      /* for dynamic test compression */
      if (!STC_only){
        tdf_podem_x();
      }

      /* normally, we want one pattern per fault */
      if (total_attempt_num == 1) {
        if(detected_num == 1){
          for (i = 0; i < ncktin; i++) {
            switch (cktin[i]->value) {
              case 0:
              case 1:
                break;
              case D:
                cktin[i]->value = 1;
                break;
              case D_bar:
                cktin[i]->value = 0;
                break;
              case U:
                cktin[i]->value = rand() & 01;
                break; // random fill U
            }
          }

          switch (v2_shiftin){
            case 0:
            case 1:
                break;
            case D:
                v2_shiftin = 1;
                break;
            case D_bar:
                v2_shiftin = 0;
                break;
            case U:
                v2_shiftin = rand() & 01;
                break; // random fill U
          }
        } else {
          vector<int> CKT_Input_record,current_V1;
          int V2_shiftin_record,current_V2;
          for(int k=0;k<ncktin;++k){
            CKT_Input_record.push_back(cktin[k]->value);
          }
          V2_shiftin_record=v2_shiftin;
          for(int j=0;j<detected_num;++j){
            current_V1.clear();
            for (i = 0; i < ncktin; i++) {
              switch (CKT_Input_record[i]) {
                case 0:
                case 1:
                  break;
                case D:
                  cktin[i]->value = 1;
                  break;
                case D_bar:
                  cktin[i]->value = 0;
                  break;
                case U:
                cktin[i]->value = rand() & 01;
                //cktin[i]->value = 2;
                  break; // random fill U
                }
                current_V1.push_back(cktin[i]->value);
              }
            switch (V2_shiftin_record){
              case 0:
              case 1:
                break;
              case D:
                v2_shiftin = 1;
                break;
              case D_bar:
                v2_shiftin = 0;
                break;
              case U:
                v2_shiftin = rand() & 01;
                //v2_shiftin = 2;
                break; // random fill U
            }
            current_V2=v2_shiftin;
            Ndet_TPG_V1_test_pattern_set.push_back(current_V1);
            Ndet_TPG_V2_set.push_back(current_V2);
          }
        }
        /* we should not display_io because we haven't do static compression yet */
        /* if we display, the data will be written into the output file */
        //display_io();
      } 
      else 
        fprintf(stdout, "\n");  // do not random fill when multiple patterns per fault
      return (TRUE);
    } 
    else if (no_test) {
      /*fprintf(stdout,"redundant fault...\n");*/
      return (FALSE);
    } 
    else {
      /*fprintf(stdout,"test aborted due to backtrack limit...\n");*/
      return (MAYBE);
    }
}/* end of podem */


void ATPG::tdf_podem_x(){
    int ncktin = cktin.size();
    int PO_idx = 0;

    for (fptr fptr_ele : flist_undetect){
     fptr_ele->DTC = false;
    }

      /* terminating condition: */
      // 1. no unknown PO
      // 2. continuous failure > podemx_limit

    int fail_count = 0;
    while (fail_count < PODEMX_LIMIT){
    
      while (PO_idx < cktout.size()){
        /* find unknown PO */
        if (cktout[PO_idx]->value == U)  
                  break;
        PO_idx++;
      }
    
      /* no unknown PO */
      if (PO_idx == cktout.size())
        return;
    
      /* backtrace from unknown PO */
      queue<wptr> q_wire;
      queue<fptr> q_fault;
      fptr f_second = nullptr;
      wptr unknown_PO = cktout[PO_idx];
      bool PO_filled = false;
    
      q_wire.push(unknown_PO);
      int sl = 0;
    
      while (!PO_filled){
      
        while (!q_wire.empty() && q_fault.empty()){
          for (auto w : q_wire.front()->inode.front()->iwire){
              if (w->value == U)
                  q_wire.push(w);
          }
    
          if (!q_wire.front()->wire_flist.empty()){
              for (auto f : q_wire.front()->wire_flist){
                  if (f->detect != REDUNDANT && f->DTC == false)
                      q_fault.push(f);
              }
          }
    
          q_wire.pop();
        }   
    
        // try next unknown PO
        if (q_fault.empty())
          break;
    
        f_second = q_fault.front();
        q_fault.pop();
    
        for (int i = 0; i < ncktin; i++){
          switch (cktin[i]->value){
            case 0:
            case 1:
            case U:
              break;
            case D:
              cktin[i]->value = 1;
              break;
            case D_bar:
              cktin[i]->value = 0;
              break;
            default:
              break;
          }
        }
    
        switch (v2_shiftin){
            case 0:
            case 1:
                break;
            case D:
                v2_shiftin = 1;
                break;
            case D_bar:
                v2_shiftin = 0;
                break;
            default:
                break; 
        }
        v1_shift_out = cktin[ncktin-1]->value;   
        for (int i = 0; i < ncktin; ++i)
          sort_wlist[i]->set_changed();
        for (int i = ncktin; i < sort_wlist.size(); ++i)
          sort_wlist[i]->value = U;
    
    
        switch (tdf_podemx_second(f_second)){
          case TRUE:
            if (unknown_PO->value != U)
                PO_filled = true;
            break;
          default:    
            break;
        }
    
        f_second->DTC = true;
      }
    
      if (unknown_PO->value == U){
        PO_idx++;
        fail_count++;
      }
    }
    return;
}


int ATPG::tdf_podemx_second(const fptr& fault){
    int ncktin = cktin.size();
	  wptr wpi;		
	  forward_list<wptr> decision_tree; // a LIFO stack
	  wptr wfault;
  
    no_of_backtracks = 0;
	  find_test = false;
	  no_test = false;
  
	  // store original PIs for primary fault
    last_PIs.push_back(v2_shiftin); // v2
    for(int i=0; i<ncktin ; ++i){
        last_PIs.push_back(sort_wlist[i]->value); // v1
    }
  
    // inject v2 pattern
	  for(int i=0; i<ncktin; ++i){
        cktin[i]->value = last_PIs[i];
    }
  
    /* turn D to 1 and D_bar to 0 */
    // v2 sim
    sim();
  
	  mark_propagate_tree(fault->node);
	  /* Fig 7 starts here */
	  /* set the initial objective, assign the first PI.  Fig 7.P1 */
	  switch (set_uniquely_implied_value(fault)){
	  	case TRUE: // if a unknown PI is assigned
	  		sim();	 // Fig 7.3
	  		wfault = fault_evaluate(fault);
	  		if (wfault != nullptr)
	  			forward_imply(wfault); // propagate fault effect
	  		if (check_test())
	  			find_test = true; // if fault effect reaches PO, done. Fig 7.10
	  		break;
	  	case CONFLICT:
	  		no_test = true; // cannot achieve initial objective, no test
	  		break;
	  	case FALSE:
	  		break; // if no PI is reached, keep on backtracing. Fig 7.A
	  }
  
	  /* loop in Fig 7.ABC
	   * quit the loop when either one of the three conditions is met:
	   * 1. number of backtracks is equal to or larger than limit
	   * 2. no_test
	   * 3. already find a test pattern AND no_of_patterns meets required total_attempt_num */
	  while ((no_of_backtracks < backtrack_limit) && !no_test && !find_test){
	  	/* check if test possible.   Fig. 7.1 */
	  	if (wpi = test_possible(fault)){
	  		wpi->set_changed();
	  		/* insert a new PI into decision_tree */
	  		decision_tree.push_front(wpi);
	  	}
          else{ 
          // no test possible using this assignment, backtrack.
	  		while (!decision_tree.empty() && (wpi == nullptr))
	  		{
	  			/* if both 01 already tried, backtrack. Fig.7.7 */
	  			if (decision_tree.front()->is_all_assigned())
	  			{
	  				decision_tree.front()->remove_all_assigned(); // clear the ALL_ASSIGNED flag
	  				decision_tree.front()->value = U;							// do not assign 0 or 1
	  				decision_tree.front()->set_changed();					// this PI has been changed
	  				/* remove this PI in decision tree.  see dashed nodes in Fig 6 */
	  				decision_tree.pop_front();
	  			}
	  			/* else, flip last decision, flag ALL_ASSIGNED. Fig. 7.8 */
	  			else
	  			{
	  				decision_tree.front()->value = decision_tree.front()->value ^ 1; // flip last decision
	  				decision_tree.front()->set_changed();														 // this PI has been changed
	  				decision_tree.front()->set_all_assigned();
	  				no_of_backtracks++;
	  				wpi = decision_tree.front();
	  			}
	  		} // while decision tree && ! wpi
  
              if (wpi == nullptr)
	  			no_test = true; // decision tree empty,  Fig 7.9
	  	} // no test possible
  
  
	  	if (wpi){
	  		sim();
  
	  		if (wfault = fault_evaluate(fault))
	  			forward_imply(wfault);
  
	  		if (check_test())
                  find_test = true;
	  	}		
	  }		
  
      /* clear everything */
	  for (wptr wptr_ele : decision_tree)
	    wptr_ele->remove_all_assigned();
  
	  decision_tree.clear();
  
    bool v1_gen = check_vector1(fault);
    /* means if we use the v2 to shift back a bit to get v1
       v1 cannot satisfy the condition of transition delay fault */
    if(!v1_gen) 
      return (FALSE);
      
  
	  for (wptr wptr_ele : decision_tree){
	  	wptr_ele->remove_all_assigned();
	  }
	  decision_tree.clear();
	  unmark_propagate_tree(fault->node);
  
	  if (find_test)
	  	return (TRUE);
  
	  for (int i = 0; i < ncktin; i++)
	  	sort_wlist[i]->set_changed();
	  for (int i = ncktin; i < sort_wlist.size(); i++)
	  	sort_wlist[i]->value = U;
  
    // v1 sim
	  sim();
  
    if (no_test)
	  	return (FALSE);
	  else
	  	return (MAYBE);
}


void ATPG::test_with_compression(){
    string vec;
    int current_detect_num = 0;
    int total_detect_num = 0;
    int total_no_of_backtracks = 0;  // accumulative number of backtracks
    int current_backtracks = 0;
    int no_of_aborted_faults = 0;
    int no_of_redundant_faults = 0;
    int no_of_calls = 0;

    fptr fault_under_test = flist_undetect.front();

    /* transition fault sim mode */
    if (tdfsim_only) {
        transition_delay_fault_simulation(total_detect_num);
        in_vector_no += vectors.size();
        display_undetect();

        printf("\n# Result:\n");
        printf("-----------------------\n");
        printf("# number of test vectors = %d\n", in_vector_no);
        printf("# total transition delay faults: %d\n", num_of_tdf_fault);
        printf("# total detected faults: %d\n", total_detect_num);
        printf("# fault coverage: %lf %\n", (double) total_detect_num / (double) num_of_tdf_fault * 100);
        return;
    }// if fsim only

    /* test generation mode */
    while (fault_under_test != nullptr) {
        /* dynamic test compression*/
        switch (tdf_podem_with_compression(fault_under_test, current_backtracks)) {
            case TRUE:
                /* form a vector */
                vec.clear();
                for (wptr w: cktin) {
                    vec.push_back(itoc(w->value));
                }
                vec.push_back(' ');
                vec.push_back(itoc(v2_shiftin));
                /*by defect, we want only one pattern per fault */
                /*run a fault simulation, drop ALL detected faults */
                if (total_attempt_num == 1) {
                  if(detected_num == 1) {
                    tdfault_sim_a_vector(vec, current_detect_num);
                    vectors.push_back(vec);
                    /* we should calculate FC after during STC */
                    // total_detect_num += current_detect_num;
                  }
                  else {
                    for(int m=0;m < Ndet_TPG_V1_test_pattern_set.size(); ++m){
                        vec.clear();
                        for (int n=0;n<Ndet_TPG_V1_test_pattern_set[m].size();++n) {
                            vec.push_back(itoc(Ndet_TPG_V1_test_pattern_set[m][n]));
                            }
                        vec.push_back(' ');
                        vec.push_back(itoc(Ndet_TPG_V2_set[m]));
                        tdfault_sim_a_vector(vec, current_detect_num);
                        vectors.push_back(vec);
                    }
                    Ndet_TPG_V1_test_pattern_set.clear();
                    Ndet_TPG_V2_set.clear();
                  }
                }
                    /* If we want mutiple petterns per fault,
                    * NO fault simulation.  drop ONLY the fault under test */
                else {
                    fault_under_test->detect = TRUE;
                    /* drop fault_under_test */
                    flist_undetect.remove(fault_under_test);
                }
                /*collecting vectors for compression*/
                break;

            case FALSE:
                fault_under_test->detect = REDUNDANT;
                no_of_redundant_faults++;
                break;

            case MAYBE:
                no_of_aborted_faults++;
                break;
        }

        fault_under_test->test_tried = true;
        fault_under_test = nullptr;

        for (fptr fptr_ele: flist_undetect) {
            if (!fptr_ele->test_tried) {
                fault_under_test = fptr_ele;
                break;
            }
        }

        total_no_of_backtracks += current_backtracks; // accumulate number of backtracks
        no_of_calls++;
    }


    /* static test compression */
    STC_compression(in_vector_no, total_detect_num);
    


    display_undetect();
    printf("\n# Result:\n");
    printf("-----------------------\n");
    printf("# number of calling podem1 = %d\n", no_of_calls);
    printf("# total number of backtracks = %d\n", total_no_of_backtracks);
    printf("# number of test vectors = %d\n", in_vector_no);
    printf("# total transition delay faults: %d\n", num_of_tdf_fault);
    printf("# total detected faults: %d\n", total_detect_num);
    printf("# fault coverage: %lf %\n", (double) total_detect_num / (double) num_of_tdf_fault * 100);
}

void ATPG::STC_compression(int &vector_num, int &total_detect_num){
    vector_num = 0;
    flist_undetect.clear();
    bool useful;

    for (auto &f : flist){
        f->detect = FALSE;
        f->detected_time = 0;
        flist_undetect.push_front(f.get());
        
    }

    int detected_num = 0;
    if(!DTC_only){
      for (int i = vectors.size() - 1; i >= 0; i--){
          useful = tdfault_sim_a_vector(vectors[i], detected_num);
      
          if (!useful){
              vectors.erase(vectors.begin() + i); // delete STC redundant vectors
          }
      }

      flist_undetect.clear();

      for (auto &f : flist){
          f->detect = FALSE;
          f->detected_time = 0;
          flist_undetect.push_front(f.get());
      }
    }

    for (int i = 0; i < vectors.size(); i++){
        useful = tdfault_sim_a_vector(vectors[i], detected_num);

        if (!useful){//& !DTC_only){
            continue; // ignore vectors detects 0 faults
        } else {     
            total_detect_num += detected_num;
            fprintf(stdout, "T\'");
            fprintf(stdout, vectors[i].c_str());
            fprintf(stdout, "'");
            fprintf(stdout, "\n");
            vector_num++;
        }
    }

}