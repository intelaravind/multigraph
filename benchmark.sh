#!/bin/bash

if [ "$1" = "" ]
then
	echo "----- Usage -----"
	echo "Run MultiGraph : ./benchmark.sh multigraph"
	echo "Run CuSha : ./benchmark.sh cusha"
	echo "Run WS : ./benchmark.sh ws"
	echo "Run Groute : ./benchmark.sh groute"
	echo "Run Gunrock : ./benchmark.sh gunrock"


elif [ "$1" = "multigraph" ]
then
	
export CUDPP_DIR=./cudpp

export CUDPP_LIB=$CUDPP_DIR/lib
export CUDPP_INCLUDE=$CUDPP_DIR/include

cd code

#for j in bfs sssp prd bc bfs_s sssp_s cc_s prd_s bc_s bfs_d sssp_d prd_d prt_d
echo "Testing MultiGraph (hybrid)"
for j in BC BFS SSSP DATA_DRIVEN_PR 
do
echo "running $j"
while read X Y Z
do
    if [ "${X:0:1}" != "#" ]
    then
	if [ "${X:$((${#X}-1)):1}" != "_" ]
	then
		echo -n "original node numbering,$X,"
	else
		echo -n "random re-numbering,$X,"
	fi
	./${j} ../${X}/${X}.mtx $Y $Z
    fi
done < ../benchmark.list
done

echo "Testing MultiGraphS (sparse)"
for j in BC_SPARSE BFS_SPARSE CC_SPARSE DATA_DRIVEN_PR_SPARSE SSSP_SPARSE
do
echo "running $j"
while read X Y Z
do
    if [ "${X:0:1}" != "#" ]
    then
	if [ "${X:$((${#X}-1)):1}" != "_" ]
	then
		echo -n "original node numbering,$X,"
	else
		echo -n "random re-numbering,$X,"
	fi
	./${j} ../${X}/${X}.mtx $Y $Z
    fi
done < ../benchmark.list
done
echo

echo "Testing MultiGraphD (dense)"
for j in BC_DENSE BFS_DENSE DATA_DRIVEN_PR_DENSE TOPOLOGY_DRIVEN_PR_DENSE SSSP_DENSE
do
echo "running $j"
while read X Y Z
do
    if [ "${X:0:1}" != "#" ]
    then
	if [ "${X:$((${#X}-1)):1}" != "_" ]
	then
		echo -n "original node numbering,$X,"
	else
		echo -n "random re-numbering,$X,"
	fi
	./${j} ../${X}/${X}.mtx $Y $Z
    fi
done < ../benchmark.list
done
echo

cd ..

elif [ "$1" = "cusha" ]
then

cd CuSha/

echo "Cusha BFS"
while read X Y Z
do
    if [ "${X:0:1}" != "#" ]
    then
	if [ "${X:$((${#X}-1)):1}" != "_" ]
	then
		echo "original node numbering,$X"
	else
		echo "random re-numbering,$X"
	fi
	./cusha_bfs --input ../${X}/${X}.cusha1 --method CW --arbparam $Y
    fi
done < ../benchmark.list
echo

echo "Cusha CC"
while read X Y Z
do
    if [ "${X:0:1}" != "#" ]
    then
	if [ "${X:$((${#X}-1)):1}" != "_" ]
	then
		echo "original node numbering,$X"
	else
		echo "random re-numbering,$X"
	fi
	./cusha_cc --input ../${X}/${X}.cusha1 --method CW --arbparam $Y
    fi
done < ../benchmark.list
echo

echo "Cusha PR"
while read X Y Z
do
    if [ "${X:0:1}" != "#" ]
    then
	if [ "${X:$((${#X}-1)):1}" != "_" ]
	then
		echo "original node numbering,$X"
	else
		echo "random re-numbering,$X"
	fi
	./cusha_pr --input ../${X}/${X}.cusha3 --method CW --arbparam $Y
    fi
done < ../benchmark.list
echo

echo "Cusha SSSP"
while read X Y Z
do
    if [ "${X:0:1}" != "#" ]
    then
	if [ "${X:$((${#X}-1)):1}" != "_" ]
	then
		echo "original node numbering,$X"
	else
		echo "random re-numbering,$X"
	fi
	./cusha_sssp --input ../${X}/${X}.cusha2 --method CW --arbparam $Y
    fi
