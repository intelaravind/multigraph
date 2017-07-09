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
done < ../datasets.list
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
done < ../datasets.list
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
done < ../datasets.list
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
done < ../datasets.list
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
done < ../datasets.list
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
done < ../datasets.list
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
done < ../datasets.list
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
done < ../../datasets.list
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
done < ../../datasets.list
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
done < ../../datasets.list
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
done < ../../datasets.list
echo



elif [ "$1" = "groute" ]
then
#######################
cd ppopp17-artifact/code/groute/build

for i in bfs cc pr sssp
do
echo "Groute ${i}"
while read X Y Z
do
    if [ "${X:0:1}" != "#" ]
    then
	while read lv rv
	do
		if [ "${lv}" = "${X}" ]
		then
			VAL=${rv}
		fi
	done < ../../../../groute.${i}

	if [ "${X:$((${#X}-1)):1}" != "_" ]
	then
		echo "original node numbering,$X"
	else
		echo "random re-numbering,$X"
	fi
	if [ "${i}" == "bfs" ] || [ "${i}" == "sssp" ]
	then
		./${i} -source_node=${Y} -graphfile ../../../../${X}/${X}.gr ${VAL}
	else
		./${i} -graphfile ../../../../${X}/${X}.gr ${VAL}
	fi
	echo
    fi
done < ../../../../datasets.list
echo
done

cd ..
cd ..
cd ..
cd ..

elif [ "$1" = "gunrock" ]
then

cd ppopp17-artifact/code/gunrock/build/bin

for i in bc cc bfs pr prt sssp
do
echo "Gunrock ${i}"
while read X Y Z
do
    if [ "${X:0:1}" != "#" ]
    then
	while read lv rv
	do
		if [ "${lv}" = "${X}" ]
		then
			VAL=${rv}	
		fi
	done < ../../../../gunrock.${i}

	if [ "${X:$((${#X}-1)):1}" != "_" ]
	then
		echo "original node numbering"
		echo $X
	else
		echo "random re-numbering"
		echo $X
	fi
	./${i} market ../../../../../${X}/${X}.mtx ${VAL} --src=${Y}
    fi
done < ../../../../../datasets.list
echo
done

cd ..
cd ..
cd ..
cd ..
cd ..

fi
