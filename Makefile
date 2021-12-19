# Folders
src_folder := ./sources
exe_folder := ./executables

# Files
src_subfolders := $(shell find $(src_folder) -mindepth 1 -maxdepth 1 -type d)
exe_files := $(foreach subfolder,$(src_subfolders),$(shell basename $(subfolder)))
exe_files := $(addsuffix .elf, $(addprefix $(exe_folder)/, $(exe_files)))

# Target for compiling all the executables
all: $(exe_files)

# Target for compiling each executable
$(exe_folder)/%.elf:$(src_folder)/%/*.c
	gcc -w $^ -o $@ 2>/dev/null || true

# Target for removing all the executables
clean:
	find executables/*.elf -exec rm -f {} \; 2>/dev/null || true