# Makefile development version 1.0

export TOP_DIR = ${PWD}
export CXX = g++

#export recurfind = $(shell find $(1) -name '$(2)')

SUB_MAKES := $(shell find devel/src/ -name Makefile)
#echo $(SUB_MAKES)

CLEAN := false

all: $(SUB_MAKES)
		

$(SUB_MAKES): 

ifeq ($(CLEAN), true)
$(SUB_MAKES): ; @$(MAKE) -C $(dir $@) clean
else
$(SUB_MAKES): ; @$(MAKE) -C $(dir $@)
endif

.PHONY: $(SUB_MAKES)

proper:


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
ifeq (true, true)
CLEAN=true
clean: $(SUB_MAKES)
endif

