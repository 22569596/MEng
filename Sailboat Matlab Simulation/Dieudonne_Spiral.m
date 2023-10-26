%% Dieudonne's Spiral Maneuver
Rudder = [14,12, 10, 8, 6, 4, 2, -2, -4, -6, -8, -10,-12,-14];
Yaw_Rate = [-26,-25,-23,-16, -6, -4.5, -3, 3.5, 6, 7.5, 15, 20, 22,23];
%plot(Rudder,Yaw_Rate)

xx  = linspace(-12, 12, 100);
yy1 = interp1(Rudder, Yaw_Rate, xx, 'spline');
hold on
plot(xx, yy1, 'r-')
plot([0 0], [30 -30], 'b')
plot([20 -20], [0 0], 'b')
grid on
axis equal