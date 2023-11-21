%% Dieudonne's Spiral Maneuver
%Real Sailboat
Rudder = [14,12, 10, 8, 6, 4, 2, -2, -4, -6, -8, -10,-12,-14];
Yaw_Rate = [-30,-26,-23,-19, -12.22, -10.263, -4.48, 5.18, 10.15, 13.18, 15, 20, 23,25];
%plot(Rudder,Yaw_Rate)
% Simulation
Rudder_SIM = [14, 12, 10, 8, 6, 4, 2, -2, -4, -6, -8, -10, -12, -14];
Yaw_Rate_SIM =[-30, -25, -22, -16.5, -12.5, -10.4,-5.2, 5.2, 10.4, 14.95, 20.8, 26, 31,37.7];
xx  = linspace(-14, 14, 100);
yy1 = interp1(Rudder, Yaw_Rate, xx, 'spline');
hold on
plot(xx, yy1, 'r-')
xx  = linspace(-14, 14, 100);
yy1 = interp1(Rudder_SIM, Yaw_Rate_SIM, xx, 'spline');
plot(xx, yy1, 'g-')
%plot([0 0], [30 -30], 'b')
%plot([20 -20], [0 0], 'b')
grid on
%axis equal