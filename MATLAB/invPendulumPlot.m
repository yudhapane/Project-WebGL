function y = invPendulumPlot(u)
    w = 0.1;
    h = 0.07;
    l = 1.2;
    axis([-10 10 -1.5 0.5]);      
    x = u(1);
    alpha = u(2);
    rectangle('Position' , [x, 0, w, h], 'FaceColor','r');
    line([x+w/2 x+w/2+l*sin(alpha)], [0 -l*cos(alpha)],'LineWidth',2);
    grid on;
    pause(0.01);    
    newplot;