%% Convert Data to csv file
X_DYaw = 1:1:length(DYawRate);
x_axis= X_DYawRate;
y_axis= DYawRate;

% Define sampling time and length
Hz = 40;
T = 1/Hz;
% X-axis
yawRate(1)=0;
for i=1:1:length(X_DYaw)
    yawRate(1,i) = x_axis(i) *T;
end
% Y-axis
for i=1:1:length(X_DYaw)
    yawRate(2,i) = -y_axis(i);
end
yawRate=yawRate';
csvwrite('YawStepReal.csv',yawRate);
plot(x_axis*T,-y_axis)