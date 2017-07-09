#!/bin/bash

gcc -O3 -DSYM -o convert convert.c 

wget http://www.cise.ufl.edu/research/sparse/MM/SNAP/soc-LiveJournal1.tar.gz
tar -xvf soc-LiveJournal1.tar.gz
rm soc-LiveJournal1.tar.gz

mkdir soc-orkut
cd soc-orkut
wget http://nrvis.com/download/data/soc/soc-orkut.zip
unzip soc-orkut.zip
rm soc-orkut.zip
cd ..

wget http://www.cise.ufl.edu/research/sparse/MM/LAW/hollywood-2009.tar.gz
tar -xvf hollywood-2009.tar.gz
rm hollywood-2009.tar.gz

wget http://www.cise.ufl.edu/research/sparse/MM/LAW/indochina-2004.tar.gz
tar -xvf indochina-2004.tar.gz
rm indochina-2004.tar.gz


wget http://www.cise.ufl.edu/research/sparse/MM/DIMACS10/kron_g500-logn21.tar.gz
tar -xvf kron_g500-logn21.tar.gz
rm kron_g500-logn21.tar.gz


wget http://www.cise.ufl.edu/research/sparse/MM/DIMACS10/rgg_n_2_24_s0.tar.gz
tar -xvf rgg_n_2_24_s0.tar.gz
rm rgg_n_2_24_s0.tar.gz


wget http://www.cise.ufl.edu/research/sparse/MM/DIMACS10/road_usa.tar.gz
tar -xvf road_usa.tar.gz
rm road_usa.tar.gz


wget http://www.cise.ufl.edu/research/sparse/MM/SNAP/roadNet-CA.tar.gz
tar -xvf roadNet-CA.tar.gz
rm roadNet-CA.tar.gz
###########################

cd rmat24
        cat rmat24.tar.gz* > rmat24.tar.gz
        tar -xvf rmat24.tar.gz
        mv ./rmat24/rmat24.mtx .
        rm rmat24.tar.gz*
cd ..

cd rmat24_
        cat rmat24_.tar.gz* > rmat24_.tar.gz
        tar -xvf rmat24_.tar.gz
        mv ./rmat24_/rmat24_.mtx .
        rm rmat24_.tar.gz*
cd ..


for i in soc-LiveJournal1_ soc-orkut_ hollywood-2009_ indochina-2004_ kron_g500-logn21_ rgg_n_2_24_s0_ road_usa_
do
        cat ${i}.tar.gz* > ${i}.tar.gz
        tar -xvf ${i}.tar.gz
        rm ${i}.tar.gz*
done

tar -xvf roadNet-CA_.tar.gz
rm roadNet-CA_.tar.gz

cat groute_data.tar.gz* > groute_data.tar.gz
tar -xvf groute_data.tar.gz
rm groute_data.tar.gz*

#tar -xvf pack.tar.gz
for i in soc-LiveJournal1 soc-orkut hollywood-2009 indochina-2004 rmat24 kron_g500-logn21 rgg_n_2_24_s0 road_usa roadNet-CA 
do
mv groute_data/original/${i}/*.* ${i}
mv groute_data/renumber/${i}/${i}.gr groute_data/renumber/${i}/${i}_.gr
mv groute_data/renumber/${i}/${i}.gr.metadata groute_data/renumber/${i}/${i}_.gr.metadata
mv groute_data/renumber/${i}/*.* ${i}_
done


for i in soc-LiveJournal1 soc-orkut hollywood-2009 indochina-2004 rmat24 road_usa rgg_n_2_24_s0 kron_g500-logn21 roadNet-CA 
do
./convert ${i}/${i}.mtx ${i}/${i}.cusha1 ${i}/${i}.cusha2 ${i}/${i}.cusha3
done

for i in soc-LiveJournal1_ soc-orkut_ hollywood-2009_ indochina-2004_ rmat24_ road_usa_ rgg_n_2_24_s0_ kron_g500-logn21_ roadNet-CA_
do
./convert ${i}/${i}.mtx ${i}/${i}.cusha1 ${i}/${i}.cusha2 ${i}/${i}.cusha3
done


