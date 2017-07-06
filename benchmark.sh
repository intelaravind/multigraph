#!/bin/bash

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
./ws_bfs --edgelist ../../${j}/${j}.cusha1  
done
echo "WS BFS (Random numbering)"
./ws_bfs --edgelist ../../soc-LiveJournal1_/soc-LiveJournal1_.cusha1  --arbparam 3266740
./ws_bfs --edgelist ../../soc-orkut_/soc-orkut_.cusha1  --arbparam 17047
./ws_bfs --edgelist ../../hollywood-2009_/hollywood-2009_.cusha1  --arbparam 775106
./ws_bfs --edgelist ../../indochina-2004_/indochina-2004_.cusha1  --arbparam 6750856
./ws_bfs --edgelist ../../rmat24_/rmat24_.cusha1  --arbparam 0
./ws_bfs --edgelist ../../kron_g500-logn21_/kron_g500-logn21_.cusha1  --arbparam 495356
./ws_bfs --edgelist ../../rgg_n_2_24_s0_/rgg_n_2_24_s0_.cusha1  --arbparam 8934858
./ws_bfs --edgelist ../../road_usa_/road_usa_.cusha1  --arbparam 15916361
./ws_bfs --edgelist ../../roadNet-CA_/roadNet-CA_.cusha1  --arbparam 1916604


echo "WS CC (Original numbering)"
for j in soc-LiveJournal1 soc-orkut hollywood-2009 indochina-2004 rmat24 road_usa rgg_n_2_24_s0 kron_g500-logn21 roadNet-CA
do
./ws_cc ${j} --edgelist ../../${j}/${j}.cusha1  
done
echo "WS CC (Random numbering)"
./ws_cc --edgelist ../../soc-LiveJournal1_/soc-LiveJournal1_.cusha1  --arbparam 3266740
./ws_cc --edgelist ../../soc-orkut_/soc-orkut_.cusha1  --arbparam 17047
./ws_cc --edgelist ../../hollywood-2009_/hollywood-2009_.cusha1  --arbparam 775106
./ws_cc --edgelist ../../indochina-2004_/indochina-2004_.cusha1  --arbparam 6750856
./ws_cc --edgelist ../../rmat24_/rmat24_.cusha1  --arbparam 0
./ws_cc --edgelist ../../kron_g500-logn21_/kron_g500-logn21_.cusha1  --arbparam 495356
./ws_cc --edgelist ../../rgg_n_2_24_s0_/rgg_n_2_24_s0_.cusha1  --arbparam 8934858
./ws_cc --edgelist ../../road_usa_/road_usa_.cusha1  --arbparam 15916361
./ws_cc --edgelist ../../roadNet-CA_/roadNet-CA_.cusha1  --arbparam 1916604


echo "WS SSSP (Original numbering)"
for j in soc-LiveJournal1 soc-orkut hollywood-2009 indochina-2004 rmat24 road_usa rgg_n_2_24_s0 kron_g500-logn21 roadNet-CA
do
./ws_sssp --edgelist ../../${j}/${j}.cusha2  
done
echo "WS SSSP (Random numbering)"
./ws_sssp --edgelist ../../soc-LiveJournal1_/soc-LiveJournal1_.cusha2  --arbparam 3266740
./ws_sssp --edgelist ../../soc-orkut_/soc-orkut_.cusha2  --arbparam 17047
./ws_sssp --edgelist ../../hollywood-2009_/hollywood-2009_.cusha2  --arbparam 775106
./ws_sssp --edgelist ../../indochina-2004_/indochina-2004_.cusha2  --arbparam 6750856
./ws_sssp --edgelist ../../rmat24_/rmat24_.cusha2  --arbparam 0
./ws_sssp --edgelist ../../kron_g500-logn21_/kron_g500-logn21_.cusha2  --arbparam 495356
./ws_sssp --edgelist ../../rgg_n_2_24_s0_/rgg_n_2_24_s0_.cusha2  --arbparam 8934858
./ws_sssp --edgelist ../../road_usa_/road_usa_.cusha2  --arbparam 15916361
./ws_sssp --edgelist ../../roadNet-CA_/roadNet-CA_.cusha2  --arbparam 1916604


