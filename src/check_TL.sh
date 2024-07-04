./atpg -tdfatpg ../sample_circuits/c432.ckt  > ../tdf_patterns/tdfatpg_c432.pat 
./atpg -tdfatpg ../sample_circuits/c499.ckt  > ../tdf_patterns/tdfatpg_c499.pat 
./atpg -tdfatpg ../sample_circuits/c880.ckt  > ../tdf_patterns/tdfatpg_c880.pat 
./atpg -tdfatpg ../sample_circuits/c1355.ckt > ../tdf_patterns/tdfatpg_c1355.pat
./atpg -tdfatpg ../sample_circuits/c2670.ckt > ../tdf_patterns/tdfatpg_c2670.pat
./atpg -tdfatpg ../sample_circuits/c3540.ckt > ../tdf_patterns/tdfatpg_c3540.pat
./atpg -tdfatpg ../sample_circuits/c6288.ckt > ../tdf_patterns/tdfatpg_c6288.pat
./atpg -tdfatpg ../sample_circuits/c7552.ckt > ../tdf_patterns/tdfatpg_c7552.pat

./atpg -tdfatpg -compression ../sample_circuits/c17.ckt   > ../tdf_patterns/tdfatpg_compress_c17.pat  
./atpg -tdfatpg -compression ../sample_circuits/c432.ckt  > ../tdf_patterns/tdfatpg_compress_c432.pat 
./atpg -tdfatpg -compression ../sample_circuits/c499.ckt  > ../tdf_patterns/tdfatpg_compress_c499.pat 
./atpg -tdfatpg -compression ../sample_circuits/c880.ckt  > ../tdf_patterns/tdfatpg_compress_c880.pat 
./atpg -tdfatpg -compression ../sample_circuits/c1355.ckt > ../tdf_patterns/tdfatpg_compress_c1355.pat
./atpg -tdfatpg -compression ../sample_circuits/c2670.ckt > ../tdf_patterns/tdfatpg_compress_c2670.pat
./atpg -tdfatpg -compression ../sample_circuits/c3540.ckt > ../tdf_patterns/tdfatpg_compress_c3540.pat
./atpg -tdfatpg -compression ../sample_circuits/c6288.ckt > ../tdf_patterns/tdfatpg_compress_c6288.pat
./atpg -tdfatpg -compression ../sample_circuits/c7552.ckt > ../tdf_patterns/tdfatpg_compress_c7552.pat

diff <(grep '#' ../tdf_patterns/tdfatpg_compress_c17.pat)   <(grep '#' ../tdf_patterns/tdfatpg_c17.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_c432.pat)  <(grep '#' ../tdf_patterns/tdfatpg_c432.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_c499.pat)  <(grep '#' ../tdf_patterns/tdfatpg_c499.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_c880.pat)  <(grep '#' ../tdf_patterns/tdfatpg_c880.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_c1355.pat) <(grep '#' ../tdf_patterns/tdfatpg_c1355.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_c2670.pat) <(grep '#' ../tdf_patterns/tdfatpg_c2670.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_c3540.pat) <(grep '#' ../tdf_patterns/tdfatpg_c3540.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_c6288.pat) <(grep '#' ../tdf_patterns/tdfatpg_c6288.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_c7552.pat) <(grep '#' ../tdf_patterns/tdfatpg_c7552.pat)