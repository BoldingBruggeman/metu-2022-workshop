#!/bin/bash

# script to do all steps in ParSAC sensitivity analysis

config=config_sa.xml
N=4
N=20

method=saltelli
method=random

# sampling
parsac sensitivity sample $config $method.pkl $method $N 

# running
parsac sensitivity run $method.pkl

# analyzing
if [ "$method" == "random" ]; then
   parsac sensitivity analyze $method.pkl mvr >& analysis_${method}_${N}_mvr.txt
fi

# analyzing
if [ "$method" == "saltelli" ]; then
   parsac sensitivity analyze $method.pkl sobol >& analysis_${method}_${N}_sobol.txt
fi
