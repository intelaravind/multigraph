#!/bin/bash

if [ "$1" = "" ]
then
	echo "----- Usage -----"
	echo "MultiGraph : ./install.sh multigraph"
	echo "Cusha : ./install.sh cusha"
	echo "WS : ./install.sh ws"
	echo "Groute&Gunrock : ./install.sh groute"
elif [ "$1" = "multigraph" ]
then 
	echo "Install CUDPP"
	tar -xvf pack.tar.gz
	git clone https://github.com/cudpp/cudpp.git
	cd cudpp
	git submodule init
	git submodule update
	mkdir -p build
	cd build
	cmake ..
	make

	cd ..
	cd ..

	export CUDPP_DIR=../cudpp

	export CUDPP_LIB=$CUDPP_DIR/build/lib
	export CUDPP_INCLUDE=$CUDPP_DIR/include

	echo "Install MultiGraph"
	cd code
	nvcc -O3 -gencode arch=compute_35,code=sm_35 -DBFS -DSPARSE_MODE -DPRINT_OUTPUT0 -DVALIDATE -DSYM -DTRACE0 -lcudpp --use_fast_math -Xptxas "-v -dlcm=cg" -I${CUDPP_INCLUDE} -L${CUDPP_LIB} read_input.cu function.cu gen_structure.cu release_structure.cu process.cu process2.cu processi.cu validate.cu main.cu -o BFS_SPARSE
	nvcc -O3 -gencode arch=compute_35,code=sm_35 -DSSSP -DSPARSE_MODE -DPRINT_OUTPUT0 -DVALIDATE -DSYM -DTRACE0 -lcudpp --use_fast_math -Xptxas "-v -dlcm=cg" -I${CUDPP_INCLUDE} -L${CUDPP_LIB} read_input.cu function.cu gen_structure.cu release_structure.cu process.cu process2.cu processi.cu validate.cu main.cu -o SSSP_SPARSE
	nvcc -O3 -gencode arch=compute_35,code=sm_35 -DBC -DSPARSE_MODE -DPRINT_OUTPUT0 -DVALIDATE -DSYM -DTRACE0 -lcudpp --use_fast_math -Xptxas "-v -dlcm=cg" -I${CUDPP_INCLUDE} -L${CUDPP_LIB} read_input.cu function.cu gen_structure.cu release_structure.cu process.cu process2.cu processi.cu validate.cu main.cu -o BC_SPARSE
	nvcc -O3 -gencode arch=compute_35,code=sm_35 -DCC -DSPARSE_MODE -DPRINT_OUTPUT0 -DVALIDATE -DSYM -DTRACE0 -lcudpp --use_fast_math -Xptxas "-v -dlcm=cg" -I${CUDPP_INCLUDE} -L${CUDPP_LIB} read_input.cu function.cu gen_structure.cu release_structure.cu process.cu process2.cu processi.cu validate.cu main.cu -o CC_SPARSE
	nvcc -O3 -gencode arch=compute_35,code=sm_35 -DPR_D -DSPARSE_MODE -DPRINT_OUTPUT0 -DVALIDATE -DSYM -DTRACE0 -lcudpp --use_fast_math -Xptxas "-v -dlcm=cg" -I${CUDPP_INCLUDE} -L${CUDPP_LIB} read_input.cu function.cu gen_structure.cu release_structure.cu process.cu process2.cu processi.cu validate.cu main.cu -o DATA_DRIVEN_PR_SPARSE

	nvcc -O3 -gencode arch=compute_35,code=sm_35 -DBFS -DDENSE_MODE -DPRINT_OUTPUT0 -DVALIDATE -DSYM -DTRACE0 -lcudpp --use_fast_math -Xptxas "-v -dlcm=cg" -I${CUDPP_INCLUDE} -L${CUDPP_LIB} read_input.cu function.cu gen_structure.cu release_structure.cu process.cu process2.cu processi.cu validate.cu main.cu -o BFS_DENSE
	nvcc -O3 -gencode arch=compute_35,code=sm_35 -DSSSP -DDENSE_MODE -DPRINT_OUTPUT0 -DVALIDATE -DSYM -DTRACE0 -lcudpp --use_fast_math -Xptxas "-v -dlcm=cg" -I${CUDPP_INCLUDE} -L${CUDPP_LIB} read_input.cu function.cu gen_structure.cu release_structure.cu process.cu process2.cu processi.cu validate.cu main.cu -o SSSP_DENSE
	nvcc -O3 -gencode arch=compute_35,code=sm_35 -DBC -DDENSE_MODE -DPRINT_OUTPUT0 -DVALIDATE -DSYM -DTRACE0 -lcudpp --use_fast_math -Xptxas "-v -dlcm=cg" -I${CUDPP_INCLUDE} -L${CUDPP_LIB} read_input.cu function.cu gen_structure.cu release_structure.cu process.cu process2.cu processi.cu validate.cu main.cu -o BC_DENSE
	nvcc -O3 -gencode arch=compute_35,code=sm_35 -DPR_T -DDENSE_MODE -DPRINT_OUTPUT0 -DVALIDATE -DSYM -DTRACE0 -lcudpp --use_fast_math -Xptxas "-v -dlcm=cg" -I${CUDPP_INCLUDE} -L${CUDPP_LIB} read_input.cu function.cu gen_structure.cu release_structure.cu process.cu process2.cu processi.cu validate.cu main.cu -o DATA_DRIVEN_PR_DENSE
	nvcc -O3 -gencode arch=compute_35,code=sm_35 -DPR_D -DDENSE_MODE -DPRINT_OUTPUT0 -DVALIDATE -DSYM -DTRACE0 -lcudpp --use_fast_math -Xptxas "-v -dlcm=cg" -I${CUDPP_INCLUDE} -L${CUDPP_LIB} read_input.cu function.cu gen_structure.cu release_structure.cu process.cu process2.cu processi.cu validate.cu main.cu -o TOPOLOGY_DRIVEN_PR_DENSE

	nvcc -O3 -gencode arch=compute_35,code=sm_35 -DBFS  -DPRINT_OUTPUT0 -DVALIDATE -DSYM -DTRACE0 -lcudpp --use_fast_math -Xptxas "-v -dlcm=cg" -I${CUDPP_INCLUDE} -L${CUDPP_LIB} read_input.cu function.cu gen_structure.cu release_structure.cu process.cu process2.cu processi.cu validate.cu main.cu -o BFS
	nvcc -O3 -gencode arch=compute_35,code=sm_35 -DSSSP  -DPRINT_OUTPUT0 -DVALIDATE -DSYM -DTRACE0 -lcudpp --use_fast_math -Xptxas "-v -dlcm=cg" -I${CUDPP_INCLUDE} -L${CUDPP_LIB} read_input.cu function.cu gen_structure.cu release_structure.cu process.cu process2.cu processi.cu validate.cu main.cu -o SSSP
	nvcc -O3 -gencode arch=compute_35,code=sm_35 -DBC  -DPRINT_OUTPUT0 -DVALIDATE -DSYM -DTRACE0 -lcudpp --use_fast_math -Xptxas "-v -dlcm=cg" -I${CUDPP_INCLUDE} -L${CUDPP_LIB} read_input.cu function.cu gen_structure.cu release_structure.cu process.cu process2.cu processi.cu validate.cu main.cu -o BC
	nvcc -O3 -gencode arch=compute_35,code=sm_35 -DPR_D  -DPRINT_OUTPUT0 -DVALIDATE -DSYM -DTRACE0 -lcudpp --use_fast_math -Xptxas "-v -dlcm=cg" -I${CUDPP_INCLUDE} -L${CUDPP_LIB} read_input.cu function.cu gen_structure.cu release_structure.cu process.cu process2.cu processi.cu validate.cu main.cu -o DATA_DRIVEN_PR
