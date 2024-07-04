./atpg -tdfatpg ../sample_circuits/c432.ckt  > ../tdf_patterns/tdfatpg_ndet1_c432.pat 
./atpg -tdfatpg ../sample_circuits/c499.ckt  > ../tdf_patterns/tdfatpg_ndet1_c499.pat 
./atpg -tdfatpg ../sample_circuits/c880.ckt  > ../tdf_patterns/tdfatpg_ndet1_c880.pat 
./atpg -tdfatpg ../sample_circuits/c1355.ckt > ../tdf_patterns/tdfatpg_ndet1_c1355.pat
./atpg -tdfatpg ../sample_circuits/c2670.ckt > ../tdf_patterns/tdfatpg_ndet1_c2670.pat
./atpg -tdfatpg ../sample_circuits/c3540.ckt > ../tdf_patterns/tdfatpg_ndet1_c3540.pat
./atpg -tdfatpg ../sample_circuits/c6288.ckt > ../tdf_patterns/tdfatpg_ndet1_c6288.pat
./atpg -tdfatpg ../sample_circuits/c7552.ckt > ../tdf_patterns/tdfatpg_ndet1_c7552.pat


./atpg -tdfatpg -compression ../sample_circuits/c432.ckt  > ../tdf_patterns/tdfatpg_compress_ndet1_c432.pat 
./atpg -tdfatpg -compression ../sample_circuits/c499.ckt  > ../tdf_patterns/tdfatpg_compress_ndet1_c499.pat 
./atpg -tdfatpg -compression ../sample_circuits/c880.ckt  > ../tdf_patterns/tdfatpg_compress_ndet1_c880.pat 
./atpg -tdfatpg -compression ../sample_circuits/c1355.ckt > ../tdf_patterns/tdfatpg_compress_ndet1_c1355.pat
./atpg -tdfatpg -compression ../sample_circuits/c2670.ckt > ../tdf_patterns/tdfatpg_compress_ndet1_c2670.pat
./atpg -tdfatpg -compression ../sample_circuits/c3540.ckt > ../tdf_patterns/tdfatpg_compress_ndet1_c3540.pat
./atpg -tdfatpg -compression ../sample_circuits/c6288.ckt > ../tdf_patterns/tdfatpg_compress_ndet1_c6288.pat
./atpg -tdfatpg -compression ../sample_circuits/c7552.ckt > ../tdf_patterns/tdfatpg_compress_ndet1_c7552.pat

echo "N detect 1 compressed and uncompressed result"
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet1_c432.pat)  <(grep '#' ../tdf_patterns/tdfatpg_ndet1_c432.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet1_c499.pat)  <(grep '#' ../tdf_patterns/tdfatpg_ndet1_c499.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet1_c880.pat)  <(grep '#' ../tdf_patterns/tdfatpg_ndet1_c880.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet1_c1355.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet1_c1355.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet1_c2670.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet1_c2670.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet1_c3540.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet1_c3540.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet1_c6288.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet1_c6288.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet1_c7552.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet1_c7552.pat)

./atpg -tdfatpg -ndet 2 ../sample_circuits/c432.ckt  > ../tdf_patterns/tdfatpg_ndet2_c432.pat 
./atpg -tdfatpg -ndet 2 ../sample_circuits/c499.ckt  > ../tdf_patterns/tdfatpg_ndet2_c499.pat 
./atpg -tdfatpg -ndet 2 ../sample_circuits/c880.ckt  > ../tdf_patterns/tdfatpg_ndet2_c880.pat 
./atpg -tdfatpg -ndet 2 ../sample_circuits/c1355.ckt > ../tdf_patterns/tdfatpg_ndet2_c1355.pat
./atpg -tdfatpg -ndet 2 ../sample_circuits/c2670.ckt > ../tdf_patterns/tdfatpg_ndet2_c2670.pat
./atpg -tdfatpg -ndet 2 ../sample_circuits/c3540.ckt > ../tdf_patterns/tdfatpg_ndet2_c3540.pat
./atpg -tdfatpg -ndet 2 ../sample_circuits/c6288.ckt > ../tdf_patterns/tdfatpg_ndet2_c6288.pat
./atpg -tdfatpg -ndet 2 ../sample_circuits/c7552.ckt > ../tdf_patterns/tdfatpg_ndet2_c7552.pat


