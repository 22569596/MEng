%% Root Locus P and PI Controller Design
K = 2.12;
T = 0.15;
s = tf('s');
Hs = K/(T*s+1);
Ds = (1.0617*(s+0.172))/s;

rltool(Hs);
