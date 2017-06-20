#!/bin/bash

nvcc entry.cu cuda_kernels.cu iterative_procedure.cu prepare_and_process_graph.cu utils/read_graph.cpp -O3 -DBFS -arch=sm_35 -o ws_bfs
nvcc entry.cu cuda_kernels.cu iterative_procedure.cu prepare_and_process_graph.cu utils/read_graph.cpp -O3 -DCC -arch=sm_35 -o ws_cc
nvcc entry.cu cuda_kernels.cu iterative_procedure.cu prepare_and_process_graph.cu utils/read_graph.cpp -O3 -DSSSP -arch=sm_35 -o ws_sssp
nvcc entry.cu cuda_kernels.cu iterative_procedure.cu prepare_and_process_graph.cu utils/read_graph.cpp -O3 -DPR -arch=sm_35 -o ws_pr
