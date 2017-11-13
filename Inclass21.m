%In class 21

%Walter Frank Lenoir

% 1. Consider the system we discussed in class for a gene which is produced
% and degraded: dx/dt = k - d*x. Now consider that this gene turns on a
% second gene y, which also degrades so that its equation is 
% dy/dt = k2*x - d2*y. Choose some values for k,d,k2, and d2 and run a
% numerical simulation of this system for the case where both genes start
% out off ( x(0) = 0 and y(0) = 0). Plot the value of x and y in time and 
% explain your results. 

%dx = k1-d*x;
%dy = k2*x - d2*y;

F = @(t,x) [2-1*x(1);2*x(1) - 3*x(2)]; 
sol = ode23(F, [0 10],[0,0]);
plot(sol.x, sol.y(1,:)); 
hold on;
plot(sol.x, sol.y(2,:)); 
hold off;

%  dx/dt and dy/dt both have a log type curve that plateaus at 2 and ~1.3 
% respectively.  This suggests that around t = 3, x has degraded. 

% 2. Consider the following model: 
% dx/dt = y
% dy/dt = (1-x^2)*y - x
% write code that simulates this system for several different starting
% values of x and y. Plot the results and comment on them. 

F = @(t,x) [x(2);(1-x(1)^2)*x(2) - x(1)]; 
for i = 1:5
    xtemp = randi(10);
    ytemp = randi(10);
    sol = ode23(F, [0 10],[xtemp,ytemp]);
    figure;
    plot(sol.x, sol.y(1,:)); 
    hold on;
    plot(sol.x, sol.y(2,:)); 
    hold off;
    disp(xtemp);
    disp(ytemp);    
    
end 
% Curves yielded different results depending on whether on if y > x or x >
% y. If y > x, the two curves would fluctuate, alternating on which was
% higher than the other. When x > y, dy/dt would immediately plateau at 0,
% and the two curves would flucuate close to 10 depending on the difference
% between xtemp and ytemp. 
