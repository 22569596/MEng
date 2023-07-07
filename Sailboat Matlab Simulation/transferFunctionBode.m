%%% Transfer Function %%%
%s = tf('s');
tf = K4 * 0.6526* (s+10.4) *(s+0.01) *(1/s) / (T*s^2 +s);
rltool(tf);