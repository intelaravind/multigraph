export CUDPP_DIR=./cudpp

export CUDPP_LIB=$CUDPP_DIR/lib
export CUDPP_INCLUDE=$CUDPP_DIR/include


cd code

#for j in bfs sssp prd bc bfs_s sssp_s cc_s prd_s bc_s bfs_d sssp_d prd_d prt_d
echo "Testing MultiGraph (hybrid)"
for j in BC BFS SSSP DATA_DRIVEN_PR 
do
echo "running $j(original node numbering)"
for i in soc-LiveJournal1 soc-orkut hollywood-2009 indochina-2004 rmat24 kron_g500-logn21 rgg_n_2_24_s0 road_usa roadNet-CA
do
echo -n ${i},
./${j} ../${i}/${i}.mtx 0 10
done
echo
echo "running $j(random re-numbering)"
echo -n soc-LiveJournal1,
./${j} ../soc-LiveJournal1_/soc-LiveJournal1_.mtx 3266740 10
echo -n soc-orkut,
./${j} ../soc-orkut_/soc-orkut_.mtx 17047 10
echo -n hollywood-2009,
./${j} ../hollywood-2009_/hollywood-2009_.mtx 775106 10
echo -n indochina-2004,
./${j} ../indochina-2004_/indochina-2004_.mtx 6750856 10 
echo -n rmat24,
./${j} ../rmat24_/rmat24_.mtx 0 10
echo -n kron_g500-logn21,
./${j} ../kron_g500-logn21_/kron_g500-logn21_.mtx 495356 10 
echo -n rgg_n_2_24_s0,
./${j} ../rgg_n_2_24_s0_/rgg_n_2_24_s0_.mtx 8934858 10 
echo -n road_usa,
./${j} ../road_usa_/road_usa_.mtx 15916361 10
echo -n roadNet-CA,
./${j} ../roadNet-CA_/roadNet-CA_.mtx 1916604 10
echo
done
echo

echo "Testing MultiGraphS (sparse)"
for j in BC_SPARSE BFS_SPARSE CC_SPARSE DATA_DRIVEN_PR_SPARSE SSSP_SPARSE
do
echo "running $j(original node numbering)"
for i in soc-LiveJournal1 soc-orkut hollywood-2009 indochina-2004 rmat24 road_usa rgg_n_2_24_s0 kron_g500-logn21 roadNet-CA
do
echo -n ${i},
./${j} ../${i}/${i}.mtx 0 10 
done
echo
echo "running $j(random re-numbering)"
echo -n soc-LiveJournal1,
./${j} ../soc-LiveJournal1_/soc-LiveJournal1_.mtx 3266740 10 
echo -n soc-orkut,
./${j} ../soc-orkut_/soc-orkut_.mtx 17047 10 
echo -n hollywood-2009,
./${j} ../hollywood-2009_/hollywood-2009_.mtx 775106 10 
echo -n indochina-2004,
./${j} ../indochina-2004_/indochina-2004_.mtx 6750856 10 
echo -n rmat24,
./${j} ../rmat24_/rmat24_.mtx 0 10 
echo -n kron_g500-logn21,
./${j} ../kron_g500-logn21_/kron_g500-logn21_.mtx 495356 10 
echo -n rgg_n_2_24_s0,
./${j} ../rgg_n_2_24_s0_/rgg_n_2_24_s0_.mtx 8934858 10 
echo -n road_usa,
./${j} ../road_usa_/road_usa_.mtx 15916361 10 
echo -n roadNet-CA,
./${j} ../roadNet-CA_/roadNet-CA_.mtx 1916604 10 
echo
done
echo