./atpg -tdfatpg -ndet 2 -compression ../sample_circuits/c432.ckt  > ../tdf_patterns/tdfatpg_compress_ndet2_c432.pat 
./atpg -tdfatpg -ndet 2 -compression ../sample_circuits/c499.ckt  > ../tdf_patterns/tdfatpg_compress_ndet2_c499.pat 
./atpg -tdfatpg -ndet 2 -compression ../sample_circuits/c880.ckt  > ../tdf_patterns/tdfatpg_compress_ndet2_c880.pat 
./atpg -tdfatpg -ndet 2 -compression ../sample_circuits/c1355.ckt > ../tdf_patterns/tdfatpg_compress_ndet2_c1355.pat
./atpg -tdfatpg -ndet 2 -compression ../sample_circuits/c2670.ckt > ../tdf_patterns/tdfatpg_compress_ndet2_c2670.pat
./atpg -tdfatpg -ndet 2 -compression ../sample_circuits/c3540.ckt > ../tdf_patterns/tdfatpg_compress_ndet2_c3540.pat
./atpg -tdfatpg -ndet 2 -compression ../sample_circuits/c6288.ckt > ../tdf_patterns/tdfatpg_compress_ndet2_c6288.pat
./atpg -tdfatpg -ndet 2 -compression ../sample_circuits/c7552.ckt > ../tdf_patterns/tdfatpg_compress_ndet2_c7552.pat

echo "N detect 2 compressed and uncompressed result"
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet2_c432.pat)  <(grep '#' ../tdf_patterns/tdfatpg_ndet2_c432.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet2_c499.pat)  <(grep '#' ../tdf_patterns/tdfatpg_ndet2_c499.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet2_c880.pat)  <(grep '#' ../tdf_patterns/tdfatpg_ndet2_c880.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet2_c1355.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet2_c1355.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet2_c2670.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet2_c2670.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet2_c3540.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet2_c3540.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet2_c6288.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet2_c6288.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet2_c7552.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet2_c7552.pat)

./atpg -tdfatpg -ndet 3 ../sample_circuits/c432.ckt  > ../tdf_patterns/tdfatpg_ndet3_c432.pat 
./atpg -tdfatpg -ndet 3 ../sample_circuits/c499.ckt  > ../tdf_patterns/tdfatpg_ndet3_c499.pat 
./atpg -tdfatpg -ndet 3 ../sample_circuits/c880.ckt  > ../tdf_patterns/tdfatpg_ndet3_c880.pat 
./atpg -tdfatpg -ndet 3 ../sample_circuits/c1355.ckt > ../tdf_patterns/tdfatpg_ndet3_c1355.pat
./atpg -tdfatpg -ndet 3 ../sample_circuits/c2670.ckt > ../tdf_patterns/tdfatpg_ndet3_c2670.pat
./atpg -tdfatpg -ndet 3 ../sample_circuits/c3540.ckt > ../tdf_patterns/tdfatpg_ndet3_c3540.pat
./atpg -tdfatpg -ndet 3 ../sample_circuits/c6288.ckt > ../tdf_patterns/tdfatpg_ndet3_c6288.pat
./atpg -tdfatpg -ndet 3 ../sample_circuits/c7552.ckt > ../tdf_patterns/tdfatpg_ndet3_c7552.pat


./atpg -tdfatpg -ndet 3 -compression ../sample_circuits/c432.ckt  > ../tdf_patterns/tdfatpg_compress_ndet3_c432.pat 
./atpg -tdfatpg -ndet 3 -compression ../sample_circuits/c499.ckt  > ../tdf_patterns/tdfatpg_compress_ndet3_c499.pat 
./atpg -tdfatpg -ndet 3 -compression ../sample_circuits/c880.ckt  > ../tdf_patterns/tdfatpg_compress_ndet3_c880.pat 
./atpg -tdfatpg -ndet 3 -compression ../sample_circuits/c1355.ckt > ../tdf_patterns/tdfatpg_compress_ndet3_c1355.pat
./atpg -tdfatpg -ndet 3 -compression ../sample_circuits/c2670.ckt > ../tdf_patterns/tdfatpg_compress_ndet3_c2670.pat
./atpg -tdfatpg -ndet 3 -compression ../sample_circuits/c3540.ckt > ../tdf_patterns/tdfatpg_compress_ndet3_c3540.pat
./atpg -tdfatpg -ndet 3 -compression ../sample_circuits/c6288.ckt > ../tdf_patterns/tdfatpg_compress_ndet3_c6288.pat
./atpg -tdfatpg -ndet 3 -compression ../sample_circuits/c7552.ckt > ../tdf_patterns/tdfatpg_compress_ndet3_c7552.pat

