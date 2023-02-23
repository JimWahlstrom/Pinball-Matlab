function [x, y,Vx,Vy] = collision_object_obstacle(old_x, old_y, old_Vx, old_Vy, Ax, Ay,n, radius, obstacle_radius, obstacle_pos, obstacle_push_vel )
%UNTITLED2 Summary of this function goes here
%   timestamp: 11:55 , https://www.youtube.com/watch?v=NhVUCsXp-Uo

 dir = [old_x - obstacle_pos(1,1), old_y - obstacle_pos(1,2)]; % vector between object and obstacle. 
 d = sqrt(dir(1,1)^2 + dir(1,2)^2); % length of vector
 
 if d > radius + obstacle_radius         
         Vx = euler1(old_Vx,Ax,n);
         Vy = euler1(old_Vy,Ay,n);
         x = euler1(old_x,old_Vx,n); % Objektets x-koordinat beror på dens tidigare position plus tidigare hastigheten                      
         y = euler1(old_y,old_Vy,n); % Objektets y-koordinat beror på dens tidigare position plus tidigare hastigheten
 else % collision
    dir = [dir(1,1)/d, dir(1,2)/d]; % rescaling vector, dir.   
%     disp(dir(1,1))
%     disp(dir(1,2))
%     disp(old_Vx)
%     disp(old_Vy)
%     
    corr = radius + obstacle_radius - d;
    
    x = old_x + dir(1,1)*corr;
    y = old_y + dir(1,2)*corr;

    dv = old_Vx*dir(1,1) + old_Vy*dir(1,2); % Scalar product of the objects velocity and dir.
    
    
    %Vx = euler1(old_Vx,Ax,n);
    %Vy = euler1(old_Vy,Ay,n);
    Vx = old_Vx + dir(1,1)*(obstacle_push_vel-dv);
    Vy = old_Vy + dir(1,2)*(obstacle_push_vel-dv);
    %Vx = Euler1(Vx, )
    disp(old_Vy)
    disp(Vy)
 end

end

