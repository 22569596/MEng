%%% ZIGZAG MANEUVER %%%
% Inputs from tests
startTime = 17.893;
te =  18.632 - startTime;
te1 = 0;
te2 = 0;

t04 = 18.82 - startTime;
t06 = 0;
t08 = 0;

t1 = 18.077 - startTime;
t2 = 18.254 - startTime;
t3 = 18.435 - startTime;
t4 = 0;
t5 = 0;
t6 = 0;
t7 = 0; 

delta1 = 20;
delta2 = -delta1;
delta3 = delta1;
delta4 = -delta1;

Psi4 = 24;
Psi6 = 0;
Psi8 = 0;


% Calculation of Integrals
t=te;
int4 = delta1*(-t1/2 + 1/2 * (t2 + t3)) + delta2 * (-1/2 * (t2 + t3 + t));

% Calculation of K4
K4 = Psi4 / (delta1*te + int4) ;

% Calculation of T4
Psidot = (272.89-274.75)/(18.841-18.807);
t=t04;
int4T = delta1*(-t1/2 + 1/2 * (t2 + t3)) + delta2 * (-1/2 * (t2 + t3 + t));
T4 = -K4 / (Psidot) * (int4T + delta1*t04);

% Maneuverability Index 
P = 0.5 * K4/T4