echo "WS PR (Original numbering)"
for j in soc-LiveJournal1 soc-orkut hollywood-2009 indochina-2004 rmat24 road_usa rgg_n_2_24_s0 kron_g500-logn21 roadNet-CA
do
./ws_pr --edgelist ../../${j}/${j}.cusha3  
done
echo "WS PR (Random numbering)"
./ws_pr --edgelist ../../soc-LiveJournal1_/soc-LiveJournal1_.cusha3  --arbparam 3266740
./ws_pr --edgelist ../../soc-orkut_/soc-orkut_.cusha3  --arbparam 17047
./ws_pr --edgelist ../../hollywood-2009_/hollywood-2009_.cusha3  --arbparam 775106
./ws_pr --edgelist ../../indochina-2004_/indochina-2004_.cusha3  --arbparam 6750856
./ws_pr --edgelist ../../rmat24_/rmat24_.cusha3  --arbparam 0
./ws_pr --edgelist ../../kron_g500-logn21_/kron_g500-logn21_.cusha3  --arbparam 495356
./ws_pr --edgelist ../../rgg_n_2_24_s0_/rgg_n_2_24_s0_.cusha3  --arbparam 8934858
./ws_pr --edgelist ../../road_usa_/road_usa_.cusha3  --arbparam 15916361
./ws_pr --edgelist ../../roadNet-CA_/roadNet-CA_.cusha3  --arbparam 1916604

cd ..
cd ..

#######################
cd ppopp17-artifact/code/groute/build

echo "Groute BFS(Original numbering)"
./bfs -num_gpus 1 -startwith 1 --prio_delta=100 -source_node=0 -graphfile ../../../../groute_data/original/soc-LiveJournal1/soc-LiveJournal1.gr -output /tmp/bfstmp.txt
./bfs -num_gpus 1 -startwith 1 --prio_delta=100 -source_node=0 -graphfile ../../../../groute_data/original/soc-orkut/soc-orkut.gr -output /tmp/bfstmp.txt
./bfs -num_gpus 1 -startwith 1 --prio_delta=100 -source_node=0 -graphfile ../../../../groute_data/original/hollywood-2009/hollywood-2009.gr -output /tmp/bfstmp.txt
./bfs -num_gpus 1 -startwith 1 --prio_delta=100 -source_node=0 -graphfile ../../../../groute_data/original/indochina-2004/indochina-2004.gr -output /tmp/bfstmp.txt
./bfs -num_gpus 1 -startwith 1 --prio_delta=100 -source_node=0 -graphfile ../../../../groute_data/original/rmat24/rmat24.gr -output /tmp/bfstmp.txt
./bfs -num_gpus 1 -startwith 1 --prio_delta=100 -source_node=0 -graphfile ../../../../groute_data/original/kron_g500-logn21/kron_g500-logn21.gr -output /tmp/bfstmp.txt
./bfs -num_gpus 1 -startwith 1 --prio_delta=32 -source_node=0 -graphfile ../../../../groute_data/original/rgg_n_2_24_s0/rgg_n_2_24_s0.gr -output /tmp/bfstmp.txt
./bfs -num_gpus 1 -startwith 1 --prio_delta=128 -source_node=0 -graphfile ../../../../groute_data/original/road_usa/road_usa.gr -output /tmp/bfstmp.txt
./bfs -num_gpus 1 -startwith 1 --prio_delta=64 -source_node=0 -graphfile ../../../../groute_data/original/roadNet-CA/roadNet-CA.gr -output /tmp/bfstmp.txt


echo "Groute BFS(Random numbering)"
./bfs -num_gpus 1 -startwith 1 --prio_delta=100 -source_node=3266740 -graphfile ../../../../groute_data/renumber/soc-LiveJournal1/soc-LiveJournal1.gr -output /tmp/bfstmp.txt
./bfs -num_gpus 1 -startwith 1 --prio_delta=100 -source_node=17047 -graphfile ../../../../groute_data/renumber/soc-orkut/soc-orkut.gr -output /tmp/bfstmp.txt
./bfs -num_gpus 1 -startwith 1 --prio_delta=100 -source_node=775106 -graphfile ../../../../groute_data/renumber/hollywood-2009/hollywood-2009.gr -output /tmp/bfstmp.txt
./bfs -num_gpus 1 -startwith 1 --prio_delta=100 -source_node=6750856 -graphfile ../../../../groute_data/renumber/indochina-2004/indochina-2004.gr -output /tmp/bfstmp.txt
./bfs -num_gpus 1 -startwith 1 --prio_delta=100 -source_node=0 -graphfile ../../../../groute_data/renumber/rmat24/rmat24.gr -output /tmp/bfstmp.txt
./bfs -num_gpus 1 -startwith 1 --prio_delta=100 -source_node=495356 -graphfile ../../../../groute_data/renumber/kron_g500-logn21/kron_g500-logn21.gr -output /tmp/bfstmp.txt
./bfs -num_gpus 1 -startwith 1 --prio_delta=32 -source_node=8934858 -graphfile ../../../../groute_data/renumber/rgg_n_2_24_s0/rgg_n_2_24_s0.gr -output /tmp/bfstmp.txt
./bfs -num_gpus 1 -startwith 1 --prio_delta=128 -source_node=15916361 -graphfile ../../../../groute_data/renumber/road_usa/road_usa.gr -output /tmp/bfstmp.txt
./bfs -num_gpus 1 -startwith 1 --prio_delta=64 -source_node=1916604 -graphfile ../../../../groute_data/renumber/roadNet-CA/roadNet-CA.gr -output /tmp/bfstmp.txt


