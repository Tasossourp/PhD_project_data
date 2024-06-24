#!/usr/bin/env wolframscript
(* ::Package:: *)
SetDirectory["/lustre/project/m2_trr146/asourpis/last_dance/hbonds/hbond_analysis/data_100ns/zero"];
Do[
data = Import["hbonds_" <> ToString[t] <> ".csv"];
gintertest = Graph[data];
edl = EdgeList[gintertest];
g1 = Graph[edl] // Table;
biggestclst = ConnectedComponents[g1][[1]];
vmdinp = StringJoin[ToString /@ Riffle[biggestclst, " "]];
SetDirectory["/lustre/project/m2_trr146/asourpis/last_dance/hbonds/biggest_clst/data/zero"];
Export["biggestclst"<>ToString[t]<>".dat", vmdinp];
SetDirectory["/lustre/project/m2_trr146/asourpis/last_dance/hbonds/hbond_analysis/data_100ns/zero"];
,{t,1,100000}]