echo "N detect 3 compressed and uncompressed result"
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet3_c432.pat)  <(grep '#' ../tdf_patterns/tdfatpg_ndet3_c432.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet3_c499.pat)  <(grep '#' ../tdf_patterns/tdfatpg_ndet3_c499.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet3_c880.pat)  <(grep '#' ../tdf_patterns/tdfatpg_ndet3_c880.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet3_c1355.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet3_c1355.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet3_c2670.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet3_c2670.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet3_c3540.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet3_c3540.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet3_c6288.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet3_c6288.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet3_c7552.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet3_c7552.pat)

./atpg -tdfatpg -ndet 4 ../sample_circuits/c432.ckt  > ../tdf_patterns/tdfatpg_ndet4_c432.pat 
./atpg -tdfatpg -ndet 4 ../sample_circuits/c499.ckt  > ../tdf_patterns/tdfatpg_ndet4_c499.pat 
./atpg -tdfatpg -ndet 4 ../sample_circuits/c880.ckt  > ../tdf_patterns/tdfatpg_ndet4_c880.pat 
./atpg -tdfatpg -ndet 4 ../sample_circuits/c1355.ckt > ../tdf_patterns/tdfatpg_ndet4_c1355.pat
./atpg -tdfatpg -ndet 4 ../sample_circuits/c2670.ckt > ../tdf_patterns/tdfatpg_ndet4_c2670.pat
./atpg -tdfatpg -ndet 4 ../sample_circuits/c3540.ckt > ../tdf_patterns/tdfatpg_ndet4_c3540.pat
./atpg -tdfatpg -ndet 4 ../sample_circuits/c6288.ckt > ../tdf_patterns/tdfatpg_ndet4_c6288.pat
./atpg -tdfatpg -ndet 4 ../sample_circuits/c7552.ckt > ../tdf_patterns/tdfatpg_ndet4_c7552.pat


./atpg -tdfatpg -ndet 4 -compression ../sample_circuits/c432.ckt  > ../tdf_patterns/tdfatpg_compress_ndet4_c432.pat 
./atpg -tdfatpg -ndet 4 -compression ../sample_circuits/c499.ckt  > ../tdf_patterns/tdfatpg_compress_ndet4_c499.pat 
./atpg -tdfatpg -ndet 4 -compression ../sample_circuits/c880.ckt  > ../tdf_patterns/tdfatpg_compress_ndet4_c880.pat 
./atpg -tdfatpg -ndet 4 -compression ../sample_circuits/c1355.ckt > ../tdf_patterns/tdfatpg_compress_ndet4_c1355.pat
./atpg -tdfatpg -ndet 4 -compression ../sample_circuits/c2670.ckt > ../tdf_patterns/tdfatpg_compress_ndet4_c2670.pat
./atpg -tdfatpg -ndet 4 -compression ../sample_circuits/c3540.ckt > ../tdf_patterns/tdfatpg_compress_ndet4_c3540.pat
./atpg -tdfatpg -ndet 4 -compression ../sample_circuits/c6288.ckt > ../tdf_patterns/tdfatpg_compress_ndet4_c6288.pat
./atpg -tdfatpg -ndet 4 -compression ../sample_circuits/c7552.ckt > ../tdf_patterns/tdfatpg_compress_ndet4_c7552.pat

echo "N detect 4 compressed and uncompressed result"
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet4_c432.pat)  <(grep '#' ../tdf_patterns/tdfatpg_ndet4_c432.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet4_c499.pat)  <(grep '#' ../tdf_patterns/tdfatpg_ndet4_c499.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet4_c880.pat)  <(grep '#' ../tdf_patterns/tdfatpg_ndet4_c880.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet4_c1355.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet4_c1355.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet4_c2670.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet4_c2670.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet4_c3540.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet4_c3540.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet4_c6288.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet4_c6288.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet4_c7552.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet4_c7552.pat)

