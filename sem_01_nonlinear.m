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
sys.alpha = 0.1;


% Задание начальных условий
x0 = [pi / 3; 0; 0; 0]; % [x1(0); x2(0); x3(0); x4(0)]

% Время моделирования
sys.dt = 0.01; % шаг интегрирования

% Моделирование системы без управления
[X, t, u] = runge_kutta_4(@sem_01_func, [0 30], x0, sys.dt);
% 


%% Построение графиков
%управление
figure(5)
plot(t, u,  'LineWidth', 2);
title('Управление движением обратного маятника на подвижном основании с ограничением на движение каретки, при НУ: x=[pi/3;0;0;0]','FontSize',18,'FontName','Times New Roman','FontWeight','normal')
ylabel('м/с','FontSize',18,'FontName','Times New Roman','FontWeight','normal')
xlabel('t,с','FontSize',18,'FontName','Times New Roman','FontWeight','normal')
xlim([0,10])
% legend("Управление, м/с")
grid on

%система
figure
sgtitle('Стабилизация обратного маятника на подвижном основании с ограничением на движение каретки, при НУ: x=[pi/3;0;0;0]','FontSize',18,'FontName','Times New Roman','FontWeight','normal')
subplot(2, 1, 1);
yyaxis left;
plot(t, rad2deg(X(:, 1)), 'LineWidth', 2);
ylabel('Отклонение маятника, рад','FontSize',18,'FontName','Times New Roman','FontWeight','normal')
hold on;
yyaxis right;
ylabel('Угловая скорость маятника, рад/с','FontSize',18,'FontName','Times New Roman','FontWeight','normal')
xlim([0,10])
xlabel('t,с','FontSize',18,'FontName','Times New Roman','FontWeight','normal')
plot(t, rad2deg(X(:, 2)), 'r', 'LineWidth', 2);
hold off;
% legend('Отклонение маятника, рад', 'Угловая скорость маятника, рад/с','FontSize',12,'FontName','Times New Roman','FontWeight','normal')
grid on

subplot(2, 1, 2);
yyaxis left;
plot(t, X(:, 3), 'LineWidth', 2);
ylabel('Координата тележки, м','FontSize',18,'FontName','Times New Roman','FontWeight','normal')
yyaxis right;
xlabel('t,с','FontSize',18,'FontName','Times New Roman','FontWeight','normal')
xlim([0,10])
hold on;
plot(t, X(:, 4), 'r', 'LineWidth', 2);
ylabel('Скорость тележки, м/с','FontSize',18,'FontName','Times New Roman','FontWeight','normal')
hold off;
% legend('Координата тележки, м', 'Скорость тележки, м/с','FontSize',12,'FontName','Times New Roman','FontWeight','normal')
grid on


% figure(1)
% subplot(1, 1, 1)
% plot(t, x(:, 1), 'LineWidth', 2);
% legend("Отклонение маятника, рад");
% xlabel("t, с")
% ylabel("рад")
% grid on
% 
% hold on
% 
% plot(t, x(:, 2), 'LineWidth', 2);
% legend("Угловая скорость маятника, рад/с")
% xlabel("t, с")
% ylabel("рад/с")
% grid on
% 
% subplot(2, 1, 1)
% plot(t, x(:, 3), 'LineWidth', 2);
% legend("Координата тележки, м")
% xlabel("t, с")
% ylabel("м")
% grid on
% 
% hold on
% 
% plot(t, x(:, 4), 'LineWidth', 2);
% legend("Скорость тележки, м/с")
% xlabel("t, с")
% ylabel("м/с")
% grid on
% 
