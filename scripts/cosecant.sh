#!/bin/bash

clear
iverilog -Wall -o bin/cosecant.out src/cosecant.v test/tb_cosecant.v
vvp bin/cosecant.out
gtkwave bin/tb_cosecant.vcd
