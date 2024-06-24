#!/usr/bin/env wolframscript


data = Import["/localscratch/asourpis/metadata_MOGON/ccn_h2o_0.25_0.75/75/nvt_pro_run/0.0-V_nm/dipoles/Mtot.xvg", "Table"] // Drop[#, 27] &;

mtotzerox = data[[All, 2]]*0.00018;
mtotzeroy = data[[All, 3]]*0.00018;
mtotzeroz = data[[All, 4]]*0.00018;

Export["/uni-mainz.de/homes/asourpis/Desktop"<>"mx.dat",mtotzerox];

Export["uni-mainz.de/homes/asourpis/Desktop/"<>"my.dat",mtotzeroy];


Export["uni-mainz.de/homes/asourpis/Desktop/"<>"mz.dat",mtotzeroz];






