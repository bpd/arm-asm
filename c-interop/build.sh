#!/bin/bash

gcc instr1.c add1.S -o instr1

gcc instr2.c loop.S -o instr2

gcc instr3.c func.S -o instr3
