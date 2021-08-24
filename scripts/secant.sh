#!/bin/bash

clear
iverilog -Wall -o bin/secant.out src/secant.v test/tb_secant.v
vvp bin/secant.out
gtkwave bin/tb_secant.vcd
