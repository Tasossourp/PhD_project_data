#!/bin/bash

#export traj='/lustre/project/m2_trr146/asourpis/paper_ccn_h2o_0.25_0.75/75/NVTrun100ns'
export workdir='/lustre/project/m2_trr146/asourpis/last_dance/hbonds/biggest_clst/big_clst_cyclic_analysis'

mkdir $workdir/1e-$ef-V_nm
cp $workdir/data_mng_correct.sh $workdir/1e-$ef-V_nm
cp $workdir/chimera_biggro_100ns.py $workdir/1e-$ef-V_nm
cd $workdir/1e-$ef-V_nm

chimera --nogui chimera_biggro_100ns.py &&
./data_mng_correct.sh &&
rm *.txt*
exit