done < ../benchmark.list
echo



cd ..

elif [ "$1" = "ws" ]
then

cd WS-VR
cd src

echo "WS BFS"
while read X Y Z
do
    if [ "${X:0:1}" != "#" ]
    then
	if [ "${X:$((${#X}-1)):1}" != "_" ]
	then
		echo "original node numbering,$X"
	else
		echo "random re-numbering,$X"
	fi
	./ws_bfs --edgelist ../../${X}/${X}.cusha1 --arbparam $Y
    fi
done < ../../benchmark.list
echo

echo "WS CC"
while read X Y Z
do
    if [ "${X:0:1}" != "#" ]
    then
	if [ "${X:$((${#X}-1)):1}" != "_" ]
	then
		echo "original node numbering,$X"
	else
		echo "random re-numbering,$X"
	fi
	./ws_cc --edgelist ../../${X}/${X}.cusha1 --arbparam $Y
    fi
done < ../../benchmark.list
echo

echo "WS PR"
while read X Y Z
do
    if [ "${X:0:1}" != "#" ]
    then
	if [ "${X:$((${#X}-1)):1}" != "_" ]
	then
		echo "original node numbering,$X"
	else
		echo "random re-numbering,$X"
	fi
	./ws_pr --edgelist ../../${X}/${X}.cusha3 --arbparam $Y
    fi
done < ../../benchmark.list
echo

echo "WS SSSP"
while read X Y Z
do
    if [ "${X:0:1}" != "#" ]
    then
	if [ "${X:$((${#X}-1)):1}" != "_" ]
	then
		echo "original node numbering,$X"
	else
		echo "random re-numbering,$X"
	fi
	./ws_sssp --edgelist ../../${X}/${X}.cusha2 --arbparam $Y
    fi
done < ../../benchmark.list
echo



elif [ "$1" = "groute" ]
then
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
cd ..
cd ..

elif [ "$1" = "gunrock" ]
then

cd ppopp17-artifact/code/gunrock/build/bin

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
./cc market ../../../../../soc-LiveJournal1/soc-LiveJournal1.mtx ${CC_SETTING}  
./cc market ../../../../../soc-orkut/soc-orkut.mtx ${CC_SETTING}  
./cc market ../../../../../hollywood-2009/hollywood-2009.mtx ${CC_SETTING}  
./cc market ../../../../../indochina-2004/indochina-2004.mtx ${CC_SETTING}  
./cc market ../../../../../rmat24/rmat24.mtx ${CC_SETTING}  
./cc market ../../../../../kron_g500-logn21/kron_g500-logn21.mtx ${CC_SETTING}  
./cc market ../../../../../rgg_n_2_24_s0/rgg_n_2_24_s0.mtx ${CC_SETTING}  
./cc market ../../../../../road_usa/road_usa.mtx ${CC_SETTING}  
./cc market ../../../../../roadNet-CA/roadNet-CA.mtx ${CC_SETTING} 


echo "Gunrock CC(Random numbering)"
./cc market ../../../../../soc-LiveJournal1_/soc-LiveJournal1_.mtx ${CC_SETTING}   
./cc market ../../../../../soc-orkut_/soc-orkut_.mtx ${CC_SETTING}  
./cc market ../../../../../hollywood-2009_/hollywood-2009_.mtx ${CC_SETTING}  
./cc market ../../../../../indochina-2004_/indochina-2004_.mtx ${CC_SETTING}   
./cc market ../../../../../rmat24_/rmat24_.mtx ${CC_SETTING}  
./cc market ../../../../../kron_g500-logn21_/kron_g500-logn21_.mtx ${CC_SETTING} 
./cc market ../../../../../rgg_n_2_24_s0_/rgg_n_2_24_s0_.mtx ${CC_SETTING}  
./cc market ../../../../../road_usa_/road_usa_.mtx ${CC_SETTING}  
./cc market ../../../../../roadNet-CA_/roadNet-CA_.mtx ${CC_SETTING}  



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
./pr market ../../../../../soc-LiveJournal1/soc-LiveJournal1.mtx ${PR_SETTING}  
./pr market ../../../../../soc-orkut/soc-orkut.mtx ${PR_SETTING}   
./pr market ../../../../../hollywood-2009/hollywood-2009.mtx ${PR_SETTING}  
./pr market ../../../../../indochina-2004/indochina-2004.mtx ${PR_SETTING}  
./pr market ../../../../../rmat24/rmat24.mtx ${PR_SETTING}  
./pr market ../../../../../kron_g500-logn21/kron_g500-logn21.mtx ${PR_SETTING}  
./pr market ../../../../../rgg_n_2_24_s0/rgg_n_2_24_s0.mtx ${PR_SETTING}  
./pr market ../../../../../road_usa/road_usa.mtx ${PR_SETTING}  
./pr market ../../../../../roadNet-CA/roadNet-CA.mtx ${PR_SETTING} 

