global sys

sys.k2 = 0;
sys.b2 = 0.01;
sys.m1 = 0.5;
sys.m2 = 0.15;
sys.m3 = 0.05;
sys.M1 = sys.m1+sys.m2+sys.m3;
sys.M2 = sys.m2+sys.m3*0.5;
sys.M3 = sys.m2+sys.m3/3;
sys.l = 0.15;
sys.g = 9.81;
sys.l1_max  = 0.3;
sys.alpha = pi/6;


% Задание начальных условий
x0 = [pi / 10; 0; 0; 0];
% Время моделирования
dt = 0.01; % шаг интегрирования

% Время окончания моделирования
x_lim = 10;

% Моделирование системы без управления
[X, t, u] = runge_kutta_4(@Model, [0 x_lim], x0, dt);

%% Построение графиков
% управление
figure(5)
plot(t, u,  'LineWidth', 2);
title('Управление движением обратного маятника на подвижном основании без ограничения на движение каретки, при НУ: x=[pi / 10; 0; 0; 0]','FontSize',18,'FontName','Times New Roman','FontWeight','normal')
ylabel('м/с','FontSize',18,'FontName','Times New Roman','FontWeight','normal')
xlabel('t,с','FontSize',18,'FontName','Times New Roman','FontWeight','normal')
xlim([0,x_lim])
grid on

% система
figure
sgtitle('Стабилизация обратного маятника на подвижном основании без ограничения на движение каретки, при НУ: x=[pi / 10; 0; 0; 0]','FontSize',18,'FontName','Times New Roman','FontWeight','normal')

subplot(2, 1, 1);
yyaxis left;
plot(t, rad2deg(X(:, 1)), 'LineWidth', 2);
ylabel('Отклонение маятника, рад','FontSize',18,'FontName','Times New Roman','FontWeight','normal')
hold on;
yyaxis right;
ylabel('Угловая скорость маятника, рад/с','FontSize',18,'FontName','Times New Roman','FontWeight','normal')
xlim([0,x_lim])
xlabel('t,с','FontSize',18,'FontName','Times New Roman','FontWeight','normal')
plot(t, rad2deg(X(:, 2)), 'r', 'LineWidth', 2);
hold off;
grid on

subplot(2, 1, 2);
yyaxis left;
plot(t, X(:, 3), 'LineWidth', 2);
ylabel('Координата тележки, м','FontSize',18,'FontName','Times New Roman','FontWeight','normal')
yyaxis right;
xlabel('t,с','FontSize',18,'FontName','Times New Roman','FontWeight','normal')
xlim([0,x_lim])
hold on;
plot(t, X(:, 4), 'r', 'LineWidth', 2);
ylabel('Скорость тележки, м/с','FontSize',18,'FontName','Times New Roman','FontWeight','normal')
hold off;
grid on
