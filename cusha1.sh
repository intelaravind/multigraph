#!/bin/bash

nvcc entry_point.cu common/simpleTime.cu csr_src/csr_format.cu csr_src/vwc_process.cu cusha_src/cusha_format.cu cusha_src/cusha_process.cu cusha_src/find_block_size.cu common/parse_graph.cpp -O3 -DBFS -arch=sm_35 -o cusha_bfs
nvcc entry_point.cu common/simpleTime.cu csr_src/csr_format.cu csr_src/vwc_process.cu cusha_src/cusha_format.cu cusha_src/cusha_process.cu cusha_src/find_block_size.cu common/parse_graph.cpp -O3 -DSSSP -arch=sm_35 -o cusha_sssp
nvcc entry_point.cu common/simpleTime.cu csr_src/csr_format.cu csr_src/vwc_process.cu cusha_src/cusha_format.cu cusha_src/cusha_process.cu cusha_src/find_block_size.cu common/parse_graph.cpp -O3 -DCC -arch=sm_35 -o cusha_cc
nvcc entry_point.cu common/simpleTime.cu csr_src/csr_format.cu csr_src/vwc_process.cu cusha_src/cusha_format.cu cusha_src/cusha_process.cu cusha_src/find_block_size.cu common/parse_graph.cpp -O3 -DPR -arch=sm_35 -o cusha_pr
