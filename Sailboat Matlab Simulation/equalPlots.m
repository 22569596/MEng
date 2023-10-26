%% Plot Graphs in Equal Size
hold on
plot(out.time.Data,out.nonLinear.Data);
%plot(out.time.Data,out.stepInput.Data);
fig=gcf;
fig.Position(3:4)=[550,400];
grid on