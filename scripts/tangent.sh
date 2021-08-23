#!/bin/bash

clear
iverilog -Wall -o bin/tangent.out src/tangent.v test/tb_tangent.v
vvp bin/tangent.out
gtkwave bin/tb_tangent.vcd
