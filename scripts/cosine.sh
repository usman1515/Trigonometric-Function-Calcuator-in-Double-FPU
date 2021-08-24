#!/bin/bash

clear
iverilog -Wall -o bin/cosine.out src/cosine.v test/tb_cosine.v
vvp bin/cosine.out
gtkwave bin/tb_cosine.vcd
