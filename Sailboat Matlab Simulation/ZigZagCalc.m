%%% ZIGZAG MANEUVER %%%

%%Time of logs start with seconds SS::0000000
% Inputs from tests
startTime = 94;
te =  94.64 - startTime;
te1 = 96 - startTime;
te2 = 97.18 - startTime;

% Where Heading crosses zero degrees
t04 = 95.36  - startTime;
t06 = 96.6 - startTime;
t08 = 97.96 - startTime;

t1 = 94.1 - startTime;
t2 = 94.4 - startTime;
t3 = 94.5 - startTime;
t4 = 95.7 - startTime;
t5 = 95.8 - startTime;
t6 = 96.9 - startTime;
t7 = 97.02 - startTime; 

delta1 = -10/180*pi;
delta2 = -delta1;
delta3 = delta1;
delta4 = -delta1;

Psi4 = -10/180*pi;
Psi6 = 10/180*pi;
Psi8 = -10/180*pi;


% Calculation of Integrals
t=te;
int4 = delta1*(-t1/2 + 1/2 * (t2 + t3)) + delta2 * (-1/2 * (t2 + t3) + t);
t=te1;
int6 = delta1*(-t1/2 + 1/2 * (t2 + t3)) + delta2 * (-1/2 * (t2 + t3) + 1/2 * (t4 + t5)) + delta3 * (-1/2 * (t4 + t5) + t);
t=te2;
int8 = delta1*(-t1/2 + 1/2 * (t2 + t3)) + delta2 * (-1/2 * (t2 + t3) + 1/2 * (t4 + t5)) + delta3 * (-1/2 * (t4 + t5) + t) + delta4*(-0.5*(t6 + t7) + t);

% Calculation of K4 & K6 & K8
K4 = Psi4 / (delta1*te - int4) ;
K6 = Psi6 / (delta2*te1 - int6) ;
K8 = Psi8 / (delta3*te2 - int8);

% Calculation of T4 & T6 & K8
K = (K4+K6+K8)/3
Psidot4 = (159.33-(151.21))/(96.2422-(95.8617));
T4 = (K / (Psidot4) )* (int4 + delta1*t04);

Psidot6 = (151.27-(158.93)) / (97.5217-(97.2017));
T6 = (K / (Psidot6) )* (int6 + delta2*t06);

Psidot8 = (159.29-(152.04)) / (98.8619-98.4817);
T8 = (K/Psidot8)*(int8 + delta3*t08);

% Maneuverability Index 
K = 21/10.125;
T = (-T4-T6-T8)/3;
P = 0.5*K/T;
s=tf('s');
Gs = K/(T*s+1);


%% u0 = 0.1
% K = 2.6601
% T = 12.3849
% P = 0.1074

%% u0 = 0.3
% K = 54.5879
% T = 34.0582
% P = 0.8014

%% u0 = 0.5
% K = 1.0119
% T = 0.3002
% P = 1.6855

%% u0 = 0.7
% K = 0.7440
% T = 0.1243
% P = 2.9929


