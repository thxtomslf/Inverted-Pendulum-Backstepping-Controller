function [y, t, u] = runge_kutta_4(f, tspan, y0, h)
    global sys

    u(1) = 0;
    t0 = tspan(1);
    tf = tspan(2);
    t = t0:h:tf; % Вектор времени

    % Количество шагов интегрирования
    N = length(t);
    
    % Инициализация массива решения
    y = zeros(N, length(y0));
    y(1,:) = y0;
    
    % Интегрирование методом Рунге-Кутты 4-го порядка
    for i = 1:N-1

        F_u = backstepping_controller(y(i, 1), y(i, 2), y(i, 3), y(i, 4));
        
        u(i + 1) = F_u;

        k1 = h * feval(f, t(i), y(i,:), F_u);
        k2 = h * feval(f, t(i) + h/2, y(i,:) + k1'/2, F_u);
        k3 = h * feval(f, t(i) + h/2, y(i,:) + k2'/2, F_u);
        k4 = h * feval(f, t(i) + h, y(i,:) + k3', F_u);
        
        y(i+1,:) = y(i,:) + (k1' + 2*k2' + 2*k3' + k4') / 6;


        if y(i+1,3) >= sys.l1_max || y(i+1,3) <= -sys.l1_max
            y(i+1,4) = 0;
        end
    end
end
