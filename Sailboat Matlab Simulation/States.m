% GPS Latitude & Longitude & Speed & Ground Course
% plot(GPS_0(:,2), GPS_0(:,9))
% plot(GPS_0(:,2), GPS_0(:,10))
% plot(GPS_0(:,2), GPS_0(:,12))
% plot(GPS_0(:,2), GPS_0(:,13))

% Vehicle Attitude: Roll & Pich & Yaw
% plot(ATT(:,2), ATT(:,4))
% plot(ATT(:,2), ATT(:,6))
% plot(ATT(:,2), ATT(:,8))

% States: Roll, Pitch, Yaw & VN, VE, VD & PN, PE, PD
 nexttile
 plot(XKF1_1(:,2), XKF1_1(:,4))
 title("Roll Angle");
 grid on
 nexttile
 plot(XKF1_1(:,2), XKF1_1(:,5))
 title("Pitch Angle");
 grid on
 nexttile
 plot(XKF1_1(:,2), XKF1_1(:,6))
 title("Yaw Angle");
 grid on
 nexttile
 plot(XKF1_1(:,2), XKF1_1(:,7))
 title("Velocity North");
 grid on
 nexttile
 plot(XKF1_1(:,2), XKF1_1(:,8))
 title("Velocity East");
 grid on
 nexttile
 plot(XKF1_1(:,2), XKF1_1(:,9))
 title("Velocity Down");
 grid on
 nexttile
 plot(XKF1_1(:,2), XKF1_1(:,11))
 title("Position North");
 grid on
 nexttile
 plot(XKF1_1(:,2), XKF1_1(:,12))
 title("Position East");
 grid on
 %nexttile
 %plot(XKF1_1(:,2), XKF1_1(:,13))
 %title("Position Down")
 nexttile
 plot(XKF1_1(:,12), XKF1_1(:,11))
 title("Global Position (E,N)");
 grid on
