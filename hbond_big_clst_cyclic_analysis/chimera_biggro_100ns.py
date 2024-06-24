import re
import os

import chimera

from chimera import runCommand as rc
var=os.environ["ef"]
#opened = chimera.openModels.open('/home/tasos/git_uni/draft/md_sim_10ns_ef-1_9900.gro');
for i in range(1, 100001, 1):
   rc("open" '/lustre/project/m2_trr146/asourpis/last_dance/hbonds/biggest_clst/gro/1e-'+str(var)+'-V_nm/big_%i.gro' %i)
   rc("hbond distSlop 0.3 angleSlop 30.0 saveFile hbond_ofbigger_%i.txt" %i)
   rc("close all")
rc("stop now")  
