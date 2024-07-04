# N-detect_TDF_ATPG_and_Compression
This is README file for VLSI Testing Final Project Group 1
Author: Kai-Hsiang Hu
Topic: N-detect TDF ATPG and Compression
Group Member: Kai-Hsiang Hu B09901153, Chia-Cheng Wu B09901098, Bo-Ru Shi B09901081
Date: 2024.6.13

=====
DIRECTORY:
./team_1_project
 ./sample_circuits          (circuits provided)
 ./tdf_patterns             (generated patterns in here)
 ./src                      (The main code)
    check_FC.sh                 (Apply TDF ATPG w/ and w/o test compression)
    check_TL.sh                 (Apply TDF ATPG w/ and w/o test compression and print their difference)
    check_DTC_STC.sh            (Apply only DTC/STC to all sample circuit and print the difference)
    check_Ndet.sh               (Apply n-detect TDF ATPG fron n = 1 to 8 w/ and w/o test compression and print their difference)
 run                        (The shell to run)
 slide.pdf                  (The presentation slide)
 report.pdf                 (The final report)
 README.md

 
======
HOW TO RUN:

## Generare the pattern of TDF ATPG w/ and w/o test compression, DTC/STC only, and 8-detect TDF ATPG w/ and w/o test compression
./run (or you may type: bash run)


## For more explicit command, do them in /src
cd src
# Apply TDF ATPG w/ and w/o test compression
check_FC.sh            
# Apply TDF ATPG w/ and w/o test compression and print their difference
check_TL.sh                
# Apply only DTC/STC to all sample circuit and print the difference
check_DTC_STC.sh         
# Apply n-detect TDF ATPG fron n = 1 to 8 w/ and w/o test compression and print their difference
check_Ndet.sh            

## More precisely, you can simply type the following command to operate our TDF ATPG in /src, for example:
./atpg -tdfatpg ../sample_circuits/c17.ckt > ../tdf_patterns/c17.pat
# You can use a flag "-compression" to do the compression;  otherwise, we will not:
./atpg -tdfatpg -compression ../sample_circuits/c17.ckt > ../tdf_patterns/c17.pat
# Also, applying only DTC/STC is okay by using flag -DTC/-STC:
./atpg -tdfatpg -STC ../sample_circuits/c17.ckt > ../tdf_patterns/c17.pat
# For n-detect, you can type "-ndet number" for the number N.  The flag (e.g. -ndet) is followed by the number of detection (e.g. number=N).  For example, if we want to specify 8 detection, we can simply type the following command:
./atpg -tdfatpg -ndet 8 ../sample_circuits/c17.ckt > ../tdf_patterns/c17.pat
# Of course, the above commands can be used together like this: 
./atpg -tdfatpg -ndet 8 -compression ../sample_circuits/c17.ckt > ../tdf_patterns/c17.pat


======
OTHER NOTICE:

You may find the compression result of c6288 higher then uncompressed result, use STC only for this circuit may lead to better result.