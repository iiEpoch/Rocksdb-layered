#db_path
path="./db_test"

#pmem_path
path1="./pmem_test"

#ssd_path
path2="./ssd_test"

#wal_path(pmem)
path3="./db_test"

#wal_path(ssd)
path4="./db_test"

#report path
path5="/mnt/rocksdb/rua"

threads=1

back_g=24

#write参数：value_size threads max_backgroungjobs dataset db path_pmem path_ssd wal_path report_file

#read参数：value_size reads max_backgroungjobs duration dataset  db path_pmem path_ssd wal_path use_direct_read read_cache_size report_file

#readrandomwriterandom参数:value_size threads max_backgroungjobs dataset duration db path_pmem path_ssd wal_path use_direct_read read_cache_size report_file

#准备

./write.sh 128 ${threads} ${back_g} 56 ${path} ${path1} ${path2} ${path3} ${path5} & sleep 180

for j in {1,2}
do
	for i in {256,512}
	do
		./write_s.sh ${i} ${threads} ${back_g} ${j} ${path} ${path1} ${path2} ${path4} ${path5} & sleep 180

		./write_compaction_none.sh ${i} ${threads} ${back_g} &{j} ${path} ${path1} ${path2} ${path3} ${path5} & sleep 180

		./write_p.sh ${i} ${threads} ${back_g} ${j} ${path} ${path1} ${path2} ${path3} ${path5} & sleep 180

		./read.sh ${i} ${threads} ${back_g} 14400 ${j} ${path} ${path1} ${path2} ${path3} false 0 ${path5} & sleep 180

		./read.sh ${i} ${threads} ${back_g} 14400 ${j} ${path} ${path1} ${path2} ${path3} true 10 ${path5} & sleep 180	
	done
done

for j in {1,2}
do
	for i in {256,512}
	do

	./readrandomwriterandom.sh ${i} ${threads} ${back_g} ${j} 14400 ${path} ${path1} ${path2} ${path3} true 10 ${path5} & sleep 180

	./readrandomwriterandom.sh ${i} ${threads} ${back_g} ${j} 14400 ${path} ${path1} ${path2} ${path3} false 0 ${path5} & sleep 180	

	done
done











./readrandomwriterandom.sh 256 ${threads} ${back_g} 56 14400 ${path} ${path1} ${path2} ${path3} true 10 ${path5} & sleep 180

./readrandomwriterandom.sh 256 ${threads} ${back_g} 56 14400 ${path} ${path1} ${path2} ${path3} false 0 ${path5} & sleep 180

./readrandomwriterandom.sh 512 ${threads} ${back_g} 56 14400 ${path} ${path1} ${path2} ${path3} true 10 ${path5} & sleep 180

./readrandomwriterandom.sh 512 ${threads} ${back_g} 56 14400 ${path} ${path1} ${path2} ${path3} false 0 ${path5} & sleep 180

./readrandomwriterandom.sh 1024 ${threads} ${back_g} 56 14400 ${path} ${path1} ${path2} ${path3} true 10 ${path5} & sleep 180

./readrandomwriterandom.sh 1024 ${threads} ${back_g} 56 14400 ${path} ${path1} ${path2} ${path3} false 0 ${path5} & sleep 180

./readrandomwriterandom.sh 4096 ${threads} ${back_g} 56 14400 ${path} ${path1} ${path2} ${path3} true 10 ${path5} & sleep 180

./readrandomwriterandom.sh 4096 ${threads} ${back_g} 56 14400 ${path} ${path1} ${path2} ${path3} false 0 ${path5} & sleep 180







./write_p.sh 256 ${threads} ${back_g} 56 ${path} ${path1} ${path2} ${path3} ${path5} & sleep 180

./write_s.sh 256 ${threads} ${back_g} 56 ${path} ${path1} ${path2} ${path4} ${path5} & sleep 180

./read.sh 256 ${threads} ${back_g} 14400 56 ${path} ${path1} ${path2} ${path3} false 0 ${path5} & sleep 180

./read.sh 256 ${threads} ${back_g} 14400 56 ${path} ${path1} ${path2} ${path3} true 10 ${path5} & sleep 180

./write_p.sh 512 ${threads} ${back_g} 56 ${path} ${path1} ${path2} ${path3} ${path5} & sleep 180

./write_s.sh 512 ${threads} ${back_g} 56 ${path} ${path1} ${path2} ${path4} ${path5} & sleep 180

./read.sh 512 ${threads} ${back_g} 14400 56 ${path} ${path1} ${path2} ${path3} false 0 ${path5} & sleep 180

./read.sh 512 ${threads} ${back_g} 14400 56 ${path} ${path1} ${path2} ${path3} true 10 ${path5} & sleep 180

./write_p.sh 1024 ${threads} ${back_g} 56 ${path} ${path1} ${path2} ${path3} ${path5} & sleep 180

./write_s.sh 1024 ${threads} ${back_g} 56 ${path} ${path1} ${path2} ${path4} ${path5} & sleep 180

./read.sh 1024 ${threads} ${back_g} 14400 56 ${path} ${path1} ${path2} ${path3} false 0 ${path5} & sleep 180

./read.sh 1024 ${threads} ${back_g} 14400 56 ${path} ${path1} ${path2} ${path3} true 10 ${path5} & sleep 180

./write_p.sh 4096 ${threads} ${back_g} 56 ${path} ${path1} ${path2} ${path3} ${path5} & sleep 180

