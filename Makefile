# MakeFile for Trigonometric functions in double FPU flow

# -------------------------------------------- scripts dir and paths
PRJ_DIR := $(realpath .)
PATH_DIVIDER := $(PRJ_DIR)/scripts/divider.sh

# -------------------------------------------- defines
help:
	clear
	@ echo -----------------------------------------------------------------------------
	@ echo ---------------------- Targets defined in the MakeFile ----------------------
	@ echo -----------------------------------------------------------------------------
	@ echo
	@ echo "divider:	Run script divider.sh"

	@ echo "clean: 		Remove generated files"
	@ echo
	@ echo -----------------------------------------------------------------------------
	@ echo -----------------------------------------------------------------------------

default:
	$(info $(PRJ_DIR))
	$(info $(PATH_DIVIDER))

divider:
	$(shell source $(PATH_DIVIDER))

clean:
	clear
	@ rm -rf bin/*