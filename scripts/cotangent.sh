#!/bin/bash

clear
iverilog -Wall -o bin/cotangent.out src/cotangent.v test/tb_cotangent.v
vvp bin/cotangent.out
gtkwave bin/tb_cotangent.vcd
