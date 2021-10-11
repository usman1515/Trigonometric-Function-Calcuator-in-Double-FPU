# MakeFile for Trigonometric functions in double FPU flow

# -------------------------------------------- scripts dir and paths
PRJ_DIR 		:= $(realpath .)
PATH_PYTHON1 	:= $(PRJ_DIR)/scripts/double_precision.py
PATH_DIVIDER	:= $(PRJ_DIR)/scripts/divider.sh
PATH_SINE 		:= $(PRJ_DIR)/scripts/sine.sh
PATH_COSINE 	:= $(PRJ_DIR)/scripts/cosine.sh
PATH_TANGENT 	:= $(PRJ_DIR)/scripts/tangent.sh
PATH_COSECANT	:= $(PRJ_DIR)/scripts/cosecant.sh
PATH_SECANT 	:= $(PRJ_DIR)/scripts/secant.sh
PATH_COTANGENT 	:= $(PRJ_DIR)/scripts/cotangent.sh

# -------------------------------------------- defines
help:
	clear
	@ echo -----------------------------------------------------------------------------
	@ echo ---------------------- Targets defined in the MakeFile ----------------------
	@ echo -----------------------------------------------------------------------------
	@ echo
	@ echo "dfpu:		convert dec float to IEEE 754 double hex"
	@ echo " "
	@ echo "divider:	Simulate Divider 	module"
	@ echo "sine:		Simulate Sine 		module"
	@ echo "cosine:		Simulate Cosine 	module"
	@ echo "tangent:	Simulate Tangent 	module"
	@ echo "cosecant:	Simulate Cosecant 	module"
	@ echo "secant:		Simulate Secant 	module"
	@ echo "cotangent:	Simulate Cotangent	module"
	@ echo 
	@ echo "clean: 		Remove generated files"
	@ echo
	@ echo -----------------------------------------------------------------------------
	@ echo -----------------------------------------------------------------------------
	@ echo " "

NUMBER := 
VERBOSE := 0
DEBUG := 0

default: help
	$(info $(PRJ_DIR))

dfpu:
	python3 $(PATH_PYTHON1) \
	--inputvalue $(NUMBER) \
	--verbose $(VERBOSE) \
	--debug $(DEBUG)

divider:
	bash $(PATH_DIVIDER)

sine:
	bash $(PATH_SINE)

cosine:
	bash $(PATH_COSINE)

tangent:
	bash $(PATH_TANGENT)

cosecant:
	bash $(PATH_COSECANT)

secant:
	bash $(PATH_SECANT)

cotangent:
	bash $(PATH_COTANGENT)

clean:
	clear
	@ rm -rf bin/* \
	src/*.v.bak \
	test/*.v.bak