echo "Testing MultiGraphD (dense)"
for j in BC_DENSE BFS_DENSE DATA_DRIVEN_PR_DENSE TOPOLOGY_DRIVEN_PR_DENSE SSSP_DENSE
do
echo "running $j(original node numbering)"
for i in soc-LiveJournal1 soc-orkut hollywood-2009 indochina-2004 rmat24 road_usa rgg_n_2_24_s0 kron_g500-logn21 roadNet-CA
do
echo -n ${i},
./${j} ../${i}/${i}.mtx 0 10 
done
echo
echo "running $j(random re-numbering)"
echo -n soc-LiveJournal1,
./${j} ../soc-LiveJournal1_/soc-LiveJournal1_.mtx 3266740 10 
echo -n soc-orkut,
./${j} ../soc-orkut_/soc-orkut_.mtx 17047 10 
echo -n hollywood-2009,
./${j} ../hollywood-2009_/hollywood-2009_.mtx 775106 10 
echo -n indochina-2004,
./${j} ../indochina-2004_/indochina-2004_.mtx 6750856 10 
echo -n rmat24,
./${j} ../rmat24_/rmat24_.mtx 0 10 
echo -n kron_g500-logn21,
./${j} ../kron_g500-logn21_/kron_g500-logn21_.mtx 495356 10 
echo -n rgg_n_2_24_s0,
./${j} ../rgg_n_2_24_s0_/rgg_n_2_24_s0_.mtx 8934858 10 
echo -n road_usa,
./${j} ../road_usa_/road_usa_.mtx 15916361 10 
echo -n roadNet-CA,
./${j} ../roadNet-CA_/roadNet-CA_.mtx 1916604 10 
echo
done

cd ..
########



cd CuSha/
#for i in cusha_bfs cusha_cc cusha_sssp cusha_pr
#do
#for j in soc-LiveJournal1 soc-orkut hollywood-2009 indochina-2004 rmat24 road_usa rgg_n_2_24_s0 kron_g500-logn21 roadNet-CA
#do
#./${i} ${j}.
#done
#done

echo "Cusha BFS (Original numbering)"
for j in soc-LiveJournal1 soc-orkut hollywood-2009 indochina-2004 rmat24 road_usa rgg_n_2_24_s0 kron_g500-logn21 roadNet-CA
do
./cusha_bfs --input ../${j}/${j}.cusha1 --method CW 
done
echo "Cusha BFS (Random numbering)"
./cusha_bfs --input ../soc-LiveJournal1_/soc-LiveJournal1_.cusha1 --method CW --arbparam 3266740
./cusha_bfs --input ../soc-orkut_/soc-orkut_.cusha1 --method CW --arbparam 17047
./cusha_bfs --input ../hollywood-2009_/hollywood-2009_.cusha1 --method CW --arbparam 775106
./cusha_bfs --input ../indochina-2004_/indochina-2004_.cusha1 --method CW --arbparam 6750856
./cusha_bfs --input ../rmat24_/rmat24_.cusha1 --method CW --arbparam 0
./cusha_bfs --input ../kron_g500-logn21_/kron_g500-logn21_.cusha1 --method CW --arbparam 495356
./cusha_bfs --input ../rgg_n_2_24_s0_/rgg_n_2_24_s0_.cusha1 --method CW --arbparam 8934858
./cusha_bfs --input ../road_usa_/road_usa_.cusha1 --method CW --arbparam 15916361
./cusha_bfs --input ../roadNet-CA_/roadNet-CA_.cusha1 --method CW --arbparam 1916604


echo "Cusha CC (Original numbering)"
for j in soc-LiveJournal1 soc-orkut hollywood-2009 indochina-2004 rmat24 road_usa rgg_n_2_24_s0 kron_g500-logn21 roadNet-CA
do
./cusha_cc ${j} --input ../${j}/${j}.cusha1 --method CW 
done
echo "Cusha CC (Random numbering)"
./cusha_cc --input ../soc-LiveJournal1_/soc-LiveJournal1_.cusha1 --method CW --arbparam 3266740
./cusha_cc --input ../soc-orkut_/soc-orkut_.cusha1 --method CW --arbparam 17047
./cusha_cc --input ../hollywood-2009_/hollywood-2009_.cusha1 --method CW --arbparam 775106
./cusha_cc --input ../indochina-2004_/indochina-2004_.cusha1 --method CW --arbparam 6750856
./cusha_cc --input ../rmat24_/rmat24_.cusha1 --method CW --arbparam 0
./cusha_cc --input ../kron_g500-logn21_/kron_g500-logn21_.cusha1 --method CW --arbparam 495356
./cusha_cc --input ../rgg_n_2_24_s0_/rgg_n_2_24_s0_.cusha1 --method CW --arbparam 8934858
./cusha_cc --input ../road_usa_/road_usa_.cusha1 --method CW --arbparam 15916361
./cusha_cc --input ../roadNet-CA_/roadNet-CA_.cusha1 --method CW --arbparam 1916604


