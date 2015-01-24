% crane dynamics using self-derivated model and linearization
function xddot = invertedPendulum(x, xdot, u)
    d = x(1);
    alpha = x(2);
    ddot = xdot(1);
    alphadot = xdot(2);


    %% Crane System Parameters
    Kf=2.282;
    Kp=24.969;
    Kd=0.0999;
    R=1.52;        % Motor electric resistance
    M=1.514;     %kg
    m1=1.628;
    m2=Kf*Kd/R;
    l=0.9;      %m
    g=9.81;      %gravity  
%     Kp=1000;
%     Kd=500;
%     r=0.02;     % equivalent Motor torque-force ratio(m)
%     R=0.1;        % Motor electric resistance
%     Ki=0.01;    % electromotive force constant Nm/A
%     Kf=Ki/r;
%     M=0.95;     %kg
%     m1=1.3;
%     m2=Kf*Kd/R;
%     l=0.9;      %m
%     g=9.8;      %gravity
    %% SS of linearized system
    Den=M*R+Kf*Kd;
    dddot = -(Kp+Kf)*Kf/Den*ddot + m1*g*R/Den*alpha - Kf*Kp/Den*u;
    alphaddot = (Kp+Kf)*Kf/(l*Den)*ddot -(M+m1+m2)*g*R/(l*Den)*alpha + Kf*Kp/(l*Den)*u;

    xddot = [dddot; alphaddot];
end
