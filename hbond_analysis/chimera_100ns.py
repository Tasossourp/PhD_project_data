import re
import os

import chimera

from chimera import runCommand as rc
var1=os.environ["workdir"] #this is to define the path
var2=os.environ["ef"] #this is to define the electric field that we 're using.
#print(str(var))
#ef=0.01
#ef=float(var)
#opened = chimera.openModels.open('/home/tasos/git_uni/draft/md_sim_10ns_ef-1_9900.gro');
for i in range(0, 100001, 1):
   rc("open" ''+str(var1)+'/1e-'+str(var2)+'-V_nm/md_nvtxtr_1e-'+str(var2)+'-V_nm_%i.gro' %i)
   rc("hbond distSlop 0.3 angleSlop 30.0 saveFile hbond_tot_%i.txt" %i)
   rc("close all")
rc("stop now") 
