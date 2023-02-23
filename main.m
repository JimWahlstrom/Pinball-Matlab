clc
clear variables
close all
% Description of the system
% A simulation of a physical system that depicts a simple object the size of a pinball 
% being launched by a spring. 

% SIMULATION PROPERTIES
n = 0.0001; % Step-size                                            
tf = 7; % Simulation time


% PHYSICAL PROPERTIES
% Spring based on Standard (10-148-1)
k_spring = 75; % Spring constant in N/m . Couldn't find information of the spring constant so this is guess work.
%equilibrium = 0.14; meters  
displacement = 0.07; % Contraction in meters

gravity = 9.81; % m/s^2
fc = 0.2; %   Coefficient of friction. metal on wood (0.2-0.6)

% Object based on a steel ball 
mass = 0.08; % kilogram 
object_Fmg = mass*-gravity;
object_Fnormal = mass*gravity;
Fb = gravity*mass*fc; % funkar inte. Blir negativa hastigheter och allt knasar.
radius = 0.0135; % 2.7cm diameter
% Acceleration
Ax(1) = 0; 
Ay(1) = object_Fmg + object_Fnormal; 
% Velocity
Vx(1) = 0;
Vy(1) = 0; 
% Position
x(1) = 0;
y(1) = 5; 

% Obstacle
% 1 obstacle
obstacle_radius = 0.1; % meters
obstacle_pos = [1,5];  % x:(1,1) y:(1,2)
obstacle_push_vel = 1; % m/s 

% SIMULATION
for k = 2:(tf/n) 
       
    Fk = k_spring * displacement; % Hookes law: m*a = k_spring*displacement. 
    
    Fxtot = Fk - Fb; % Total force applied to the moving objec
    Fytot = object_Fmg + object_Fnormal; 
    
    Ax(k) = Fxtot/mass; % Objektets acceleration i x-led . 
    Ay(k) = Fytot; % Objektets acceleration i y-led . 
    
    if x(k-1) < 1 % ytans längd är 1 meter
        % Objektet är i kontakt med fjädern och ytan
        if  displacement > 0 % while the object is in contact with the spring, calculate the following.       
            Vx(k) = euler1(Vx(k-1),Ax(k-1),n); % Objektets hastighet i x-led beror på den tidigare hastigheten samt accelerationen från fjädern 
            x(k) = euler1(x(k-1),Vx(k-1),n); % Objektets x-koordinat beror på dens tidigare position plus tidigare hastigheten
            
            displacement = euler1(displacement, -(Vx(k-1)),n); % displacement håller koll på hur länge fjädern är sammandragen, alltså dess kontakt med massan samt tillförelsen av acceleration&/hastighet. 
            if displacement < 0
                displacement = 0;
            end
            
        else % Objektet är ej längre i kontakt med fjädern men har kontakt med ytan. 
            Vx(k) = euler1(Vx(k-1),Ax(k-1),n); % Objektets hastighet 
            if Vx(k) <= 0
                Vx(k) = 0;
            end
            x(k) = euler1(x(k-1),Vx(k-1),n); % Objektets x-koordinat förflyttas med jämna mellanrum. 
        end
    else % Objektet har lämnat ytan
        object_Fnormal = 0; % ingen normalkraft
        Fb=0; % Ingen friktion
        %Ax(k) = 0;
 
        Vx(k) = euler1(Vx(k-1),Ax(k-1),n); % Objektets hastighet i x-led beror på den tidigare hastigheten samt accelerationen från fjädern 
        x(k) = euler1(x(k-1),Vx(k-1),n); % Objektets x-koordinat beror på dens tidigare position plus tidigare hastigheten       
    end
        
    
    Vy(k) = euler1(Vy(k-1),Ay(k-1),n); % Objektets hastighet i y-led
    y(k) = euler1(y(k-1),Vy(k-1),n); % Objektets y-koordinat beror på dens tidigare position plus tidigare hastigheten
    
    
    time(k) = n*(k-1); % En vektor för tiden så att det hela kan plottas.
end

% Plot figures
%plot_figure(time, x, Vx, Ax, y, Vy, Ay);
plot_animated(time, x, Vx, Ax, y, Vy, Ay);

