#!/bin/bash

clear
iverilog -Wall -o bin/sine.out src/sine.v test/tb_sine.v
vvp bin/sine.out
gtkwave bin/tb_sine.vcd