./write_s.sh 4096 ${threads} ${back_g} 56 ${path} ${path1} ${path2} ${path4} ${path5} & sleep 180

./read.sh 4096 ${threads} ${back_g} 14400 56 ${path} ${path1} ${path2} ${path3} false 0 ${path5} & sleep 180

./read.sh 4096 ${threads} ${back_g} 14400 56 ${path} ${path1} ${path2} ${path3} true 10 ${path5} & sleep 180

./write_compaction_none.sh 256 ${threads} ${back_g} 56 ${path} ${path1} ${path2} ${path3} ${path5} & sleep 180

./write_compaction_none.sh 512 ${threads} ${back_g} 56 ${path} ${path1} ${path2} ${path3} ${path5} & sleep 180

./write_compaction_none.sh 1024 ${threads} ${back_g} 56 ${path} ${path1} ${path2} ${path3} ${path5} & sleep 180

./write_compaction_none.sh 4096 ${threads} ${back_g} 56 ${path} ${path1} ${path2} ${path3} ${path5} & sleep 180

#测试(dateset=112)

./write_p.sh 256 ${threads} ${back_g} 112 ${path} ${path1} ${path2} ${path3} ${path5} & sleep 180

./write_s.sh 256 ${threads} ${back_g} 112 ${path} ${path1} ${path2} ${path4} ${path5} & sleep 180

./read.sh 256 ${threads} ${back_g} 14400 112 ${path} ${path1} ${path2} ${path3} false 0 ${path5} & sleep 180

./read.sh 256 ${threads} ${back_g} 14400 112 ${path} ${path1} ${path2} ${path3} true 10 ${path5} & sleep 180

./write_p.sh 512 ${threads} ${back_g} 112 ${path} ${path1} ${path2} ${path3} ${path5} & sleep 180

./write_s.sh 512 ${threads} ${back_g} 112 ${path} ${path1} ${path2} ${path4} ${path5} & sleep 180

./read.sh 512 ${threads} ${back_g} 14400 112 ${path} ${path1} ${path2} ${path3} false 0 ${path5} & sleep 180

./read.sh 512 ${threads} ${back_g} 14400 112 ${path} ${path1} ${path2} ${path3} true 10 ${path5} & sleep 180

./write_p.sh 1024 ${threads} ${back_g} 112 ${path} ${path1} ${path2} ${path3} ${path5} & sleep 180

./write_s.sh 1024 ${threads} ${back_g} 112 ${path} ${path1} ${path2} ${path4} ${path5} & sleep 180

./read.sh 1024 ${threads} ${back_g} 14400 112 ${path} ${path1} ${path2} ${path3} false 0 ${path5} & sleep 180

./read.sh 1024 ${threads} ${back_g} 14400 112 ${path} ${path1} ${path2} ${path3} true 10 ${path5} & sleep 180

./write_p.sh 4096 ${threads} ${back_g} 112 ${path} ${path1} ${path2} ${path3} ${path5} & sleep 180

./write_s.sh 4096 ${threads} ${back_g} 112 ${path} ${path1} ${path2} ${path4} ${path5} & sleep 180

./read.sh 4096 ${threads} ${back_g} 14400 112 ${path} ${path1} ${path2} ${path3} false 0 ${path5} & sleep 180

./read.sh 4096 ${threads} ${back_g} 14400 112 ${path} ${path1} ${path2} ${path3} true 10 ${path5} & sleep 180

./write_compaction_none.sh 256 ${threads} ${back_g} 112 ${path} ${path1} ${path2} ${path3} ${path5} & sleep 180

./write_compaction_none.sh 512 ${threads} ${back_g} 112 ${path} ${path1} ${path2} ${path3} ${path5} & sleep 180

./write_compaction_none.sh 1024 ${threads} ${back_g} 112 ${path} ${path1} ${path2} ${path3} ${path5} & sleep 180

./write_compaction_none.sh 4096 ${threads} ${back_g} 112 ${path} ${path1} ${path2} ${path3} ${path5} & sleep 180

./readrandomwriterandom.sh 256 ${threads} ${back_g} 112 14400 ${path} ${path1} ${path2} ${path3} true 10 ${path5} & sleep 180

./readrandomwriterandom.sh 256 ${threads} ${back_g} 112 14400 ${path} ${path1} ${path2} ${path3} false 0 ${path5} & sleep 180

./readrandomwriterandom.sh 512 ${threads} ${back_g} 112 14400 ${path} ${path1} ${path2} ${path3} true 10 ${path5} & sleep 180

./readrandomwriterandom.sh 512 ${threads} ${back_g} 112 14400 ${path} ${path1} ${path2} ${path3} false 0 ${path5} & sleep 180

./readrandomwriterandom.sh 1024 ${threads} ${back_g} 112 14400 ${path} ${path1} ${path2} ${path3} true 10 ${path5} & sleep 180

./readrandomwriterandom.sh 1024 ${threads} ${back_g} 112 14400 ${path} ${path1} ${path2} ${path3} false 0 ${path5} & sleep 180

./readrandomwriterandom.sh 4096 ${threads} ${back_g} 112 14400 ${path} ${path1} ${path2} ${path3} true 10 ${path5} & sleep 180

./readrandomwriterandom.sh 4096 ${threads} ${back_g} 112 14400 ${path} ${path1} ${path2} ${path3} false 0 ${path5} & sleep 180