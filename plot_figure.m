function plot_figure(time, x, Vx, Ax, y, Vy, Ay)
%PLOT Summary of this function goes here
%   Detailed explanation goes here


% Seven plots in one figure                                            
tiledlayout('flow')
%(1,1)
nexttile
plot(time, x,':')
xlabel('time (s)') 
ylabel('x-coordinate (meters)')

%(1,2)
nexttile
plot(time, Vx,'--')
xlabel('time (s)') 
ylabel('x-velocity (m/s)')

%(1,3)
nexttile
plot(time, Ax,'-')
xlabel('time (s)') 
ylabel('x-Acceleration (m/s^2)')

%(2,1)
nexttile
plot(time, y,':')
xlabel('time (s)') 
ylabel('y-coordinate (meters)')

%(2,2)
nexttile
plot(time, Vy,'--')
xlabel('time (s)') 
ylabel('y-velocity (m/s)')

%(2,3)
nexttile
plot(time, Ay,'-')
xlabel('time (s)') 
ylabel('y-Acceleration (m/s^2)')

%(3,1)
nexttile
plot(x, y,'-')
xlabel('x-coordinate') 
ylabel('y-coordinate')
axis([-1 4, -1 6])

end

