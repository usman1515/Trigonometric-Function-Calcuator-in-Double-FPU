#!/bin/bash

clear
iverilog -Wall -o bin/divider.out src/divider.v test/tb_divider.v
vvp bin/divider.out
gtkwave bin/tb_divider.vcd