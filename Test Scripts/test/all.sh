#db_path
path="./db_test"


#wal_path
path3="./db_test"


#report path
path5="/mnt/rocksdb"

threads=1

back_g=24

#write参数：value_size threads max_backgroungjobs dataset db path_pmem path_ssd wal_path report_file

#read参数：value_size reads max_backgroungjobs duration dataset  db path_pmem path_ssd wal_path use_direct_read read_cache_size report_file

#readrandomwriterandom参数:value_size threads max_backgroungjobs dataset duration db path_pmem path_ssd wal_path use_direct_read read_cache_size report_file

#准备

./write.sh 128 ${threads} ${back_g} 112 ${path} ${path1} ${path2} ${path3} ${path5} & sleep 300

for j in {56,112}
do
	for i in {256,512,1024,4096}
	do
		./write.sh ${i} ${threads} ${back_g} ${j} ${path} ${path3} ${path5} & sleep 300

		./write_compaction_none.sh ${i} ${threads} ${back_g} ${j} ${path} ${path3} ${path5} & sleep 300

		./read-layer.sh ${i} ${threads} ${back_g} 14400 ${j} ${path} ${path3} false 0 ${path5} & sleep 300

		./read-layer.sh ${i} ${threads} ${back_g} 14400 ${j} ${path} ${path3} true 10 ${path5} & sleep 300	
	done
done

for j in {56,112}
do
	for i in {256,512,1024,4096}
	do

	./write.sh ${i} ${threads} ${back_g} ${j} ${path} ${path3} ${path5} & sleep 300

	./readrandomwriterandom.sh ${i} ${threads} ${back_g} ${j} 14400 ${path} ${path3} true 10 ${path5} & sleep 300

	./readrandomwriterandom.sh ${i} ${threads} ${back_g} ${j} 14400 ${path} ${path3} false 0 ${path5} & sleep 300	

	done
done

