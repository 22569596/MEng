%% Rotation Rate Gyro
 nexttile
 plot(IMU_0(:,2), IMU_0(:,7))
 hold on
 plot(XKF1_0(:,2), XKF1_0(:,14))
 title("Rotation Rate x-axis")
 nexttile
 plot(IMU_0(:,2), IMU_0(:,8))
 hold on
 plot(XKF1_0(:,2), XKF1_0(:,15))
 title("Rotation Rate y-axis")
 nexttile
 plot(IMU_0(:,2), IMU_0(:,9))
 hold on
 plot(XKF1_0(:,2), XKF1_0(:,16))
 title("Rotation Rate z-axis")