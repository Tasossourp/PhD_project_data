#!/bin/bash

export traj='/lustre/project/m2_trr146/asourpis/paper_ccn_h2o_0.25_0.75/75/NVTrun100ns'
export workdir='/lustre/project/m2_trr146/asourpis/last_dance/cdf/fields_0-0.6'


#gmx trjconv -s $traj/'sim_100ns_0.'$ef'-V_nm.tpr' -f $traj/'sim_100ns_0.'$ef'-V_nm.xtc' -o $workdir/'travis_100ns_0.'$ef'-V_nm_lst25ns.pdb' -b 75000 -e 100000 << EOF
#0
#EOF

mkdir '0.'$ef''
cd '0.'$ef''
travis -p $workdir/'travis_100ns_0.'$ef'-V_nm_lst25ns.pdb' -i $workdir/input_cdf_1st_nbs.txt

