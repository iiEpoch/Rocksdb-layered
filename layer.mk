ROCKSDB_USE_LAYER :=

ifdef ROCKSDB_USE_LAYER
	LDFLAGS += -L/usr/local/lib/ -L/usr/local/lib64/
	CXXFLAGS += -I/usr/local/include
	CXXFLAGS +=  -DUSE_LAYER
endif
