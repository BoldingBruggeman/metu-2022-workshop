#!/bin/bash

# script to do all steps in ParSAC sensitivity analysis

config=config_sa.xml
N=4
N=20

method=saltelli
method=random

info=${method}_${N}.pkl

# sampling
parsac sensitivity sample ${config} ${info} ${method} $N 

# running
parsac sensitivity run ${info}

# analyzing
if [ "$method" == "random" ]; then
   parsac sensitivity analyze ${info} mvr >& analysis_${method}_${N}_mvr.txt
fi

# analyzing
if [ "$method" == "saltelli" ]; then
   parsac sensitivity analyze ${info} sobol >& analysis_${method}_${N}_sobol.txt
fi