echo "Groute SSSP(Original numbering)"
./sssp -num_gpus 1 -startwith 1 --prio_delta=100 -source_node=0 -graphfile ../../../../groute_data/original/soc-LiveJournal1/soc-LiveJournal1.gr -output /tmp/sssptmp.txt
./sssp -num_gpus 1 -startwith 1 --prio_delta=100 -source_node=0 -graphfile ../../../../groute_data/original/soc-orkut/soc-orkut.gr -output /tmp/sssptmp.txt
./sssp -num_gpus 1 -startwith 1 --prio_delta=100 -source_node=0 -graphfile ../../../../groute_data/original/hollywood-2009/hollywood-2009.gr -output /tmp/sssptmp.txt
./sssp -num_gpus 1 -startwith 1 --prio_delta=100 -source_node=0 -graphfile ../../../../groute_data/original/indochina-2004/indochina-2004.gr -output /tmp/sssptmp.txt
./sssp -num_gpus 1 -startwith 1 --prio_delta=100 -source_node=0 -graphfile ../../../../groute_data/original/rmat24/rmat24.gr -output /tmp/sssptmp.txt
./sssp -num_gpus 1 -startwith 1 --prio_delta=100 -source_node=0 -graphfile ../../../../groute_data/original/kron_g500-logn21/kron_g500-logn21.gr -output /tmp/sssptmp.txt
./sssp -num_gpus 1 -startwith 1 --prio_delta=32 -source_node=0 -graphfile ../../../../groute_data/original/rgg_n_2_24_s0/rgg_n_2_24_s0.gr -output /tmp/sssptmp.txt
./sssp -num_gpus 1 -startwith 1 --prio_delta=128 -source_node=0 -graphfile ../../../../groute_data/original/road_usa/road_usa.gr -output /tmp/sssptmp.txt
./sssp -num_gpus 1 -startwith 1 --prio_delta=64 -source_node=0 -graphfile ../../../../groute_data/original/roadNet-CA/roadNet-CA.gr -output /tmp/sssptmp.txt


echo "Groute SSSP(Random numbering)"
./sssp -num_gpus 1 -startwith 1 --prio_delta=100 -source_node=3266740 -graphfile ../../../../groute_data/renumber/soc-LiveJournal1/soc-LiveJournal1.gr -output /tmp/sssptmp.txt
./sssp -num_gpus 1 -startwith 1 --prio_delta=100 -source_node=17047 -graphfile ../../../../groute_data/renumber/soc-orkut/soc-orkut.gr -output /tmp/sssptmp.txt
./sssp -num_gpus 1 -startwith 1 --prio_delta=100 -source_node=775106 -graphfile ../../../../groute_data/renumber/hollywood-2009/hollywood-2009.gr -output /tmp/sssptmp.txt
./sssp -num_gpus 1 -startwith 1 --prio_delta=100 -source_node=6750856 -graphfile ../../../../groute_data/renumber/indochina-2004/indochina-2004.gr -output /tmp/sssptmp.txt
./sssp -num_gpus 1 -startwith 1 --prio_delta=100 -source_node=0 -graphfile ../../../../groute_data/renumber/rmat24/rmat24.gr -output /tmp/sssptmp.txt
./sssp -num_gpus 1 -startwith 1 --prio_delta=100 -source_node=495356 -graphfile ../../../../groute_data/renumber/kron_g500-logn21/kron_g500-logn21.gr -output /tmp/sssptmp.txt
./sssp -num_gpus 1 -startwith 1 --prio_delta=32 -source_node=8934858 -graphfile ../../../../groute_data/renumber/rgg_n_2_24_s0/rgg_n_2_24_s0.gr -output /tmp/sssptmp.txt
./sssp -num_gpus 1 -startwith 1 --prio_delta=128 -source_node=15916361 -graphfile ../../../../groute_data/renumber/road_usa/road_usa.gr -output /tmp/sssptmp.txt
./sssp -num_gpus 1 -startwith 1 --prio_delta=64 -source_node=1916604 -graphfile ../../../../groute_data/renumber/roadNet-CA/roadNet-CA.gr -output /tmp/sssptmp.txt


