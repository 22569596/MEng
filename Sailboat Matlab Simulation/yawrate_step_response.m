%% Yaw Rate Step Response
i=1;
DYawRate(i)=0;
for x=1:1:length(STER)
    if (STER(x,2)/1000000>93 && STER(x,2)/1000000<102)
    DYawRate(i)=STER(x,8);
    i=i+1;
    end
end
%Plot Desired Yaw Rate
hold on 
% Define sampling time and length
Hz = 10;
T = 1/Hz;
time = 1*T:1*T:length(Rudder_Angle)*T;
yawRate = smoothdata(-DYawRate,"loess");
plot(time,yawRate)



i=1;
DRudderAngle(i)=0;
for x=1:1:length(RCOU)
    if (RCOU(x,2)/1000000>93 && RCOU(x,2)/1000000<102)
    DRudderAngle(i)=RCOU(x,11);
    i=i+1;
    end
end
% Plot Rudder Angle

Rudder_Angle =  (DRudderAngle-1500)/400*27;
plot(time,Rudder_Angle-0.4);
grid on
xlabel("Sample(n)")

