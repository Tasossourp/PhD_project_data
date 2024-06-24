#!/bin/bash

for i in {0..100000..1}
do
gmx trjconv -f $traj/'sim_100ns_0.0-V_nm.xtc' -s $traj/'sim_100ns_0.0-V_nm.tpr' -b $i -e $i -o 'sim_100ns_0.0-V_nm_'$i'.gro' -pbc whole <<EOF
0
EOF
done

echo "done"
