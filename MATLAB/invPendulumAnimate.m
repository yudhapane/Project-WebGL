function invPendulumAnimate(simData)%,xylist)
    %% Data acquisitions and parameter definition
    close all;
    t = simData.Time;
    recCartPos = simData.Data(:,1);
    recTheta = simData.Data(:,2);
    recInput = simData.Data(:,3);       
    
    par.l = -0.7;
    par.w = 0.05;
    par.w_c = 0.2;
    par.h_c = 0.1;
    
    colors1 = [1 0 0];
    colors2 = [0 1 0];
    colors3 = [0 0 1];
    colors4 = [0.5 0.5 0.5];

    %% Create link shape
    cart = cartShape(par);
    pendulum = pendShape(par);

    %% Objects
    animationfig = figure;
    AxesHandle = axes('Parent',animationfig, 'Position',[0 0 1 1]);
    link1 = patch('Parent',AxesHandle, 'FaceColor',colors1(1,:));   % cart
    link2 = patch('Parent',AxesHandle, 'FaceColor',colors2(1,:));   % pendulum    
%     table = line('Parent',AxesHandle, 'Color',[0 0 0], 'LineWidth',2);
  
    
    %% Animation
    for n=1:length(t)
        % state vector
        cartPos = recCartPos(n);
        theta = recTheta(n);
                      
        pos1 = move(cart,[cartPos;0]);
        pos2 = move(R(theta)*pendulum,[cartPos;0]);
        
        set(link1,'Xdata',pos1(1,:),'Ydata',pos1(2,:));
        set(link2,'Xdata',pos2(1,:),'Ydata',pos2(2,:));
        
        % table
%         table_pos = [-1, 4; -0.051 -0.051];
%         set(table,'Xdata',table_pos(1,:),'Ydata',table_pos(2,:));
        axis([-2 3 -1 1]); %axis equal;
        drawnow
        pause(0.05);
    end


function shape = pendShape(par)
    l = par.l;
    w = par.w;
    n = linspace(pi/2,-pi/2,20);
    top_arc = (w/2)*[sin(n);cos(n)];
    bottom_arc = (w/2)*[-sin(n);-cos(n)];
    if l<0
        bottom_arc(2,:) = bottom_arc(2,:)+l;
    else
        top_arc(2,:) = top_arc(2,:)+l;
    end
    shape = [bottom_arc, top_arc];
    
function shape = cartShape(par)
    w = par.w_c;
    h = par.h_c;    
    shape = [-w/2  w/2 w/2 -w/2;
             -h/2 -h/2 h/2 h/2];
              

function rot = R(phi)
    rot = [cos(phi) -sin(phi);
    sin(phi) cos(phi)];


function c = move(a, b)
    c(1,:) = a(1,:) + b(1);
    c(2,:) = a(2,:) + b(2);