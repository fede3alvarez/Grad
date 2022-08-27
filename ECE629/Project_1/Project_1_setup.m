close all;
clear all;
clc;

% g(p) = 100 + cos(pi*p/12)

% Step up p
pn = 10
min_p = -12*pn;
max_p = 12*pn;
step_p = 0.05;

% Calculate Functions
p = min_p:step_p:max_p;
g_p = 100 + cos(pi*p/12);

% Create training set
% Aiming for 5 epochs of 100 points
epoch_num = 5;
epoch_size = 1000;
tr_set = randi(size(p,2),1000,1);

p_tr = p(tr_set)
g_tr = g_p(tr_set)

% Graph results
figure(1)
plot(p,g_p),
hold on
plot(p_tr,g_tr,'*'),
xlabel('p'), ylabel('g(p)'), 
grid on