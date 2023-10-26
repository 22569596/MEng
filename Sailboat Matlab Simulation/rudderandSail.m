%% Script for plotting important parameters from ardupilot
% Tile Layout
t = tiledlayout(2,2);
% Rudder angle
 nexttile
 plot(STER(:,2)/10^8, STER(:,4)/4500*30)
 title("Rudder Angle");
 ylabel("Angle (Deg)");
 nexttile
% Desired and Actual Turn rate
 plot(STER(:,2), STER(:,7)) 
 title("Desired Turn Rate");
 ylabel("Rate (m/s)");
 nexttile
 plot(STER(:,2), STER(:,8)) 
 title("Actual Turn Rate");
 ylabel("Rate (m/s)");
 nexttile
% Sail Angle
 plot(SAIL(:,2), SAIL(:,5))
 title("Sail Angle");
 ylabel("Angle (Deg)");