echo "Cusha SSSP (Original numbering)"
for j in soc-LiveJournal1 soc-orkut hollywood-2009 indochina-2004 rmat24 road_usa rgg_n_2_24_s0 kron_g500-logn21 roadNet-CA
do
./cusha_sssp --input ../${j}/${j}.cusha2 --method CW 
done
echo "Cusha SSSP (Random numbering)"
./cusha_sssp --input ../soc-LiveJournal1_/soc-LiveJournal1_.cusha2 --method CW --arbparam 3266740
./cusha_sssp --input ../soc-orkut_/soc-orkut_.cusha2 --method CW --arbparam 17047
./cusha_sssp --input ../hollywood-2009_/hollywood-2009_.cusha2 --method CW --arbparam 775106
./cusha_sssp --input ../indochina-2004_/indochina-2004_.cusha2 --method CW --arbparam 6750856
./cusha_sssp --input ../rmat24_/rmat24_.cusha2 --method CW --arbparam 0
./cusha_sssp --input ../kron_g500-logn21_/kron_g500-logn21_.cusha2 --method CW --arbparam 495356
./cusha_sssp --input ../rgg_n_2_24_s0_/rgg_n_2_24_s0_.cusha2 --method CW --arbparam 8934858
./cusha_sssp --input ../road_usa_/road_usa_.cusha2 --method CW --arbparam 15916361
./cusha_sssp --input ../roadNet-CA_/roadNet-CA_.cusha2 --method CW --arbparam 1916604


echo "Cusha PR (Original numbering)"
for j in soc-LiveJournal1 soc-orkut hollywood-2009 indochina-2004 rmat24 road_usa rgg_n_2_24_s0 kron_g500-logn21 roadNet-CA
do
./cusha_pr --input ../${j}/${j}.cusha3 --method CW 
done
echo "Cusha PR (Random numbering)"
./cusha_pr --input ../soc-LiveJournal1_/soc-LiveJournal1_.cusha3 --method CW --arbparam 3266740
./cusha_pr --input ../soc-orkut_/soc-orkut_.cusha3 --method CW --arbparam 17047
./cusha_pr --input ../hollywood-2009_/hollywood-2009_.cusha3 --method CW --arbparam 775106
./cusha_pr --input ../indochina-2004_/indochina-2004_.cusha3 --method CW --arbparam 6750856
./cusha_pr --input ../rmat24_/rmat24_.cusha3 --method CW --arbparam 0
./cusha_pr --input ../kron_g500-logn21_/kron_g500-logn21_.cusha3 --method CW --arbparam 495356
./cusha_pr --input ../rgg_n_2_24_s0_/rgg_n_2_24_s0_.cusha3 --method CW --arbparam 8934858
./cusha_pr --input ../road_usa_/road_usa_.cusha3 --method CW --arbparam 15916361
./cusha_pr --input ../roadNet-CA_/roadNet-CA_.cusha3 --method CW --arbparam 1916604

cd ..

cd WS-VR
cd src

echo "WS BFS (Original numbering)"
for j in soc-LiveJournal1 soc-orkut hollywood-2009 indochina-2004 rmat24 road_usa rgg_n_2_24_s0 kron_g500-logn21 roadNet-CA
do
./cusha_bfs --edgelist ../${j}/${j}.cusha1  
done
echo "WS BFS (Random numbering)"
./cusha_bfs --edgelist ../soc-LiveJournal1_/soc-LiveJournal1_.cusha1  --arbparam 3266740
./cusha_bfs --edgelist ../soc-orkut_/soc-orkut_.cusha1  --arbparam 17047
./cusha_bfs --edgelist ../hollywood-2009_/hollywood-2009_.cusha1  --arbparam 775106
./cusha_bfs --edgelist ../indochina-2004_/indochina-2004_.cusha1  --arbparam 6750856
./cusha_bfs --edgelist ../rmat24_/rmat24_.cusha1  --arbparam 0
./cusha_bfs --edgelist ../kron_g500-logn21_/kron_g500-logn21_.cusha1  --arbparam 495356
./cusha_bfs --edgelist ../rgg_n_2_24_s0_/rgg_n_2_24_s0_.cusha1  --arbparam 8934858
./cusha_bfs --edgelist ../road_usa_/road_usa_.cusha1  --arbparam 15916361
./cusha_bfs --edgelist ../roadNet-CA_/roadNet-CA_.cusha1  --arbparam 1916604


