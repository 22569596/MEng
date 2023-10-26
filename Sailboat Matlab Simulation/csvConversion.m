%% Convert Data to csv file
X_DYaw = 1:1:length(yawRate);
x_axis= X_DYaw;
y_axis= yawRate;

% Define sampling time and length
Hz = 10;
T = 1/Hz;
% X-axis
for i=1:1:length(yawRate)
    yawRate6(1,i) = x_axis(i)*T;
end
% Y-axis
for i=1:1:length(yawRate)
    yawRate6(2,i) = y_axis(i);
end
yawRate6=yawRate6';
csvwrite('yawRate_6.csv',yawRate6);
plot(x_axis*0.05,y_axis)