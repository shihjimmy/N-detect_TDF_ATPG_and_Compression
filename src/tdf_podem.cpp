/**********************************************************************/
/*           This is the podem test pattern generator for atpg        */
/*                                                                    */
/*           Author: Bing-Chen (Benson) Wu                            */
/*           last update : 01/21/2018                                 */
/**********************************************************************/

#include "atpg.h"

#define CONFLICT 2

/* generates a single pattern for a single fault */
int ATPG::tdf_podem(const fptr fault, int &current_backtracks) {
  int i, ncktwire, ncktin;
  wptr wpi; // points to the PI currently being assigned
  forward_list<wptr> decision_tree; // design_tree (a LIFO stack)
  wptr wfault;
  int attempt_num = 0;  // counts the number of pattern generated so far for the given fault
  v1_shift_out = U;   // initialize for DTC

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

  v1_fail:
  while ((no_of_backtracks < backtrack_limit) && !no_test &&
         !(find_test && (attempt_num == total_attempt_num))) {

    /* check if test possible.   Fig. 7.1 */
    if (wpi = test_possible(fault)) {
      wpi->set_changed();
      /* insert a new PI into decision_tree */
      decision_tree.push_front(wpi);
    } else { // no test possible using this assignment, backtrack.

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
      if (wpi == nullptr) no_test = true; //decision tree empty,  Fig 7.9
    } // no test possible

/* this again loop is to generate multiple patterns for a single fault 
 * this part is NOT in the original PODEM paper  */
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
          display_io();
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
    if(!check_vector1(fault)){
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
        if (!wpi) no_test = true;
        else goto v1_fail;
    } else { // v1 success
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
    /* normally, we want one pattern per fault */
    //cout<<"detected_num = "<< detected_num<<endl;
    if (total_attempt_num == 1) {
      if(detected_num==1){
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
      display_io();
      /*if(detected_num==1){
        display_io();
      }
      else{
        for(int k=0;k<detected_num;++k){
          display_io();
        }
      }*/
      }
      else{
        //records the input with unknown for test pattern duplication
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
          display_io();
        }

      }
      
    } else fprintf(stdout, "\n");  // do not random fill when multiple patterns per fault
    return (TRUE);
  } else if (no_test) {
    /*fprintf(stdout,"redundant fault...\n");*/
    return (FALSE);
  } else {
    /*fprintf(stdout,"test aborted due to backtrack limit...\n");*/
    return (MAYBE);
  }
}/* end of podem */


bool ATPG::check_vector1(fptr fault){
  int i, ncktwire, ncktin;
  wptr wpi;
  wptr object_wire;
  int object_level;
  /* initialize circuit wires to unknown */
  ncktwire = sort_wlist.size();
  ncktin = cktin.size();
  for (i = ncktin; i < ncktwire; i++) {
    sort_wlist[i]->value = U;
  }
  /* shift back to get v1 */
  for (i = 0; i < ncktin - 1; i++) {
    if (cktin[i+1]->value == D)
        cktin[i]->value = 1;
    else if (cktin[i+1]->value == D_bar)
        cktin[i]->value = 0;
    else cktin[i]->value = cktin[i+1]->value;

    cktin[i]->set_changed();
  }
  cktin[ncktin-1]->value = v1_shift_out;
  cktin[ncktin-1]->set_changed();
  sim();
  if (fault->fault_type == sort_wlist[fault->to_swlist]->value){
    // for fault_type == 0(STR), 0 -> 1, value should be 0 for v1
    return true;
  }
  else if (sort_wlist[fault->to_swlist]->value == U){
    // wire value is unknown, assign PIs to match fault_type and value
    if (fault->node->type != OUTPUT) { //if fault not on PO
        /* if fault is on GUT otuput */
        if (fault->io) { 
            if (fault->fault_type) object_level = 1;
            else object_level = 0;
            /* objective_wire is on faulty gate output */
            object_wire = fault->node->owire.front();
        }
        /* if fault is on GUT input */
        else {
            if (fault->fault_type) object_level = 1;
            else object_level = 0;
            /* objective wire is faulty wire itself */
            object_wire = fault->node->iwire[fault->index];
        }
    } else { // else if fault on PO
        /* if faulty PO is still unknown */
        if (fault->node->iwire.front()->value == U) {
            if (fault->fault_type) object_level = 1;
            else object_level = 0;
            /* objective wire is the faulty wire itself */
            object_wire = fault->node->iwire.front();
        }
    }
    while (sort_wlist[fault->to_swlist]->value == U){
        if (wpi = find_pi_assignment(object_wire, object_level)){
            wpi->set_changed();
            sim();
        }
        else return false;
    }
    v1_shift_out = sort_wlist[ncktin-1]->value;
    return true;
  }
  else {
    // conflict, no possible v1. need to backtrack
    return false;
  }
}