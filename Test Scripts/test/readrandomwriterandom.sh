#!/bin/bash
declare -i cache=${9}\*1024\*1024\*1024
declare -i data=${4}\*1024\*1024\*1024\/${1}
./db_bench --benchmarks="readrandomwriterandom,stats,levelstats" \
--use_existing_db=1 \
--enable_write_thread_adaptive_yield=false \
--allow_concurrent_memtable_write=true \
--readwritepercent=80 \
--disable_auto_compactions=false \
--compression_type=snappy \
--max_background_jobs=${3} \
--value_size=${1} --key_size=16 --enable_pipelined_write=true \
--allow_concurrent_memtable_write=true \
--batch_size=1 \
--db=${6} \
--wal_dir=${7} \
--histogram=true \
--statistics=true \
--target_file_size_base=67108864 \
--use_direct_io_for_flush_and_compaction=true \
--use_direct_reads=${8} \
--threads=${2} \
--read_cache_size=${9} \
--duration=${5} \
--num=${data} \
--report_interval_seconds=5 \
--report_file=${10}/readrandomwriterandom-ValueSize_${1}_DataSet_${4}_DirectReads_${8}.csv \
> ${10}/readrandomwriterandom-ValueSize_${1}_DataSet_${4}_DirectReads_${8}.txt 2>&1
