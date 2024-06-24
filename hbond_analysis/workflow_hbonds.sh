#!/bin/bash

export traj='/lustre/project/m2_trr146/asourpis/paper_ccn_h2o_0.25_0.75/75/NVTrun100ns'
export workdir='/lustre/project/m2_trr146/asourpis/last_dance/hbonds/hbond_analysis/data_100ns'

mkdir 1e-$ef-V_nm
cp $workdir/data_mng_correct.sh $workdir/1e-$ef-V_nm
cp $workdir/traj_spacing_lst100ns.sh $workdir/1e-$ef-V_nm
cp $workdir/chimera_100ns.py $workdir/1e-$ef-V_nm
cd $workdir/1e-$ef-V_nm
#mkdir 0.01-V_nm && cd $_

./traj_spacing_lst100ns.sh &&
chimera --nogui chimera_100ns.py &&
./data_mng_correct.sh &&
rm *.txt*
exit
