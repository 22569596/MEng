%% Simplified 3 Degree of Freedom Model %%
% pg.68

% Main data
g   = 9.81;         % acceleration of gravity (m/s^2)
rho = 1025;         % density of water
L = 2.0;            % length (m)
B = 1.08;           % beam (m)
m = 55.0;           % mass (kg)
rg = [0.2 0 -0.2]'; % CG for hull only (m)
R44 = 0.4 * B;      % radii of gyrations (m)
R55 = 0.25 * L;
R66 = 0.25 * L;
T_yaw = 1;          % time constant in yaw (s)
Umax = 6 * 0.5144;  % max forward speed (m/s)


% Data for one pontoon
B_pont  = 0.25;     % beam of one pontoon (m)
y_pont  = 0.395;    % distance from centerline to waterline area center (m)
Cw_pont = 0.75;     % waterline area coefficient (-)
Cb_pont = 0.4;      % block coefficient, computed from m = 55 kg

% Inertia dyadic, volume displacement and draft
nabla = (m)/rho;                         % volume
T = nabla / (2 * Cb_pont * B_pont*L);       % draft
Ig_CG = m * diag([R44^2, R55^2, R66^2]);    % only hull in CG
Ig = Ig_CG - m * [0.2 0 -0.2; 0 0 0 ;-0.2 0 0.2]^2;  % hull + payload in CO

% MRB and CRB (Fossen 2021)
I3 = eye(3);
O3 = zeros(3,3);

MRB_CG = [ m * I3  O3
           O3           Ig ];
 
MRB = MRB_CG;
% System mass and Coriolis-centripetal matrices
M = MRB + MA;

% Hydrodynamic added mass (best practise)
Xudot = 2;   % Simplification
Yvdot = -1.5 * m;
Zwdot = -1.0 * m;
Kpdot = -0.2 * Ig(1,1);
Mqdot = -0.8 * Ig(2,2);
Nrdot = -1.7 * Ig(3,3);

MA = -diag([Xudot, Yvdot, Zwdot, Kpdot, Mqdot, Nrdot]);  

Xu = -24.4 * g / Umax;           % specified using the maximum speed  
Yv = 0;
Nr = -M(6,6) / T_yaw;

d11 = Xu;        % Hydrodynamic Parameter 1
d22 = -Yv;        % Hydrodynamic Parameter 2
d33 = - Nr;        % Hydrodynamic Parameter 3

m11 = m - Xudot;     
m22 = m - Yvdot;
m33 = 10 - Nrdot;

omega=0;
tr=1;      % Force applied to the rudder
tu=10;         % Force applied from the sail

