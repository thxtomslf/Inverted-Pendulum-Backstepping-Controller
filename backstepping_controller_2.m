function u  = backstepping_controller_2(x3, x4, x1, x2)

    % c1 = 5;
    % 
    % c2 = 3;
    % 
    % c3 = 0.675;
    
    % k3 = 1.5;
    % 
    % k4 = 1.9;

    c1 = 20;
    
    c2 = 9;

    c3 = 0.675;

    k3 = 1;

    k4 = 1;
    
    
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
    aplha = 0.1;
    
    A = M2 * l * (tan(aplha) * sin(x1) - cos(x1));
    B = M2 * g / (M3 * l);
    C = -k2 / (M3 * l ^ 2);
    D = -b2 / (M3 * l ^ 2);
    E = -(M2 * (tan(aplha) * cos(x1) + sin(x1)) * cos(aplha) ^ 2) / M1;
    F = - g * sin(aplha) * cos(aplha) ^ 3;
    G = cos(aplha) ^ 3 / M1;

    
    ADD = (k3 * x3 + k4 * x4);
    ADD = 0;

    u_thetta = (1 - A ^ 2) * (-x1 - c1 * x2 - c1 * c2 * x1 - c2 * x2) + ADD;
    
    u = u_thetta; 

end