echo "WS CC (Original numbering)"
for j in soc-LiveJournal1 soc-orkut hollywood-2009 indochina-2004 rmat24 road_usa rgg_n_2_24_s0 kron_g500-logn21 roadNet-CA
do
./cusha_cc ${j} --edgelist ../${j}/${j}.cusha1  
done
echo "WS CC (Random numbering)"
./cusha_cc --edgelist ../soc-LiveJournal1_/soc-LiveJournal1_.cusha1  --arbparam 3266740
./cusha_cc --edgelist ../soc-orkut_/soc-orkut_.cusha1  --arbparam 17047
./cusha_cc --edgelist ../hollywood-2009_/hollywood-2009_.cusha1  --arbparam 775106
./cusha_cc --edgelist ../indochina-2004_/indochina-2004_.cusha1  --arbparam 6750856
./cusha_cc --edgelist ../rmat24_/rmat24_.cusha1  --arbparam 0
./cusha_cc --edgelist ../kron_g500-logn21_/kron_g500-logn21_.cusha1  --arbparam 495356
./cusha_cc --edgelist ../rgg_n_2_24_s0_/rgg_n_2_24_s0_.cusha1  --arbparam 8934858
./cusha_cc --edgelist ../road_usa_/road_usa_.cusha1  --arbparam 15916361
./cusha_cc --edgelist ../roadNet-CA_/roadNet-CA_.cusha1  --arbparam 1916604


echo "WS SSSP (Original numbering)"
for j in soc-LiveJournal1 soc-orkut hollywood-2009 indochina-2004 rmat24 road_usa rgg_n_2_24_s0 kron_g500-logn21 roadNet-CA
do
./cusha_sssp --edgelist ../${j}/${j}.cusha2  
done
echo "WS SSSP (Random numbering)"
./cusha_sssp --edgelist ../soc-LiveJournal1_/soc-LiveJournal1_.cusha2  --arbparam 3266740
./cusha_sssp --edgelist ../soc-orkut_/soc-orkut_.cusha2  --arbparam 17047
./cusha_sssp --edgelist ../hollywood-2009_/hollywood-2009_.cusha2  --arbparam 775106
./cusha_sssp --edgelist ../indochina-2004_/indochina-2004_.cusha2  --arbparam 6750856
./cusha_sssp --edgelist ../rmat24_/rmat24_.cusha2  --arbparam 0
./cusha_sssp --edgelist ../kron_g500-logn21_/kron_g500-logn21_.cusha2  --arbparam 495356
./cusha_sssp --edgelist ../rgg_n_2_24_s0_/rgg_n_2_24_s0_.cusha2  --arbparam 8934858
./cusha_sssp --edgelist ../road_usa_/road_usa_.cusha2  --arbparam 15916361
./cusha_sssp --edgelist ../roadNet-CA_/roadNet-CA_.cusha2  --arbparam 1916604


echo "WS PR (Original numbering)"
for j in soc-LiveJournal1 soc-orkut hollywood-2009 indochina-2004 rmat24 road_usa rgg_n_2_24_s0 kron_g500-logn21 roadNet-CA
do
./cusha_pr --edgelist ../${j}/${j}.cusha3  
done
echo "WS PR (Random numbering)"
./cusha_pr --edgelist ../soc-LiveJournal1_/soc-LiveJournal1_.cusha3  --arbparam 3266740
./cusha_pr --edgelist ../soc-orkut_/soc-orkut_.cusha3  --arbparam 17047
./cusha_pr --edgelist ../hollywood-2009_/hollywood-2009_.cusha3  --arbparam 775106
./cusha_pr --edgelist ../indochina-2004_/indochina-2004_.cusha3  --arbparam 6750856
./cusha_pr --edgelist ../rmat24_/rmat24_.cusha3  --arbparam 0
./cusha_pr --edgelist ../kron_g500-logn21_/kron_g500-logn21_.cusha3  --arbparam 495356
./cusha_pr --edgelist ../rgg_n_2_24_s0_/rgg_n_2_24_s0_.cusha3  --arbparam 8934858
./cusha_pr --edgelist ../road_usa_/road_usa_.cusha3  --arbparam 15916361
./cusha_pr --edgelist ../roadNet-CA_/roadNet-CA_.cusha3  --arbparam 1916604

cd ..
cd ..

#######################
cd ppopp17-artifact/code/groute/build
cd ..
cd ..

cd gunrock/build/bin

for i in bc bfs cc pr sssp
do
for j in soc-LiveJournal1 soc-orkut hollywood-2009 indochina-2004 rmat24 road_usa rgg_n_2_24_s0 kron_g500-logn21 roadNet-CA
do
./${i} market ../../../${j}/${j}.mtx --quick
done
done
cd ..
cd ..
cd ..
cd ..


