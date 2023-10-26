%% Rudder PID
% PIDS
% 2-TimeUs
% 3-Desired Value
% 4-Achieved Value
% 5-Error Between achieved and
% 6-P
% 7-I
% 8-D
% 9-FeedForward
% 10-scaler applied to D gain to reduce limit cycling
% 11- slew rate used in slew limiter

%plot(PIDS(:,2),PIDS(:,3))
%hold on
%plot(PIDS(:,2),PIDS(:,4))
plot(PIDS(:,2),PIDS(:,6))
hold on
plot(PIDS(:,2),PIDS(:,8))