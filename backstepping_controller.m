function u  = backstepping_controller(x1, x2, x3, x4)


    % c1 = 4;
    % 
    % c2 = 3;
    % 
    % c3 = 0.675;
    % 
    % k3 = 1.0;
    % 
    % k4 = 15;

    c1 = 3;

    c2 = 10;

    c3 = 0.675;

    k3 = 1.0;

    k4 = 20;
    
    
    b2 = 0.01;
    k2 = 0;
    m1 = 0.5;
    m2 = 0.15;
    m3 = 0.05;
    M1 = m1+m2+m3;
    M2 = m2+m3*0.5;
    M3 = m2+m3/3;
    l = 0.15;
    g = 9.81;
    
    A = (M2 * g) / (M3 * l);
    B = (M2) / (M3 * l);
    C = -b2 / (M3 * l^2);
    D = -k2 / (M3 ^ l^2);
    E = M2 * l / M1;
    F = -M2 * l / M1;

    
    ADD = (1 - E * cos(x1) ^ 2) * (k3 * x3 + k4 * x4);

    %u_thetta = M1 / (B * cos(x1)) * (-A * sin(x1) - B * cos(x1) - F * B * cos(x1) * sin(x1) * x2 ^ 2 - C * x2 - D * x1) + (1 - E * cos(x1) ^ 2) * (-x1 - c1 * x2 - c1 * c2 * x1 - c2 * x2) + (c3) / (1 - E * cos(x1) ^ 2) + ADD;
    
    u_thetta = M1 / (B * cos(x1)) * (-A * sin(x1) - B * cos(x1) - F * B * cos(x1) * sin(x1) * x2 ^ 2 - C * x2 - D * x1) + (1 - E * cos(x1) ^ 2) * (-x1 - c1 * x2 - c1 * c2 * x1 - c2 * x2) + (c3) / (1 - E * cos(x1) ^ 2) + ADD;
    

    
    u = u_thetta; 

end
