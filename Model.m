function dx = Model(t, x, F)
    x1 = x(:,1);
    x2 = x(:,2);
    x3 = x(:,3);
    x4 = x(:,4);

   [x1, x2, x3, x4] = model(F, x1, x2, x3, x4);
   dx = [x1; x2; x3; x4];
end


function [thetta, dThetta, x, dX] = model(u, thetta, dThetta, x, dX)

    global sys

    k2 = sys.k2;
    b2 = sys.b2;
    M1 = sys.M1;
    M2 = sys.M2;
    M3 = sys.M3;
    l = sys.l;
    g = sys.g;

    N = 0;
    
    % Ограничение на движение
    % if x >= sys.l1_max || x <= -sys.l1_max
    %     N = -u;
    % end
    
    tau = [dThetta; ((u + N) * M2/M1 * l * cos(thetta) - (M2)^2 / M1 * l^2 * cos(thetta) * dThetta^2 * sin(thetta) + M2 * l * g * sin(thetta) - b2 * dThetta - k2 * thetta) / (M3 * l^2 - M2^2 / M1 * l^2 * cos(thetta)^2)];
    coords = [dX; ((u + N) + M2 * ( l * tau(2,1) * cos(thetta) - l * dThetta^2 * sin(thetta) ) )/ M1];
    
    thetta = tau(1);
    dThetta = tau(2);
    x = coords(1);
    dX = coords(2);

end

function [thetta, dThetta, x, dX] = model2(u, thetta, dThetta, x, dX)

    global sys

    F = u*cos(sys.alpha)*cos(sys.alpha) - (sys.m1 + sys.m2 + sys.m3)*sys.g*sin(sys.alpha)*cos(sys.alpha);

    % Ограничение на движение
    % if x >= sys.l1_max || x <= -sys.l1_max
    %     F = 0;
    % end

    x = [x dX thetta dThetta];

    c1 = -((sys.m2+(sys.m3)/2)*(cos(x(3))-tan(sys.alpha)*sin(x(3)))*sys.l)/((sys.m1+sys.m2+sys.m3)/(cos(sys.alpha)^2));
    c2 = -((sys.m2+(sys.m3)/2)*(cos(x(3))-tan(sys.alpha)*sin(x(3)))*sys.l)/((sys.m2+(sys.m3)/3)*(sys.l)^2);

    dx = zeros(4,1);

    M = [1, 0 ,0, 0;
        0, 1, 0, c1;
        0, 0, 1, 0;
        0, c2, 0, 1];

    dx(1) = x(2);
    dx(2) = (F - (sys.m2 + (sys.m3)/2)*(sys.l*(x(4)^2)*(sin(x(3))+tan(sys.alpha)*cos(x(3)))))/((sys.m1+sys.m2+sys.m3)/(cos(sys.alpha)^2));
    dx(3) = x(4);
    dx(4) = ((sys.m2+(sys.m3)/2)*sys.g*sys.l*sin(x(3))-sys.b2*x(4)-sys.k2*x(3))/((sys.m2+(sys.m3)/3)*(sys.l)^2);
    dx(:,1) = M*dx;

    thetta = dx(3, 1);
    dThetta = dx(4, 1);
    x = dx(1, 1);
    dX = dx(2, 1);
end


