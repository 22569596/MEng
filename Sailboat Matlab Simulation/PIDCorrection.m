% Correcting the PIDS Controller
scaler = STER(:,8)./PIDS(:,4);
plot(scaler.*PIDS(:,4))
hold on
plot(STER(:,8));