./atpg -tdfatpg -ndet 5 ../sample_circuits/c432.ckt  > ../tdf_patterns/tdfatpg_ndet5_c432.pat 
./atpg -tdfatpg -ndet 5 ../sample_circuits/c499.ckt  > ../tdf_patterns/tdfatpg_ndet5_c499.pat 
./atpg -tdfatpg -ndet 5 ../sample_circuits/c880.ckt  > ../tdf_patterns/tdfatpg_ndet5_c880.pat 
./atpg -tdfatpg -ndet 5 ../sample_circuits/c1355.ckt > ../tdf_patterns/tdfatpg_ndet5_c1355.pat
./atpg -tdfatpg -ndet 5 ../sample_circuits/c2670.ckt > ../tdf_patterns/tdfatpg_ndet5_c2670.pat
./atpg -tdfatpg -ndet 5 ../sample_circuits/c3540.ckt > ../tdf_patterns/tdfatpg_ndet5_c3540.pat
./atpg -tdfatpg -ndet 5 ../sample_circuits/c6288.ckt > ../tdf_patterns/tdfatpg_ndet5_c6288.pat
./atpg -tdfatpg -ndet 5 ../sample_circuits/c7552.ckt > ../tdf_patterns/tdfatpg_ndet5_c7552.pat


./atpg -tdfatpg -ndet 5 -compression ../sample_circuits/c432.ckt  > ../tdf_patterns/tdfatpg_compress_ndet5_c432.pat 
./atpg -tdfatpg -ndet 5 -compression ../sample_circuits/c499.ckt  > ../tdf_patterns/tdfatpg_compress_ndet5_c499.pat 
./atpg -tdfatpg -ndet 5 -compression ../sample_circuits/c880.ckt  > ../tdf_patterns/tdfatpg_compress_ndet5_c880.pat 
./atpg -tdfatpg -ndet 5 -compression ../sample_circuits/c1355.ckt > ../tdf_patterns/tdfatpg_compress_ndet5_c1355.pat
./atpg -tdfatpg -ndet 5 -compression ../sample_circuits/c2670.ckt > ../tdf_patterns/tdfatpg_compress_ndet5_c2670.pat
./atpg -tdfatpg -ndet 5 -compression ../sample_circuits/c3540.ckt > ../tdf_patterns/tdfatpg_compress_ndet5_c3540.pat
./atpg -tdfatpg -ndet 5 -compression ../sample_circuits/c6288.ckt > ../tdf_patterns/tdfatpg_compress_ndet5_c6288.pat
./atpg -tdfatpg -ndet 5 -compression ../sample_circuits/c7552.ckt > ../tdf_patterns/tdfatpg_compress_ndet5_c7552.pat

echo "N detect 5 compressed and uncompressed result"
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet5_c432.pat)  <(grep '#' ../tdf_patterns/tdfatpg_ndet5_c432.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet5_c499.pat)  <(grep '#' ../tdf_patterns/tdfatpg_ndet5_c499.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet5_c880.pat)  <(grep '#' ../tdf_patterns/tdfatpg_ndet5_c880.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet5_c1355.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet5_c1355.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet5_c2670.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet5_c2670.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet5_c3540.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet5_c3540.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet5_c6288.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet5_c6288.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet5_c7552.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet5_c7552.pat)

./atpg -tdfatpg -ndet 6 ../sample_circuits/c432.ckt  > ../tdf_patterns/tdfatpg_ndet6_c432.pat 
./atpg -tdfatpg -ndet 6 ../sample_circuits/c499.ckt  > ../tdf_patterns/tdfatpg_ndet6_c499.pat 
./atpg -tdfatpg -ndet 6 ../sample_circuits/c880.ckt  > ../tdf_patterns/tdfatpg_ndet6_c880.pat 
./atpg -tdfatpg -ndet 6 ../sample_circuits/c1355.ckt > ../tdf_patterns/tdfatpg_ndet6_c1355.pat
./atpg -tdfatpg -ndet 6 ../sample_circuits/c2670.ckt > ../tdf_patterns/tdfatpg_ndet6_c2670.pat
./atpg -tdfatpg -ndet 6 ../sample_circuits/c3540.ckt > ../tdf_patterns/tdfatpg_ndet6_c3540.pat
./atpg -tdfatpg -ndet 6 ../sample_circuits/c6288.ckt > ../tdf_patterns/tdfatpg_ndet6_c6288.pat
./atpg -tdfatpg -ndet 6 ../sample_circuits/c7552.ckt > ../tdf_patterns/tdfatpg_ndet6_c7552.pat


