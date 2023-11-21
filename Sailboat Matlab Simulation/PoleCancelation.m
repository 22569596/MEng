%% System Pole Cancelation Method

a = 1/0.15;
scl=-8;
K = abs(1/((scl)*(0.15*scl+1))/(2.12*(scl+a)));
Ds = K*(s+a)/s
Ki = K*a
Kp = K
Hs = 2.12/(0.15*s+1);
rltool(Ds*Hs);