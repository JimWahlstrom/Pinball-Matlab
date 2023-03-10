function plot_animated(time, x, Vx, Ax, y, Vy, Ay)
       
regulator = 250; % Simplifies the animation. Bigger value => Fewer animation steps
figure

for i =  1:length(time)/regulator
    clf
    % Border
    line([-1 7.5], [7 7])
    line([-1 7.5], [-12 -12])
    line([-1 -1],[ -12 7])
    line([7.5 7.5], [-12 7])
    hold on
    
    plot(x(i*regulator), y(i*regulator),'o');
    plot(1,4,'o'); %obstacle
    axis([-2 9, -13 8]);
    pause(0.01)
   
end

