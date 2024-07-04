./atpg -tdfatpg -STC ../sample_circuits/c17.ckt   > ../tdf_patterns/tdfatpg_STC_c17.pat  
./atpg -tdfatpg -STC ../sample_circuits/c432.ckt  > ../tdf_patterns/tdfatpg_STC_c432.pat 
./atpg -tdfatpg -STC ../sample_circuits/c499.ckt  > ../tdf_patterns/tdfatpg_STC_c499.pat 
./atpg -tdfatpg -STC ../sample_circuits/c880.ckt  > ../tdf_patterns/tdfatpg_STC_c880.pat 
./atpg -tdfatpg -STC ../sample_circuits/c1355.ckt > ../tdf_patterns/tdfatpg_STC_c1355.pat
./atpg -tdfatpg -STC ../sample_circuits/c2670.ckt > ../tdf_patterns/tdfatpg_STC_c2670.pat
./atpg -tdfatpg -STC ../sample_circuits/c3540.ckt > ../tdf_patterns/tdfatpg_STC_c3540.pat
./atpg -tdfatpg -STC ../sample_circuits/c6288.ckt > ../tdf_patterns/tdfatpg_STC_c6288.pat
./atpg -tdfatpg -STC ../sample_circuits/c7552.ckt > ../tdf_patterns/tdfatpg_STC_c7552.pat

./atpg -tdfatpg -DTC ../sample_circuits/c17.ckt   > ../tdf_patterns/tdfatpg_DTC_c17.pat  
./atpg -tdfatpg -DTC ../sample_circuits/c432.ckt  > ../tdf_patterns/tdfatpg_DTC_c432.pat 
./atpg -tdfatpg -DTC ../sample_circuits/c499.ckt  > ../tdf_patterns/tdfatpg_DTC_c499.pat 
./atpg -tdfatpg -DTC ../sample_circuits/c880.ckt  > ../tdf_patterns/tdfatpg_DTC_c880.pat 
./atpg -tdfatpg -DTC ../sample_circuits/c1355.ckt > ../tdf_patterns/tdfatpg_DTC_c1355.pat
./atpg -tdfatpg -DTC ../sample_circuits/c2670.ckt > ../tdf_patterns/tdfatpg_DTC_c2670.pat
./atpg -tdfatpg -DTC ../sample_circuits/c3540.ckt > ../tdf_patterns/tdfatpg_DTC_c3540.pat
./atpg -tdfatpg -DTC ../sample_circuits/c6288.ckt > ../tdf_patterns/tdfatpg_DTC_c6288.pat
./atpg -tdfatpg -DTC ../sample_circuits/c7552.ckt > ../tdf_patterns/tdfatpg_DTC_c7552.pat

diff <(grep '#' ../tdf_patterns/tdfatpg_DTC_c17.pat)   <(grep '#' ../tdf_patterns/tdfatpg_STC_c17.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_DTC_c432.pat)  <(grep '#' ../tdf_patterns/tdfatpg_STC_c432.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_DTC_c499.pat)  <(grep '#' ../tdf_patterns/tdfatpg_STC_c499.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_DTC_c880.pat)  <(grep '#' ../tdf_patterns/tdfatpg_STC_c880.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_DTC_c1355.pat) <(grep '#' ../tdf_patterns/tdfatpg_STC_c1355.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_DTC_c2670.pat) <(grep '#' ../tdf_patterns/tdfatpg_STC_c2670.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_DTC_c3540.pat) <(grep '#' ../tdf_patterns/tdfatpg_STC_c3540.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_DTC_c6288.pat) <(grep '#' ../tdf_patterns/tdfatpg_STC_c6288.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_DTC_c7552.pat) <(grep '#' ../tdf_patterns/tdfatpg_STC_c7552.pat)