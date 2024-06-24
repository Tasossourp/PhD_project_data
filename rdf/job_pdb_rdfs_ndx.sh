#!/bin/bash

source ../../../../../gromacs/bin/GMXRC


gmx make_ndx -f pro_run_10.gro -o index.ndx << EOF
a N1
a C1
a C2
a H1
a H2
a H3
a OW
a HW1
a HW2
13 | 14
9 | 10 | 11
q
EOF

#pdb file
gmx trjconv -s pro_run_10.tpr -f pro_run_10.xtc -o pro_run_10.pdb << EOF
0
EOF

#"pbc correction"
gmx trjconv -s pro_run_10.tpr -f pro_run_10.xtc -o pro_run_10_noPBC.xtc -pbc mol <<EOF
0
EOF

#rdfs
gmx rdf -f pro_run_10_noPBC.xtc -s pro_run_10.gro -n index.ndx -b 15000 -e 25000 -ref 6 -sel 12 -o rdf_n1_ow.xvg -pbc
gmx rdf -f pro_run_10_noPBC.xtc -s pro_run_10.gro -n index.ndx -b 15000 -e 25000 -ref 6 -sel 16 -o rdf_n1_h.xvg -pbc
gmx rdf -f pro_run_10_noPBC.xtc -s pro_run_10.gro -n index.ndx -b 15000 -e 25000 -ref 6 -sel 15 -o rdf_n1_hw.xvg -pbc
gmx rdf -f pro_run_10_noPBC.xtc -s pro_run_10.gro -n index.ndx -b 15000 -e 25000 -ref 6 -sel 6 -o rdf_n1_n1.xvg -pbc
gmx rdf -f pro_run_10_noPBC.xtc -s pro_run_10.gro -n index.ndx -b 15000 -e 25000 -ref 12 -sel 16 -o rdf_ow_h.xvg -pbc
gmx rdf -f pro_run_10_noPBC.xtc -s pro_run_10.gro -n index.ndx -b 15000 -e 25000 -ref 12 -sel 15 -o rdf_ow_hw.xvg -pbc
gmx rdf -f pro_run_10_noPBC.xtc -s pro_run_10.gro -n index.ndx -b 15000 -e 25000 -ref 12 -sel 12 -o rdf_ow_ow.xvg -pbc
gmx rdf -f pro_run_10_noPBC.xtc -s pro_run_10.gro -n index.ndx -b 15000 -e 25000 -ref 7 -sel 7 -o rdf_c1_c1.xvg -pbc
gmx rdf -f pro_run_10_noPBC.xtc -s pro_run_10.gro -n index.ndx -b 15000 -e 25000 -ref 8 -sel 8 -o rdf_c2_c2.xvg -pbc
#we need the noPBC because otherwise everything is broken regarding the rdf computation.

#calculation of density
gmx density -f pro_run_10.xtc -s pro_run_10.tpr -o 

#rdf for N-H
travis -p pro_run_10.pdb -i input_rdf_N_H.txt


echo "done"