echo "Groute CC(Original numbering)"
./cc -num_gpus 1 -startwith 1  -graphfile ../../../../groute_data/original/soc-LiveJournal1/soc-LiveJournal1.gr 
./cc -num_gpus 1 -startwith 1  -graphfile ../../../../groute_data/original/soc-orkut/soc-orkut.gr 
./cc -num_gpus 1 -startwith 1  -graphfile ../../../../groute_data/original/hollywood-2009/hollywood-2009.gr 
./cc -num_gpus 1 -startwith 1  -graphfile ../../../../groute_data/original/indochina-2004/indochina-2004.gr 
./cc -num_gpus 1 -startwith 1  -graphfile ../../../../groute_data/original/rmat24/rmat24.gr 
./cc -num_gpus 1 -startwith 1  -graphfile ../../../../groute_data/original/kron_g500-logn21/kron_g500-logn21.gr 
./cc -num_gpus 1 -startwith 1  -graphfile ../../../../groute_data/original/rgg_n_2_24_s0/rgg_n_2_24_s0.gr 
./cc -num_gpus 1 -startwith 1  -graphfile ../../../../groute_data/original/road_usa/road_usa.gr 
./cc -num_gpus 1 -startwith 1  -graphfile ../../../../groute_data/original/roadNet-CA/roadNet-CA.gr 


echo "Groute CC(Random numbering)"
./cc -num_gpus 1 -startwith 1  -graphfile ../../../../groute_data/renumber/soc-LiveJournal1/soc-LiveJournal1.gr 
./cc -num_gpus 1 -startwith 1  -graphfile ../../../../groute_data/renumber/soc-orkut/soc-orkut.gr 
./cc -num_gpus 1 -startwith 1  -graphfile ../../../../groute_data/renumber/hollywood-2009/hollywood-2009.gr 
./cc -num_gpus 1 -startwith 1  -graphfile ../../../../groute_data/renumber/indochina-2004/indochina-2004.gr 
./cc -num_gpus 1 -startwith 1  -graphfile ../../../../groute_data/renumber/rmat24/rmat24.gr 
./cc -num_gpus 1 -startwith 1  -graphfile ../../../../groute_data/renumber/kron_g500-logn21/kron_g500-logn21.gr 
./cc -num_gpus 1 -startwith 1  -graphfile ../../../../groute_data/renumber/rgg_n_2_24_s0/rgg_n_2_24_s0.gr 
./cc -num_gpus 1 -startwith 1  -graphfile ../../../../groute_data/renumber/road_usa/road_usa.gr 
./cc -num_gpus 1 -startwith 1  -graphfile ../../../../groute_data/renumber/roadNet-CA/roadNet-CA.gr 



echo "Groute PR(Original numbering)"
./pr -num_gpus 1 -startwith 1 --prio_delta=100 -graphfile ../../../../groute_data/original/soc-LiveJournal1/soc-LiveJournal1.gr -output /tmp/prtmp.txt
./pr -num_gpus 1 -startwith 1 --prio_delta=100 -graphfile ../../../../groute_data/original/soc-orkut/soc-orkut.gr -output /tmp/prtmp.txt
./pr -num_gpus 1 -startwith 1 --prio_delta=100 -graphfile ../../../../groute_data/original/hollywood-2009/hollywood-2009.gr -output /tmp/prtmp.txt
./pr -num_gpus 1 -startwith 1 --prio_delta=100 -graphfile ../../../../groute_data/original/indochina-2004/indochina-2004.gr -output /tmp/prtmp.txt
./pr -num_gpus 1 -startwith 1 --prio_delta=100 -graphfile ../../../../groute_data/original/rmat24/rmat24.gr -output /tmp/prtmp.txt
./pr -num_gpus 1 -startwith 1 --prio_delta=100 -graphfile ../../../../groute_data/original/kron_g500-logn21/kron_g500-logn21.gr -output /tmp/prtmp.txt
./pr -num_gpus 1 -startwith 1 --prio_delta=32 -graphfile ../../../../groute_data/original/rgg_n_2_24_s0/rgg_n_2_24_s0.gr -output /tmp/prtmp.txt
./pr -num_gpus 1 -startwith 1 --prio_delta=128 -graphfile ../../../../groute_data/original/road_usa/road_usa.gr -output /tmp/prtmp.txt
./pr -num_gpus 1 -startwith 1 --prio_delta=64 -graphfile ../../../../groute_data/original/roadNet-CA/roadNet-CA.gr -output /tmp/prtmp.txt


