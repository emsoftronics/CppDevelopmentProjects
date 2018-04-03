# Makefile development version 1.0

export TOP_DIR := ${PWD}
export CXX := g++
export CXXFLAGS := -Wall
export CXXINC := -I $(TOP_DIR)/devel/src/
#export LOCAL_STATIC_LIB :=  

#export recurfind = $(shell find $(1) -name '$(2)')

SUB_MAKES := $(shell find devel/src/ -name Makefile)
SRC_DIRS := $(SUB_MAKES:Makefile=)


all: compiled $(TOP_DIR)/devel/src
	@echo Compilation successfully compeleted!!

$(TOP_DIR)/devel/src:
	@mkdir -p $@
	@echo Source Root Directory successfully created!!

compiled: object_files
ifeq ($(DYNAMIC_LIB),true)
compiled: dynamic_lib
else
compiled: static_lib
endif

dynamic_lib:
	@for sdir in $(SRC_DIRS) ; do \
        ($(MAKE) -C $$sdir dynamic_lib) ; \
	done		

static_lib:
	@for sdir in $(SRC_DIRS) ; do \
        ($(MAKE) -C $$sdir static_lib) ; \
	done		

object_files:
	@for sdir in $(SRC_DIRS) ; do \
		(echo "void main(){}" > $$sdir/test.cpp) ; \
        ($(MAKE) -C $$sdir object_files) ; \
	done		

.PHONY: clean

proper:
	@echo proper


new_src_dir:
ifeq ($(DIR),)
new_src_dir: dir_name_required
else
new_src_dir: dir_name_exists
endif

dir_name_required:
	@echo "Error: Source directory name is required!!."

dir_name_exists:
	@mkdir -p devel/src/$(DIR)
	@cp Makefile.sub devel/src/$(DIR)/Makefile



clean: 
	@for sdir in $(SRC_DIRS) ; do \
        ($(MAKE) -C $$sdir clean) ; \
	done

