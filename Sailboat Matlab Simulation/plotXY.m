% Limit Yaw to -180->180
for x=1:1:length(ATT)
    if (ATT(x,8)) >180
        Yaw(x) = ATT(x,8)-360;

    else 
        Yaw(x) = ATT(x,8);
    end
end

i=1;
DYaw(i)=0;
for x=1:1:length(ATT)
   % if (ATT(x,2)/1000000>93 && ATT(x,2)/1000000<102)
    DYaw(i)=Yaw(x);
    i=i+1;
    %end
end
% Plot Yaw Angle
nexttile 
plot(DYaw);
title("Yaw Angle")
grid on
xlabel("Sample(n)")
hold on


i=1;
DYawRate(i)=0;
for x=1:1:length(STER)
    %if (STER(x,2)/1000000>93 && STER(x,2)/1000000<102)
    DYawRate(i)=STER(x,8);
    i=i+1;
    %end
end
%Plot Desired Yaw Rate
nexttile
hold on 
X_DYawRate = 1:1*5:(length(DYaw)-5);
plot(X_DYawRate,DYawRate)
grid on
xlabel("Sample(n)")
title("Yaw Rate");


i=1;
DRudderAngle(i)=0;
for x=1:1:length(RCOU)
   % if (RCOU(x,2)/1000000>93 && RCOU(x,2)/1000000<102)
    DRudderAngle(i)=RCOU(x,11);
    i=i+1;
    %end
end
% Plot Rudder Angle
nexttile
Rudder_Angle =  (DRudderAngle-1500)/400*27;
plot(X_DYawRate,Rudder_Angle);
grid on
xlabel("Sample(n)")
title("Rudder Angle");

i=1;
DRollAngle(i)=0;
for x=1:1:length(ATT)
    %if (ATT(x,2)/1000000>94 && ATT(x,2)/1000000<102)
    DRollAngle(i)=ATT(x,4)-6;
    i=i+1;
    %end
end
% Plot Roll Angle
nexttile
plot(DRollAngle);
grid on
xlabel("Sample(n)")
title("Roll Angle");


i=1;
DSpeed(i)=0;
for x=1:1:length(XKF1_1)
   % if (XKF1_1(x,2)/1000000>94 && XKF1_1(x,2)/1000000<102)
    DSpeed(i)=sqrt(XKF1_1(x,7).^2+XKF1_1(x,8).^2);
    i=i+1;
    %end
end

%Plot speed of boat
nexttile
plot(DSpeed);
grid on
xlabel("Sample(n)")
title("Sailboat Speed")

%Plot Yaw acceleration
nexttile
hold on
title("Yaw Acceleration")
grid on
xlabel("Sample(n)")
i=1;
Dyaw_accel(i)=0;
for x=2:1:length(IMU_0)
   % if (IMU_0(x,2)/1000000>93 && IMU_0(x,2)/1000000<102)
    Dyaw_accel(i)=(IMU_0(x,6)-IMU_0(x-1,6))/((IMU_0(x,2)-IMU_0(x-1,2))/1000000);
    i=i+1;
    %end
end
plot(Dyaw_accel)


%Plot Yaw and Rudder Angle
%nexttile
hold on
Rudder_Angle(1)=10.125;
Rudder_Angle(2)=10.125;
Rudder_Angle(3)=10.125;
Rudder_Angle(4)=10.125;
xaxis_rudder = 94.1:0.1:101.2;
xaxis_yaw = 94:0.02:101.26;
%plot(xaxis_rudder,-Rudder_Angle+156)
%plot(xaxis_yaw,DYaw)
grid on
title("ZigZag Test")



%% Plot Yaw Rate and Yaw Accel
X_accel = 94:0.02:101.26;
X_Num = 94:0.1:101.1;
%nexttile
%hold on
%plot((xaxis_rudder-94)*10*5,DYawRate)
%plot(X_accel,Dyaw_accel)
%plot(X_Num,-Num)