echo "Gunrock PR_DATA_DRIVEN(Random numbering)"
./pr market ../../../../../soc-LiveJournal1_/soc-LiveJournal1_.mtx ${PR_SETTING}  
./pr market ../../../../../soc-orkut_/soc-orkut_.mtx ${PR_SETTING}  
./pr market ../../../../../hollywood-2009_/hollywood-2009_.mtx ${PR_SETTING} 
./pr market ../../../../../indochina-2004_/indochina-2004_.mtx ${PR_SETTING}  
./pr market ../../../../../rmat24_/rmat24_.mtx ${PR_SETTING}  
./pr market ../../../../../kron_g500-logn21_/kron_g500-logn21_.mtx ${PR_SETTING}  
./pr market ../../../../../rgg_n_2_24_s0_/rgg_n_2_24_s0_.mtx ${PR_SETTING}  
./pr market ../../../../../road_usa_/road_usa_.mtx ${PR_SETTING} 
./pr market ../../../../../roadNet-CA_/roadNet-CA_.mtx ${PR_SETTING} 


echo "Gunrock PR_TOPOLOGY_DRIVEN(Original numbering)"
./prt market ../../../../../soc-LiveJournal1/soc-LiveJournal1.mtx ${PR_SETTING} --max-iter=82 
./prt market ../../../../../soc-orkut/soc-orkut.mtx ${PR_SETTING} --max-iter=97
./prt market ../../../../../hollywood-2009/hollywood-2009.mtx ${PR_SETTING} --max-iter=87
./prt market ../../../../../indochina-2004/indochina-2004.mtx ${PR_SETTING} --max-iter=134
./prt market ../../../../../rmat24/rmat24.mtx ${PR_SETTING} --max-iter=70
./prt market ../../../../../kron_g500-logn21/kron_g500-logn21.mtx ${PR_SETTING} --max-iter=44 
./prt market ../../../../../rgg_n_2_24_s0/rgg_n_2_24_s0.mtx ${PR_SETTING} --max-iter=95
./prt market ../../../../../road_usa/road_usa.mtx ${PR_SETTING} --max-iter=84
./prt market ../../../../../roadNet-CA/roadNet-CA.mtx ${PR_SETTING} --max-iter=48

echo "Gunrock PR_TOPOLOGY_DRIVEN(Random numbering)"
./prt market ../../../../../soc-LiveJournal1_/soc-LiveJournal1_.mtx ${PR_SETTING} --max-iter=82
./prt market ../../../../../soc-orkut_/soc-orkut_.mtx ${PR_SETTING} --max-iter=97
./prt market ../../../../../hollywood-2009_/hollywood-2009_.mtx ${PR_SETTING} --max-iter=87
./prt market ../../../../../indochina-2004_/indochina-2004_.mtx ${PR_SETTING} --max-iter=134
./prt market ../../../../../rmat24_/rmat24_.mtx ${PR_SETTING} --max-iter=70
./prt market ../../../../../kron_g500-logn21_/kron_g500-logn21_.mtx ${PR_SETTING} --max-iter=44
./prt market ../../../../../rgg_n_2_24_s0_/rgg_n_2_24_s0_.mtx ${PR_SETTING} --max-iter=95
./prt market ../../../../../road_usa_/road_usa_.mtx ${PR_SETTING} --max-iter=84
./prt market ../../../../../roadNet-CA_/roadNet-CA_.mtx ${PR_SETTING} --max-iter=48




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

fi
