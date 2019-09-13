#!/bin/env bash
find -name "*[0123456789].skf" > sketches.csv 
ska distance -s 25 -i 0.95 -f sketches.csv