echo "Groute PR(Random numbering)"
./pr -num_gpus 1 -startwith 1 --prio_delta=100 -graphfile ../../../../groute_data/renumber/soc-LiveJournal1/soc-LiveJournal1.gr -output /tmp/prtmp.txt
./pr -num_gpus 1 -startwith 1 --prio_delta=100 -graphfile ../../../../groute_data/renumber/soc-orkut/soc-orkut.gr -output /tmp/prtmp.txt
./pr -num_gpus 1 -startwith 1 --prio_delta=100 -graphfile ../../../../groute_data/renumber/hollywood-2009/hollywood-2009.gr -output /tmp/prtmp.txt
./pr -num_gpus 1 -startwith 1 --prio_delta=100 -graphfile ../../../../groute_data/renumber/indochina-2004/indochina-2004.gr -output /tmp/prtmp.txt
./pr -num_gpus 1 -startwith 1 --prio_delta=100 -graphfile ../../../../groute_data/renumber/rmat24/rmat24.gr -output /tmp/prtmp.txt
./pr -num_gpus 1 -startwith 1 --prio_delta=100 -graphfile ../../../../groute_data/renumber/kron_g500-logn21/kron_g500-logn21.gr -output /tmp/prtmp.txt
./pr -num_gpus 1 -startwith 1 --prio_delta=32  -graphfile ../../../../groute_data/renumber/rgg_n_2_24_s0/rgg_n_2_24_s0.gr -output /tmp/prtmp.txt
./pr -num_gpus 1 -startwith 1 --prio_delta=128 -graphfile ../../../../groute_data/renumber/road_usa/road_usa.gr -output /tmp/prtmp.txt
./pr -num_gpus 1 -startwith 1 --prio_delta=64  -graphfile ../../../../groute_data/renumber/roadNet-CA/roadNet-CA.gr -output /tmp/prtmp.txt







cd ..
cd ..
#######################
#ppopp17-artifact/code/gunrock/build/bin
cd gunrock/build/bin

export BC_SETTING="--iteration-num=10"


