%%% PID CONTROLLER DESIGN %%%
K=0.6252;
T=0.4;
s = tf('s');

%% Transfer Function
Hs = K / (T *s^2 + s);

%% Design Specifications
Ts = 2;
overshoot = 0.1;

%% PID Calculation
zeta = sqrt(log(overshoot)^2/(pi^2 +log(overshoot)^2));
wn = (4/Ts)/zeta;

%% Desired Poles
real = wn*zeta ;
imag = wn*sqrt(1-zeta^2);
p1 = -real + 1i*imag;
p2 = -real - 1i*imag;

%% -180 Rule for placing zero
p1_Angle = 180 - atand(imag/real);
p2_Angle = atand(imag/(1/T-real));
zero_Angle = p1_Angle+p2_Angle-180;
a = (imag/tand(zero_Angle))+real;

%% Overall Gain of PID Controller Leg Rule
L1 = sqrt(imag^2+real^2);
L2 = sqrt((real-1/T)^2+imag^2);
L3 = sqrt((a-real)^2+imag^2);

Koverall = L1*L2/L3;
Kpid = Koverall/(K/T);

%% Integrator placed at origin with zero close next to it so root locus stays unchanged
b=0.01;

%% PID Controller

Cs = Kpid * (s+a) * (s+b) / s

rlocus(Cs*Hs);




