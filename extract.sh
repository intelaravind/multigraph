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

tar -xvf pack.tar.gz

cd CuSha
rm -R -f common
cp -R ../cusha_common .
mv cusha_common common
cp ../cusha1.sh .
./cusha1.sh
cd ..

cd WS-VR/src
rm -R -f user_specified_codes
cp -R ../../ws_user_specified_codes .
mv ws_user_specified_codes user_specified_codes
cp ../../ws1.sh .
./ws1.sh
cd ..
cd ..