echo "Gunrock BC(Original numbering)"
./bc market ../../../../../soc-LiveJournal1/soc-LiveJournal1.mtx ${BC_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.200" --do_b="0.1" 
./bc market ../../../../../soc-orkut/soc-orkut.mtx ${BC_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.012" --do_b="0.1" 
./bc market ../../../../../hollywood-2009/hollywood-2009.mtx ${BC_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.006" --do_b="0.1" 
./bc market ../../../../../indochina-2004/indochina-2004.mtx ${BC_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="100" --do_b="100" 
./bc market ../../../../../rmat24/rmat24.mtx ${BC_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.00001" --do_b="0.1" 
./bc market ../../../../../kron_g500-logn21/kron_g500-logn21.mtx ${BC_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.00001" --do_b="0.1" 
./bc market ../../../../../rgg_n_2_24_s0/rgg_n_2_24_s0.mtx ${BC_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" 
./bc market ../../../../../road_usa/road_usa.mtx ${BC_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" 
./bc market ../../../../../roadNet-CA/roadNet-CA.mtx ${BC_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" 

echo "Gunrock BC(Random numbering)"
./bc market ../../../../../soc-LiveJournal1_/soc-LiveJournal1_.mtx ${BC_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.200" --do_b="0.1" --src=3266740 
./bc market ../../../../../soc-orkut_/soc-orkut_.mtx ${BC_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.012" --do_b="0.1" --src=17047
./bc market ../../../../../hollywood-2009_/hollywood-2009_.mtx ${BC_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.006" --do_b="0.1" --src=775106
./bc market ../../../../../indochina-2004_/indochina-2004_.mtx ${BC_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="100" --do_b="100"  --src=6750856
./bc market ../../../../../rmat24_/rmat24_.mtx ${BC_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.00001" --do_b="0.1"  --src=0
./bc market ../../../../../kron_g500-logn21_/kron_g500-logn21_.mtx ${BC_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.00001" --do_b="0.1" --src=495356
./bc market ../../../../../rgg_n_2_24_s0_/rgg_n_2_24_s0_.mtx ${BC_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" --src=8934858
./bc market ../../../../../road_usa_/road_usa_.mtx ${BC_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" --src=15916361
./bc market ../../../../../roadNet-CA_/roadNet-CA_.mtx ${BC_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" --src=1916604

export CC_SETTING="--iteration-num=10"

echo "Gunrock CC(Original numbering)"
./cc market ../../../../../soc-LiveJournal1/soc-LiveJournal1.mtx ${CC_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.200" --do_b="0.1" 
./cc market ../../../../../soc-orkut/soc-orkut.mtx ${CC_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.012" --do_b="0.1" 
./cc market ../../../../../hollywood-2009/hollywood-2009.mtx ${CC_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.006" --do_b="0.1" 
./cc market ../../../../../indochina-2004/indochina-2004.mtx ${CC_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="100" --do_b="100" 
./cc market ../../../../../rmat24/rmat24.mtx ${CC_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.00001" --do_b="0.1" 
./cc market ../../../../../kron_g500-logn21/kron_g500-logn21.mtx ${CC_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.00001" --do_b="0.1" 
./cc market ../../../../../rgg_n_2_24_s0/rgg_n_2_24_s0.mtx ${CC_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" 
./cc market ../../../../../road_usa/road_usa.mtx ${CC_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" 
./cc market ../../../../../roadNet-CA/roadNet-CA.mtx ${CC_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" 


echo "Gunrock CC(Random numbering)"
./cc market ../../../../../soc-LiveJournal1_/soc-LiveJournal1_.mtx ${CC_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.200" --do_b="0.1"  
./cc market ../../../../../soc-orkut_/soc-orkut_.mtx ${CC_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.012" --do_b="0.1" 
./cc market ../../../../../hollywood-2009_/hollywood-2009_.mtx ${CC_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.006" --do_b="0.1" 
./cc market ../../../../../indochina-2004_/indochina-2004_.mtx ${CC_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="100" --do_b="100"  
./cc market ../../../../../rmat24_/rmat24_.mtx ${CC_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.00001" --do_b="0.1"  
./cc market ../../../../../kron_g500-logn21_/kron_g500-logn21_.mtx ${CC_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.00001" --do_b="0.1" 
./cc market ../../../../../rgg_n_2_24_s0_/rgg_n_2_24_s0_.mtx ${CC_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" 
./cc market ../../../../../road_usa_/road_usa_.mtx ${CC_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" 
./cc market ../../../../../roadNet-CA_/roadNet-CA_.mtx ${CC_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" 



export BFS_SETTING="--undirected --idempotence --queue-sizing=6.5 --in-sizing=4 --iteration-num=10"



echo "Gunrock BFS(Original numbering)"
./bfs market ../../../../../soc-LiveJournal1/soc-LiveJournal1.mtx ${BFS_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.200" --do_b="0.1" 
./bfs market ../../../../../soc-orkut/soc-orkut.mtx ${BFS_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.012" --do_b="0.1" 
./bfs market ../../../../../hollywood-2009/hollywood-2009.mtx ${BFS_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.006" --do_b="0.1" 
./bfs market ../../../../../indochina-2004/indochina-2004.mtx ${BFS_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="100" --do_b="100" 
./bfs market ../../../../../rmat24/rmat24.mtx ${BFS_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.00001" --do_b="0.1" 
./bfs market ../../../../../kron_g500-logn21/kron_g500-logn21.mtx ${BFS_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.00001" --do_b="0.1" 
./bfs market ../../../../../rgg_n_2_24_s0/rgg_n_2_24_s0.mtx ${BFS_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" 
./bfs market ../../../../../road_usa/road_usa.mtx ${BFS_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" 
./bfs market ../../../../../roadNet-CA/roadNet-CA.mtx ${BFS_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" 

echo "Gunrock BFS(Random numbering)"
./bfs market ../../../../../soc-LiveJournal1_/soc-LiveJournal1_.mtx ${BFS_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.200" --do_b="0.1" --src=3266740 
./bfs market ../../../../../soc-orkut_/soc-orkut_.mtx ${BFS_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.012" --do_b="0.1" --src=17047
./bfs market ../../../../../hollywood-2009_/hollywood-2009_.mtx ${BFS_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.006" --do_b="0.1" --src=775106
./bfs market ../../../../../indochina-2004_/indochina-2004_.mtx ${BFS_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="100" --do_b="100"  --src=6750856
./bfs market ../../../../../rmat24_/rmat24_.mtx ${BFS_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.00001" --do_b="0.1"  --src=0
./bfs market ../../../../../kron_g500-logn21_/kron_g500-logn21_.mtx ${BFS_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.00001" --do_b="0.1" --src=495356
./bfs market ../../../../../rgg_n_2_24_s0_/rgg_n_2_24_s0_.mtx ${BFS_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" --src=8934858
./bfs market ../../../../../road_usa_/road_usa_.mtx ${BFS_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" --src=15916361
./bfs market ../../../../../roadNet-CA_/roadNet-CA_.mtx ${BFS_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" --src=1916604

export PR_SETTING="--iteration-num=10"

echo "Gunrock PR_DATA_DRIVEN(Original numbering)"
./pr market ../../../../../soc-LiveJournal1/soc-LiveJournal1.mtx ${PR_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.200" --do_b="0.1" 
./pr market ../../../../../soc-orkut/soc-orkut.mtx ${PR_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.012" --do_b="0.1" 
./pr market ../../../../../hollywood-2009/hollywood-2009.mtx ${PR_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.006" --do_b="0.1" 
./pr market ../../../../../indochina-2004/indochina-2004.mtx ${PR_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="100" --do_b="100" 
./pr market ../../../../../rmat24/rmat24.mtx ${PR_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.00001" --do_b="0.1" 
./pr market ../../../../../kron_g500-logn21/kron_g500-logn21.mtx ${PR_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.00001" --do_b="0.1" 
./pr market ../../../../../rgg_n_2_24_s0/rgg_n_2_24_s0.mtx ${PR_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" 
./pr market ../../../../../road_usa/road_usa.mtx ${PR_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" 
./pr market ../../../../../roadNet-CA/roadNet-CA.mtx ${PR_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" 

echo "Gunrock PR_DATA_DRIVEN(Random numbering)"
./pr market ../../../../../soc-LiveJournal1_/soc-LiveJournal1_.mtx ${PR_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.200" --do_b="0.1"  
./pr market ../../../../../soc-orkut_/soc-orkut_.mtx ${PR_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.012" --do_b="0.1" 
./pr market ../../../../../hollywood-2009_/hollywood-2009_.mtx ${PR_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.006" --do_b="0.1" 
./pr market ../../../../../indochina-2004_/indochina-2004_.mtx ${PR_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="100" --do_b="100"  
./pr market ../../../../../rmat24_/rmat24_.mtx ${PR_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.00001" --do_b="0.1"  
./pr market ../../../../../kron_g500-logn21_/kron_g500-logn21_.mtx ${PR_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.00001" --do_b="0.1" 
./pr market ../../../../../rgg_n_2_24_s0_/rgg_n_2_24_s0_.mtx ${PR_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" 
./pr market ../../../../../road_usa_/road_usa_.mtx ${PR_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" 
./pr market ../../../../../roadNet-CA_/roadNet-CA_.mtx ${PR_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" 


echo "Gunrock PR_TOPOLOGY_DRIVEN(Original numbering)"
./prt market ../../../../../soc-LiveJournal1/soc-LiveJournal1.mtx ${PR_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.200" --do_b="0.1" --max-iter=82 
./prt market ../../../../../soc-orkut/soc-orkut.mtx ${PR_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.012" --do_b="0.1" --max-iter=97
./prt market ../../../../../hollywood-2009/hollywood-2009.mtx ${PR_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.006" --do_b="0.1" --max-iter=87
./prt market ../../../../../indochina-2004/indochina-2004.mtx ${PR_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="100" --do_b="100" --max-iter=134
./prt market ../../../../../rmat24/rmat24.mtx ${PR_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.00001" --do_b="0.1" --max-iter=70
./prt market ../../../../../kron_g500-logn21/kron_g500-logn21.mtx ${PR_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.00001" --do_b="0.1" --max-iter=44 
./prt market ../../../../../rgg_n_2_24_s0/rgg_n_2_24_s0.mtx ${PR_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" --max-iter=95
./prt market ../../../../../road_usa/road_usa.mtx ${PR_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" --max-iter=84
./prt market ../../../../../roadNet-CA/roadNet-CA.mtx ${PR_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" --max-iter=48

echo "Gunrock PR_TOPOLOGY_DRIVEN(Random numbering)"
./prt market ../../../../../soc-LiveJournal1_/soc-LiveJournal1_.mtx ${PR_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.200" --do_b="0.1" --max-iter=82
./prt market ../../../../../soc-orkut_/soc-orkut_.mtx ${PR_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.012" --do_b="0.1" --max-iter=97
./prt market ../../../../../hollywood-2009_/hollywood-2009_.mtx ${PR_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.006" --do_b="0.1" --max-iter=87
./prt market ../../../../../indochina-2004_/indochina-2004_.mtx ${PR_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="100" --do_b="100" --max-iter=134
./prt market ../../../../../rmat24_/rmat24_.mtx ${PR_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.00001" --do_b="0.1" --max-iter=70
./prt market ../../../../../kron_g500-logn21_/kron_g500-logn21_.mtx ${PR_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.00001" --do_b="0.1" --max-iter=44
./prt market ../../../../../rgg_n_2_24_s0_/rgg_n_2_24_s0_.mtx ${PR_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" --max-iter=95
./prt market ../../../../../road_usa_/road_usa_.mtx ${PR_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" --max-iter=84
./prt market ../../../../../roadNet-CA_/roadNet-CA_.mtx ${PR_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" --max-iter=48






export SSSP_SETTING="--undirected --iteration-num=10 --quick"

echo "Gunrock SSSP(Original numbering)"
./sssp market ../../../../../soc-LiveJournal1/soc-LiveJournal1.mtx ${SSSP_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.200" --do_b="0.1" 
./sssp market ../../../../../soc-orkut/soc-orkut.mtx ${SSSP_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.012" --do_b="0.1" 
./sssp market ../../../../../hollywood-2009/hollywood-2009.mtx ${SSSP_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.006" --do_b="0.1" 
./sssp market ../../../../../indochina-2004/indochina-2004.mtx ${SSSP_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="100" --do_b="100" 
./sssp market ../../../../../rmat24/rmat24.mtx ${SSSP_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.00001" --do_b="0.1" 
./sssp market ../../../../../kron_g500-logn21/kron_g500-logn21.mtx ${SSSP_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.00001" --do_b="0.1" 
./sssp market ../../../../../rgg_n_2_24_s0/rgg_n_2_24_s0.mtx ${SSSP_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" 
./sssp market ../../../../../road_usa/road_usa.mtx ${SSSP_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" 
./sssp market ../../../../../roadNet-CA/roadNet-CA.mtx ${SSSP_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" 

echo "Gunrock SSSP(Random numbering)"
./sssp market ../../../../../soc-LiveJournal1_/soc-LiveJournal1_.mtx ${SSSP_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.200" --do_b="0.1" --src=3266740 
./sssp market ../../../../../soc-orkut_/soc-orkut_.mtx ${SSSP_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.012" --do_b="0.1" --src=17047
./sssp market ../../../../../hollywood-2009_/hollywood-2009_.mtx ${SSSP_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.006" --do_b="0.1" --src=775106
./sssp market ../../../../../indochina-2004_/indochina-2004_.mtx ${SSSP_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="100" --do_b="100"  --src=6750856
./sssp market ../../../../../rmat24_/rmat24_.mtx ${SSSP_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.00001" --do_b="0.1"  --src=0
./sssp market ../../../../../kron_g500-logn21_/kron_g500-logn21_.mtx ${SSSP_SETTING} --device=0 --traversal-mode="LB_CULL" --do_a="0.00001" --do_b="0.1" --src=495356
./sssp market ../../../../../rgg_n_2_24_s0_/rgg_n_2_24_s0_.mtx ${SSSP_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" --src=8934858
./sssp market ../../../../../road_usa_/road_usa_.mtx ${SSSP_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" --src=15916361
./sssp market ../../../../../roadNet-CA_/roadNet-CA_.mtx ${SSSP_SETTING} --device=0 --traversal-mode="TWC" --do_a="1.0" --do_b="10" --src=1916604


cd ..
cd ..
cd ..
cd ..
cd ..

