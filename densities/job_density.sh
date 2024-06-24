#!/bin/bash

source ../../../../gromacs/bin/GMXRC

#calculation of density
gmx energy -f pro_run_10.edr -s pro_run_10.tpr -o density.xvg << EOF
21
0
EOF
 

#rdf for N-H
#travis -p pro_run.pdb -i input_rdf_N_H.txt