./atpg -tdfatpg -ndet 6 -compression ../sample_circuits/c432.ckt  > ../tdf_patterns/tdfatpg_compress_ndet6_c432.pat 
./atpg -tdfatpg -ndet 6 -compression ../sample_circuits/c499.ckt  > ../tdf_patterns/tdfatpg_compress_ndet6_c499.pat 
./atpg -tdfatpg -ndet 6 -compression ../sample_circuits/c880.ckt  > ../tdf_patterns/tdfatpg_compress_ndet6_c880.pat 
./atpg -tdfatpg -ndet 6 -compression ../sample_circuits/c1355.ckt > ../tdf_patterns/tdfatpg_compress_ndet6_c1355.pat
./atpg -tdfatpg -ndet 6 -compression ../sample_circuits/c2670.ckt > ../tdf_patterns/tdfatpg_compress_ndet6_c2670.pat
./atpg -tdfatpg -ndet 6 -compression ../sample_circuits/c3540.ckt > ../tdf_patterns/tdfatpg_compress_ndet6_c3540.pat
./atpg -tdfatpg -ndet 6 -compression ../sample_circuits/c6288.ckt > ../tdf_patterns/tdfatpg_compress_ndet6_c6288.pat
./atpg -tdfatpg -ndet 6 -compression ../sample_circuits/c7552.ckt > ../tdf_patterns/tdfatpg_compress_ndet6_c7552.pat

echo "N detect 6 compressed and uncompressed result"
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet6_c432.pat)  <(grep '#' ../tdf_patterns/tdfatpg_ndet6_c432.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet6_c499.pat)  <(grep '#' ../tdf_patterns/tdfatpg_ndet6_c499.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet6_c880.pat)  <(grep '#' ../tdf_patterns/tdfatpg_ndet6_c880.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet6_c1355.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet6_c1355.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet6_c2670.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet6_c2670.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet6_c3540.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet6_c3540.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet6_c6288.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet6_c6288.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet6_c7552.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet6_c7552.pat)

./atpg -tdfatpg -ndet 7 ../sample_circuits/c432.ckt  > ../tdf_patterns/tdfatpg_ndet7_c432.pat 
./atpg -tdfatpg -ndet 7 ../sample_circuits/c499.ckt  > ../tdf_patterns/tdfatpg_ndet7_c499.pat 
./atpg -tdfatpg -ndet 7 ../sample_circuits/c880.ckt  > ../tdf_patterns/tdfatpg_ndet7_c880.pat 
./atpg -tdfatpg -ndet 7 ../sample_circuits/c1355.ckt > ../tdf_patterns/tdfatpg_ndet7_c1355.pat
./atpg -tdfatpg -ndet 7 ../sample_circuits/c2670.ckt > ../tdf_patterns/tdfatpg_ndet7_c2670.pat
./atpg -tdfatpg -ndet 7 ../sample_circuits/c3540.ckt > ../tdf_patterns/tdfatpg_ndet7_c3540.pat
./atpg -tdfatpg -ndet 7 ../sample_circuits/c6288.ckt > ../tdf_patterns/tdfatpg_ndet7_c6288.pat
./atpg -tdfatpg -ndet 7 ../sample_circuits/c7552.ckt > ../tdf_patterns/tdfatpg_ndet7_c7552.pat


./atpg -tdfatpg -ndet 7 -compression ../sample_circuits/c432.ckt  > ../tdf_patterns/tdfatpg_compress_ndet7_c432.pat 
./atpg -tdfatpg -ndet 7 -compression ../sample_circuits/c499.ckt  > ../tdf_patterns/tdfatpg_compress_ndet7_c499.pat 
./atpg -tdfatpg -ndet 7 -compression ../sample_circuits/c880.ckt  > ../tdf_patterns/tdfatpg_compress_ndet7_c880.pat 
./atpg -tdfatpg -ndet 7 -compression ../sample_circuits/c1355.ckt > ../tdf_patterns/tdfatpg_compress_ndet7_c1355.pat
./atpg -tdfatpg -ndet 7 -compression ../sample_circuits/c2670.ckt > ../tdf_patterns/tdfatpg_compress_ndet7_c2670.pat
./atpg -tdfatpg -ndet 7 -compression ../sample_circuits/c3540.ckt > ../tdf_patterns/tdfatpg_compress_ndet7_c3540.pat
./atpg -tdfatpg -ndet 7 -compression ../sample_circuits/c6288.ckt > ../tdf_patterns/tdfatpg_compress_ndet7_c6288.pat
./atpg -tdfatpg -ndet 7 -compression ../sample_circuits/c7552.ckt > ../tdf_patterns/tdfatpg_compress_ndet7_c7552.pat

