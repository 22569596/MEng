%%% Numerical Parameter Calculation for dragonflite95
% Water Density
rho = 1025;

%% Ship Dimensions
B = 0.125;  % Breadth
T = 0.4;    % Draft
L = 0.95;   % Length
m = 2;      % Mass
CB = 0.05;  % Centre of Buoyancy
U = 1.3;    % Hull Speed
u = 0.3;    % Boat Speed

a = L/2;    
b = B/2;    
c = T;  

e = sqrt(1-(b^2)/(a^2));
Ao = (2*(1-e^2))/(e^3) * ((1/2) * log((1+e)/(1-e))-e);
Bo = 1/e^2 - (1-e^2)/(2*e^2)*log((1+e)/(1-e));
Co = Bo;

%% Hydrodynmaic Coefficients
k11 = (Ao)/(2-Ao);
k22 = (Bo)/(2-Bo);
k33 = (Co)/(2-Co);
k44 = 0;
k55 = ((L^2-4*T^2)^2 *(Ao-Co))/(2*(c^4 - a^4) + (Co-Ao)*(4*T^2+L^2)^2);
k66 = ((L^2-4*B^2)^2 *(Bo-Ao))/(2*(L^4-B^4)+(Ao-Bo)*(L^2+B^2)^2);

%% Moment of Inertia of the displaced water
Ixx = 1/120 * pi * rho * L * B * T * (4*T^2 + B^2);
Iyy = 1/120 * pi * rho * L * B * T * (4*T^2 + L^2);
Izz = 1/120 * pi * rho * L * B * T * (B^2 + L^2);

%% Hull Shape Parameters
H = 0.5;
beta = 0.785;

q = (H-1)/(H+1);
p = beta - pi/4;

b = (3/4 * pi *sqrt((pi/4)^2 - pi/2 * p * (1-q^2)))/(pi + p*(1-q^2));
a = (b+1)*q;

%% Added Mass Components
m11 = m*k11;
m22 = m*k22;
m33 = m*k33;
m44 = k44*Ixx;
m55 = k55*Iyy;
m66 = k66*Izz;
m26 = H^4 * (128)/(pi^2) * (a^2 * (1+b)^2 + 8/9 * a*b*(1+b) +16/9 * b^2)/(1+a+b)^4;
m62 = m26;
m24 = -16/(3*pi) * (a*(1-a+4/5 * b -a*b + 3/5 *b^2) +4/5 *b - 12/7 *b^2)/(((1-a)^2+3*b^2) * (1-a+b));
m42 = m24;

%% Linear Damping Forces and Moments
normTerm = 1/2 * rho * U^2 * L^2;
Yv = normTerm * -pi * T^2/L^2 * (1 +0.4 * CB * B/T);
Yr = normTerm * pi *  T^2/L^2 * (0.5 -2.2 * B/L +0.08* B/T);
Nv = normTerm * -pi * T^2/L^2 * (0.5 +2.4 * T/L);
Nr = normTerm * -pi * T^2/L^2 * (0.25 +0.039 * B/T - 0.56 * B/L);

Yv = Yv * (u^2)/(U^2);
Yr = Yr * (u^2)/(U^2);
Nv = Nv * (u^2)/(U^2);
Nr = Nr * (u^2)/(U^2);


%% Hull Resistance Calculation 
for x=0:0.1:1.3
    u = x;
    v = 0.1;
    Lwl = 0.9;
    g = 9.81;
    delta = 0.5 * 4/3 * B * L * 0.125 * pi;
    
    Re = (u*Lwl)/(v);
    Fn = u / (sqrt(g*Lwl));
    
    Cf = 0.075 / (log(Re)-2)^2;
    Rfh = 0.5 * rho * u^2 * Cf * (0.5*delta)
end