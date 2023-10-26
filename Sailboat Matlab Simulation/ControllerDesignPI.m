%%% PID CONTROLLER DESIGN %%%
s = tf('s');

%% Transfer Function
Hs = K / (T *s + 1);

%% Specification
Overshoot = 0;
ts = 2.5;
if Overshoot==0
    zeta = 1;
else
    zeta = sqrt(log(Overshoot)^2/(pi^2 +log(Overshoot)^2));
end

%% Closed-Loop Poles
wn = 4/ts;
sigma = -wn; 

%% Zero Placement
Ki_Kp=0.1;

%% Gain rule 
Kp = (0.02594*sigma+1)*sigma/(0.1011*(sigma+Ki_Kp))
Ki = Ki_Kp * Kp

Ds = Hs* (Kp*(s+Ki/Kp))/s