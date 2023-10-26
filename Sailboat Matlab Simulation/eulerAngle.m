%% Euler Angle and Rotation Rate
% 
 nexttile
 plot(IMU_0(:,2), IMU_0(:,7))
 title("Rotation Rate Roll")
 grid on

 nexttile
 plot(IMU_0(:,2), IMU_0(:,8))
 title("Rotation Rate Pitch")
 grid on

 nexttile
 plot(IMU_0(:,2), IMU_0(:,9))
 title("Rotation Rate Yaw")
 grid on

 nexttile
 plot(XKF1_1(:,2), XKF1_1(:,4))
 title("Roll Angle")
 grid on

 nexttile
 plot(XKF1_1(:,2), XKF1_1(:,5))
 title("Pitch Angle")
 grid on

 nexttile
 plot(XKF1_1(:,2), XKF1_1(:,6))
 title("Yaw Angle")
 grid on