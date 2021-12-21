# Folders
SRC_FOLDER := ./sources
EXE_FOLDER := ./executables

# Files
SRC_SUBFOLDERS := $(shell find $(SRC_FOLDER) -mindepth 1 -maxdepth 1 -type d)
EXE_FILES := $(foreach subfolder,$(SRC_SUBFOLDERS),$(shell basename $(subfolder)))
EXE_FILES := $(addsuffix .elf, $(addprefix $(EXE_FOLDER)/, $(EXE_FILES)))

# Compiler
COMPILER := gcc
COMPILE_OPTIONS := -w -O0 -std=gnu99

# Target for compiling all the executables
all: $(EXE_FILES)

# Target for compiling each executable
$(EXE_FOLDER)/%.elf:$(SRC_FOLDER)/%/*.c
	$(COMPILER) $(COMPILE_OPTIONS) $^ -o $@ 2>/dev/null || true

# Target for removing all the executables
clean:
	find $(EXE_FOLDER)/*.elf -exec rm -f {} \; 2>/dev/null || true