echo "N detect 7 compressed and uncompressed result"
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet7_c432.pat)  <(grep '#' ../tdf_patterns/tdfatpg_ndet7_c432.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet7_c499.pat)  <(grep '#' ../tdf_patterns/tdfatpg_ndet7_c499.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet7_c880.pat)  <(grep '#' ../tdf_patterns/tdfatpg_ndet7_c880.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet7_c1355.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet7_c1355.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet7_c2670.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet7_c2670.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet7_c3540.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet7_c3540.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet7_c6288.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet7_c6288.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet7_c7552.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet7_c7552.pat)

./atpg -tdfatpg -ndet 8 ../sample_circuits/c432.ckt  > ../tdf_patterns/tdfatpg_ndet8_c432.pat 
./atpg -tdfatpg -ndet 8 ../sample_circuits/c499.ckt  > ../tdf_patterns/tdfatpg_ndet8_c499.pat 
./atpg -tdfatpg -ndet 8 ../sample_circuits/c880.ckt  > ../tdf_patterns/tdfatpg_ndet8_c880.pat 
./atpg -tdfatpg -ndet 8 ../sample_circuits/c1355.ckt > ../tdf_patterns/tdfatpg_ndet8_c1355.pat
./atpg -tdfatpg -ndet 8 ../sample_circuits/c2670.ckt > ../tdf_patterns/tdfatpg_ndet8_c2670.pat
./atpg -tdfatpg -ndet 8 ../sample_circuits/c3540.ckt > ../tdf_patterns/tdfatpg_ndet8_c3540.pat
./atpg -tdfatpg -ndet 8 ../sample_circuits/c6288.ckt > ../tdf_patterns/tdfatpg_ndet8_c6288.pat
./atpg -tdfatpg -ndet 8 ../sample_circuits/c7552.ckt > ../tdf_patterns/tdfatpg_ndet8_c7552.pat


./atpg -tdfatpg -ndet 8 -compression ../sample_circuits/c432.ckt  > ../tdf_patterns/tdfatpg_compress_ndet8_c432.pat 
./atpg -tdfatpg -ndet 8 -compression ../sample_circuits/c499.ckt  > ../tdf_patterns/tdfatpg_compress_ndet8_c499.pat 
./atpg -tdfatpg -ndet 8 -compression ../sample_circuits/c880.ckt  > ../tdf_patterns/tdfatpg_compress_ndet8_c880.pat 
./atpg -tdfatpg -ndet 8 -compression ../sample_circuits/c1355.ckt > ../tdf_patterns/tdfatpg_compress_ndet8_c1355.pat
./atpg -tdfatpg -ndet 8 -compression ../sample_circuits/c2670.ckt > ../tdf_patterns/tdfatpg_compress_ndet8_c2670.pat
./atpg -tdfatpg -ndet 8 -compression ../sample_circuits/c3540.ckt > ../tdf_patterns/tdfatpg_compress_ndet8_c3540.pat
./atpg -tdfatpg -ndet 8 -compression ../sample_circuits/c6288.ckt > ../tdf_patterns/tdfatpg_compress_ndet8_c6288.pat
./atpg -tdfatpg -ndet 8 -compression ../sample_circuits/c7552.ckt > ../tdf_patterns/tdfatpg_compress_ndet8_c7552.pat

echo "N detect 8 compressed and uncompressed result"
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet8_c432.pat)  <(grep '#' ../tdf_patterns/tdfatpg_ndet8_c432.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet8_c499.pat)  <(grep '#' ../tdf_patterns/tdfatpg_ndet8_c499.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet8_c880.pat)  <(grep '#' ../tdf_patterns/tdfatpg_ndet8_c880.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet8_c1355.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet8_c1355.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet8_c2670.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet8_c2670.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet8_c3540.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet8_c3540.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet8_c6288.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet8_c6288.pat)
diff <(grep '#' ../tdf_patterns/tdfatpg_compress_ndet8_c7552.pat) <(grep '#' ../tdf_patterns/tdfatpg_ndet8_c7552.pat)