cd ..

elif [ "$1" = "cusha" ]
then
	tar -xvf pack.tar.gz
	git clone https://github.com/farkhor/CuSha
	cd CuSha
	rm -R -f common
	cp -R ../cusha_common .
	mv cusha_common common
	cp ../cusha1.sh .
	./cusha1.sh
	cd ..
elif [ "$1" = "ws" ]
then
	tar -xvf pack.tar.gz
	git clone https://github.com/farkhor/WS-VR

	cd WS-VR/src
	rm -R -f user_specified_codes
	cp -R ../../ws_user_specified_codes .
	mv ws_user_specified_codes user_specified_codes
	cp ../../ws1.sh .
	./ws1.sh
	cd ..
	cd ..
elif [ "$1" = "groute" ]
then
	tar -xvf pack.tar.gz
	git clone --recursive https://github.com/groute/ppopp17-artifact.git

	mkdir -p ppopp17-artifact
	mkdir -p ppopp17-artifact/code
	mkdir -p ppopp17-artifact/code/gunrock
	mkdir -p ppopp17-artifact/code/gunrock/gunrock
	mkdir -p ppopp17-artifact/code/gunrock/gunrock/app
	cp -R prt ppopp17-artifact/code/gunrock/gunrock/app

	cp groute_setup.sh ppopp17-artifact
	cd ppopp17-artifact
	./groute_setup.sh
	cd ..
fi

