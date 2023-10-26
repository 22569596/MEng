%% K and T calculations
%run plotXY.m first
K = 1:1:length(DYawRate);
for i=6:1:length(DYawRate)
    K(i) = DYawRate(i)/abs(Rudder_Angle(i));
end
nexttile
plot(K)
title("K")
k = -2.1253;
T = 1:1:length(Dyaw_accel);
for i=1:1:length(Dyaw_accel)
     T(i)=0;
    if rem(i,5)==0
        T(i) = (k*Rudder_Angle(i/5)- DYawRate(i/5));
    end

end
T_s(1)=0;
x=1;
for i=1:1:length(Dyaw_accel)
    if rem(i,5)==0
     T_s(x)=T(i);
     x=x+1;
    end
end
nexttile
plot(T_s)
title("T")

%Turning Circle
%plot(DSpeed)
nexttile
plot(DYawRate)