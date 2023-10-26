%% Body-Frame Velocites
VN = XKF1_0(:,7);
VE = XKF1_0(:,8);
Yaw = ATT(:,8);
U = sqrt(VN.^2 + VE.^2);
plot(U)