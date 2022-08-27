close all;
clear all;
clc;

% g(p) = 100 + cos(pi*p/12)+ sin(pi*p/5)
%
% Tasks
% a) Design a two layer network
%   hidden layer 5:5:50
% b) Increase layers 1:5:50
% c) Evaluate Learning Rate

% Step up p
period = 2 * 25
min_p = -period * pi;
max_p = period * pi;
step_p = 0.001;

% Calculate Functions
p = min_p:step_p:max_p;
g_p = 100 + cos(2*pi*p/12) + sin(pi*p/5);

% Create training set
tr_size = 10000;
tr_set = randi(size(p,2),tr_size,1);

p_tr = p(tr_set);
g_tr = g_p(tr_set);

% learning_rate
learning_rate_min = 0.0001;
learning_rate_med = 0.001;
learning_rate_max = 0.01;

% activation function 
actication_function = 'elliotsig'; 


%-----------------------------
%      Network Creation
%-----------------------------

% Single Layer
l1_lr_min = feedforwardnet([]);
l1_lr_min = nn_settings(l1_lr_min);
l1_lr_min.trainParam.lr = learning_rate_min;
l1_lr_min = train(l1_lr_min,p_tr,g_tr);

l1_lr_med = feedforwardnet([]);
l1_lr_med = nn_settings(l1_lr_med);
l1_lr_med.trainParam.lr = learning_rate_med;
l1_lr_med = train(l1_lr_med,p_tr,g_tr);

l1_lr_max = feedforwardnet([]);
l1_lr_max = nn_settings(l1_lr_max);
l1_lr_max.trainParam.lr = learning_rate_max;
l1_lr_max = train(l1_lr_max,p_tr,g_tr);


% Two Layers Neural Networks with hidden layer neurons
%   increasing in steps of 5

% 5 Neurons
l2_n5_lr_min = feedforwardnet([5]);
l2_n5_lr_min = nn_settings(l2_n5_lr_min);
l2_n5_lr_min.trainParam.lr = learning_rate_min;
l2_n5_lr_min.layers{1}.transferFcn = actication_function;
l2_n5_lr_min = train(l2_n5_lr_min,p_tr,g_tr);

l2_n5_lr_med = feedforwardnet([5]);
l2_n5_lr_med = nn_settings(l2_n5_lr_med);
l2_n5_lr_med.trainParam.lr = learning_rate_med;
l2_n5_lr_med.layers{1}.transferFcn = actication_function;
l2_n5_lr_med = train(l2_n5_lr_med,p_tr,g_tr);

l2_n5_lr_max = feedforwardnet([5]);
l2_n5_lr_max = nn_settings(l2_n5_lr_max);
l2_n5_lr_max.trainParam.lr = learning_rate_max;
l2_n5_lr_max.layers{1}.transferFcn = actication_function;
l2_n5_lr_max = train(l2_n5_lr_max,p_tr,g_tr);

% 10 Neuron
l2_n10_lr_min = feedforwardnet([10]);
l2_n10_lr_min = nn_settings(l2_n10_lr_min);
l2_n10_lr_min.trainParam.lr = learning_rate_min;
l2_n10_lr_min.layers{1}.transferFcn = actication_function;
l2_n10_lr_min = train(l2_n10_lr_min,p_tr,g_tr);

l2_n10_lr_med = feedforwardnet([10]);
l2_n10_lr_med = nn_settings(l2_n10_lr_med);
l2_n10_lr_med.trainParam.lr = learning_rate_med;
l2_n10_lr_med.layers{1}.transferFcn = actication_function;
l2_n10_lr_med = train(l2_n10_lr_med,p_tr,g_tr);

l2_n10_lr_max = feedforwardnet([10]);
l2_n10_lr_max = nn_settings(l2_n10_lr_max);
l2_n10_lr_max.trainParam.lr = learning_rate_max;
l2_n10_lr_max.layers{1}.transferFcn = actication_function;
l2_n10_lr_max = train(l2_n10_lr_max,p_tr,g_tr);

% 15 Neurons
l2_n15_lr_min = feedforwardnet([15]);
l2_n15_lr_min = nn_settings(l2_n15_lr_min);
l2_n15_lr_min.trainParam.lr = learning_rate_min;
l2_n15_lr_min.layers{1}.transferFcn = actication_function;
l2_n15_lr_min = train(l2_n15_lr_min,p_tr,g_tr);

l2_n15_lr_med = feedforwardnet([15]);
l2_n15_lr_med = nn_settings(l2_n15_lr_med);
l2_n15_lr_med.trainParam.lr = learning_rate_med;
l2_n15_lr_med.layers{1}.transferFcn = actication_function;
l2_n15_lr_med = train(l2_n15_lr_med,p_tr,g_tr);

l2_n15_lr_max = feedforwardnet([15]);
l2_n15_lr_max = nn_settings(l2_n15_lr_max);
l2_n15_lr_max.trainParam.lr = learning_rate_max;
l2_n15_lr_max.layers{1}.transferFcn = actication_function;
l2_n15_lr_max = train(l2_n15_lr_max,p_tr,g_tr);

% 20 Neuron
l2_n20_lr_min = feedforwardnet([20]);
l2_n20_lr_min = nn_settings(l2_n20_lr_min);
l2_n20_lr_min.trainParam.lr = learning_rate_min;
l2_n20_lr_min.layers{1}.transferFcn = actication_function;
l2_n20_lr_min = train(l2_n20_lr_min,p_tr,g_tr);

l2_n20_lr_med = feedforwardnet([20]);
l2_n20_lr_med = nn_settings(l2_n20_lr_med);
l2_n20_lr_med.trainParam.lr = learning_rate_med;
l2_n20_lr_med.layers{1}.transferFcn = actication_function;
l2_n20_lr_med = train(l2_n20_lr_med,p_tr,g_tr);

l2_n20_lr_max = feedforwardnet([20]);
l2_n20_lr_max = nn_settings(l2_n20_lr_max);
l2_n20_lr_max.trainParam.lr = learning_rate_max;
l2_n20_lr_max.layers{1}.transferFcn = actication_function;
l2_n20_lr_max = train(l2_n20_lr_max,p_tr,g_tr);

% 25 Neurons
l2_n25_lr_min = feedforwardnet([25]);
l2_n25_lr_min = nn_settings(l2_n25_lr_min);
l2_n25_lr_min.trainParam.lr = learning_rate_min;
l2_n25_lr_min.layers{1}.transferFcn = actication_function;
l2_n25_lr_min = train(l2_n25_lr_min,p_tr,g_tr);

l2_n25_lr_med = feedforwardnet([25]);
l2_n25_lr_med = nn_settings(l2_n25_lr_med);
l2_n25_lr_med.trainParam.lr = learning_rate_med;
l2_n25_lr_med.layers{1}.transferFcn = actication_function;
l2_n25_lr_med = train(l2_n25_lr_med,p_tr,g_tr);

l2_n25_lr_max = feedforwardnet([25]);
l2_n25_lr_max = nn_settings(l2_n25_lr_max);
l2_n25_lr_max.trainParam.lr = learning_rate_max;
l2_n25_lr_max.layers{1}.transferFcn = actication_function;
l2_n25_lr_max = train(l2_n25_lr_max,p_tr,g_tr);

% 30 Neuron
l2_n30_lr_min = feedforwardnet([30]);
l2_n30_lr_min = nn_settings(l2_n30_lr_min);
l2_n30_lr_min.trainParam.lr = learning_rate_min;
l2_n30_lr_min.layers{1}.transferFcn = actication_function;
l2_n30_lr_min = train(l2_n30_lr_min,p_tr,g_tr);

l2_n30_lr_med = feedforwardnet([30]);
l2_n30_lr_med = nn_settings(l2_n30_lr_med);
l2_n30_lr_med.trainParam.lr = learning_rate_med;
l2_n30_lr_med.layers{1}.transferFcn = actication_function;
l2_n30_lr_med = train(l2_n30_lr_med,p_tr,g_tr);

l2_n30_lr_max = feedforwardnet([30]);
l2_n30_lr_max = nn_settings(l2_n30_lr_max);
l2_n30_lr_max.trainParam.lr = learning_rate_max;
l2_n30_lr_max.layers{1}.transferFcn = actication_function;
l2_n30_lr_max = train(l2_n30_lr_max,p_tr,g_tr);

% 35 Neurons
l2_n35_lr_min = feedforwardnet([35]);
l2_n35_lr_min = nn_settings(l2_n35_lr_min);
l2_n35_lr_min.trainParam.lr = learning_rate_min;
l2_n35_lr_min.layers{1}.transferFcn = actication_function;
l2_n35_lr_min = train(l2_n35_lr_min,p_tr,g_tr);

l2_n35_lr_med = feedforwardnet([35]);
l2_n35_lr_med = nn_settings(l2_n35_lr_med);
l2_n35_lr_med.trainParam.lr = learning_rate_med;
l2_n35_lr_med.layers{1}.transferFcn = actication_function;
l2_n35_lr_med = train(l2_n35_lr_med,p_tr,g_tr);

l2_n35_lr_max = feedforwardnet([35]);
l2_n35_lr_max = nn_settings(l2_n35_lr_max);
l2_n35_lr_max.trainParam.lr = learning_rate_max;
l2_n35_lr_max.layers{1}.transferFcn = actication_function;
l2_n35_lr_max = train(l2_n35_lr_max,p_tr,g_tr);

% 40 Neuron
l2_n40_lr_min = feedforwardnet([40]);
l2_n40_lr_min = nn_settings(l2_n40_lr_min);
l2_n40_lr_min.trainParam.lr = learning_rate_min;
l2_n40_lr_min.layers{1}.transferFcn = actication_function;
l2_n40_lr_min = train(l2_n40_lr_min,p_tr,g_tr);

l2_n40_lr_med = feedforwardnet([40]);
l2_n40_lr_med = nn_settings(l2_n40_lr_med);
l2_n40_lr_med.trainParam.lr = learning_rate_med;
l2_n40_lr_med.layers{1}.transferFcn = actication_function;
l2_n40_lr_med = train(l2_n40_lr_med,p_tr,g_tr);

l2_n40_lr_max = feedforwardnet([40]);
l2_n40_lr_max = nn_settings(l2_n40_lr_max);
l2_n40_lr_max.trainParam.lr = learning_rate_max;
l2_n40_lr_max.layers{1}.transferFcn = actication_function;
l2_n40_lr_max = train(l2_n40_lr_max,p_tr,g_tr);

% 45 Neurons
l2_n45_lr_min = feedforwardnet([45]);
l2_n45_lr_min = nn_settings(l2_n45_lr_min);
l2_n45_lr_min.trainParam.lr = learning_rate_min;
l2_n45_lr_min.layers{1}.transferFcn = actication_function;
l2_n45_lr_min = train(l2_n45_lr_min,p_tr,g_tr);

l2_n45_lr_med = feedforwardnet([45]);
l2_n45_lr_med = nn_settings(l2_n45_lr_med);
l2_n45_lr_med.trainParam.lr = learning_rate_med;
l2_n45_lr_med.layers{1}.transferFcn = actication_function;
l2_n45_lr_med = train(l2_n45_lr_med,p_tr,g_tr);

l2_n45_lr_max = feedforwardnet([45]);
l2_n45_lr_max = nn_settings(l2_n45_lr_max);
l2_n45_lr_max.trainParam.lr = learning_rate_max;
l2_n45_lr_max.layers{1}.transferFcn = actication_function;
l2_n45_lr_max = train(l2_n45_lr_max,p_tr,g_tr);

% 50 Neurons
l2_n50_lr_min = feedforwardnet([50]);
l2_n50_lr_min = nn_settings(l2_n50_lr_min);
l2_n50_lr_min.trainParam.lr = learning_rate_min;
l2_n50_lr_min.layers{1}.transferFcn = actication_function;
l2_n50_lr_min = train(l2_n50_lr_min,p_tr,g_tr);

l2_n50_lr_med = feedforwardnet([50]);
l2_n50_lr_med = nn_settings(l2_n50_lr_med);
l2_n50_lr_med.trainParam.lr = learning_rate_med;
l2_n50_lr_med.layers{1}.transferFcn = actication_function;
l2_n50_lr_med = train(l2_n50_lr_med,p_tr,g_tr);

l2_n50_lr_max = feedforwardnet([50]);
l2_n50_lr_max = nn_settings(l2_n50_lr_max);
l2_n50_lr_max.trainParam.lr = learning_rate_max;
l2_n50_lr_max.layers{1}.transferFcn = actication_function;
l2_n50_lr_max = train(l2_n50_lr_max,p_tr,g_tr);


% Multilayer Networks with constant neurons
% 3 layers - 2 hidden layers with 45 neurons each
l3_n45_lr_min = feedforwardnet([45, 45]);
l3_n45_lr_min = nn_settings(l3_n45_lr_min);
l3_n45_lr_min.trainParam.lr = learning_rate_min;
l3_n45_lr_min.layers{1:2}.transferFcn = actication_function;
l3_n45_lr_min = train(l3_n45_lr_min,p_tr,g_tr);

l3_n45_lr_med = feedforwardnet([45, 45]);
l3_n45_lr_med = nn_settings(l3_n45_lr_med);
l3_n45_lr_med.trainParam.lr = learning_rate_med;
l3_n45_lr_med.layers{1:2}.transferFcn = actication_function;
l3_n45_lr_med = train(l3_n45_lr_med,p_tr,g_tr);

l3_n45_lr_max = feedforwardnet([45, 45]);
l3_n45_lr_max = nn_settings(l3_n45_lr_max);
l3_n45_lr_max.trainParam.lr = learning_rate_max;
l3_n45_lr_max.layers{1:2}.transferFcn = actication_function;
l3_n45_lr_max = train(l3_n45_lr_max,p_tr,g_tr);

% 4 layers - 3 hidden layers with 45 neurons each
l4_n45_lr_min = feedforwardnet([45, 45, 45]);
l4_n45_lr_min = nn_settings(l4_n45_lr_min);
l4_n45_lr_min.trainParam.lr = learning_rate_min;
l4_n45_lr_min.layers{1:3}.transferFcn = actication_function;
l4_n45_lr_min = train(l4_n45_lr_min,p_tr,g_tr);

l4_n45_lr_med = feedforwardnet([45, 45, 45]);
l4_n45_lr_med = nn_settings(l4_n45_lr_med);
l4_n45_lr_med.trainParam.lr = learning_rate_med;
l4_n45_lr_med.layers{1:3}.transferFcn = actication_function;
l4_n45_lr_med = train(l4_n45_lr_med,p_tr,g_tr);

l4_n45_lr_max = feedforwardnet([45, 45, 45]);
l4_n45_lr_max = nn_settings(l4_n45_lr_max);
l4_n45_lr_max.trainParam.lr = learning_rate_max;
l4_n45_lr_max.layers{1:3}.transferFcn = actication_function;
l4_n45_lr_max = train(l4_n45_lr_max,p_tr,g_tr);

% 5 layers - 4 hidden layers with 45 neurons each
l5_n45_lr_min = feedforwardnet([45, 45, 45, 45]);
l5_n45_lr_min = nn_settings(l5_n45_lr_min);
l5_n45_lr_min.trainParam.lr = learning_rate_min;
l5_n45_lr_min.layers{1:4}.transferFcn = actication_function;
l5_n45_lr_min = train(l5_n45_lr_min,p_tr,g_tr);

l5_n45_lr_med = feedforwardnet([45, 45, 45, 45]);
l5_n45_lr_med = nn_settings(l5_n45_lr_med);
l5_n45_lr_med.trainParam.lr = learning_rate_med;
l5_n45_lr_med.layers{1:4}.transferFcn = actication_function;
l5_n45_lr_med = train(l5_n45_lr_med,p_tr,g_tr);

l5_n45_lr_max = feedforwardnet([45, 45, 45, 45]);
l5_n45_lr_max = nn_settings(l5_n45_lr_max);
l5_n45_lr_max.trainParam.lr = learning_rate_max;
l5_n45_lr_max.layers{1:4}.transferFcn = actication_function;
l5_n45_lr_max = train(l5_n45_lr_max,p_tr,g_tr);


%-----------------------------
%            Plots
%-----------------------------
figure(1)
plot(p,g_p),
hold on
plot(p_tr,g_tr,'*r'),
xlabel('p'), ylabel('g(p)'), 
grid on
title('Training Points'),
saveas(figure(1), 'Graph_1_Training_points.jpg');
close(figure(1))

figure(2)
subplot(4,1,1)
plot(p,g_p,'-k')
hold on
plot(p,l1_lr_med(p),'.r')
title('single Layer NN'),
grid on, xlim([min(p) max(p)])

subplot(4,1,2)
plot(p,g_p,'-k')
hold on
plot(p,l2_n5_lr_med(p),'.b')
hold on
title('2 Layers, 5 Neurons'),
grid on, xlim([min(p) max(p)])

subplot(4,1,3)
plot(p,g_p,'-k')
hold on
plot(p,l2_n10_lr_med(p),'.g')
hold on
title('2 Layers, 10 Neurons'),
grid on, xlim([min(p) max(p)])

subplot(4,1,4)
plot(p,g_p,'-k')
hold on
plot(p,l2_n15_lr_med(p),'.c')
title('2 Layers, 15 Neurons'),
grid on, xlim([min(p) max(p)])
saveas(figure(2), 'Graph_2_Neurons_Num_n5_to_n15.jpg');
close(figure(2))

figure(3)
subplot(4,1,1)
plot(p,g_p,'-k')
hold on
plot(p,l2_n20_lr_med(p),'.m')
title('2 Layers, 20 Neurons'),
grid on, xlim([min(p) max(p)])

subplot(4,1,2)
plot(p,g_p,'-k')
hold on
plot(p,l2_n25_lr_med(p),'.r')
title('2 Layers, 25 Neurons'),
grid on, xlim([min(p) max(p)])

subplot(4,1,3)
plot(p,g_p,'-k')
hold on
plot(p,l2_n30_lr_med(p),'.b')
title('2 Layers, 30 Neurons'),
grid on, xlim([min(p) max(p)])

subplot(4,1,4)
plot(p,g_p,'-k')
hold on
plot(p,l2_n35_lr_med(p),'.g')
title('2 Layers, 35 Neurons'),
grid on, xlim([min(p) max(p)])
saveas(figure(3), 'Graph_3_Neurons_Num_n20_to_n35.jpg');
close(figure(3))

figure(4)
subplot(4,1,1)
plot(p,g_p,'-k')
hold on
plot(p,l2_n40_lr_med(p),'.c')
title('2 Layers, 40 Neurons'),
grid on, xlim([min(p) max(p)])

subplot(4,1,2)
plot(p,g_p,'-k')
hold on
plot(p,l2_n45_lr_med(p),'.m')
title('2 Layers, 45 Neurons'),
grid on, xlim([min(p) max(p)])

subplot(4,1,3)
plot(p,g_p,'-k')
hold on
plot(p,l2_n50_lr_med(p),'.g')
title('2 Layers, 50 Neurons'),
grid on, xlim([min(p) max(p)])
saveas(figure(4), 'Graph_4_Neurons_Num_n35_to_n50.jpg');
close(figure(4))


figure(5)
subplot(4,1,1)
plot(p,g_p-l1_lr_med(p),'.r')
title('1 Layers Error'),
grid on, xlim([min(p) max(p)])

subplot(4,1,2)
plot(p,g_p-l2_n5_lr_med(p),'.b')
title('2 Layers 5 Neurons Error'),
grid on, xlim([min(p) max(p)])

subplot(4,1,3)
plot(p,g_p-l2_n10_lr_med(p),'.g')
title('2 Layers 10 Neurons Error'),
grid on, xlim([min(p) max(p)])

subplot(4,1,4)
plot(p,g_p-l2_n15_lr_med(p),'.c')
title('2 Layers 15 Neurons Error'),
grid on, xlim([min(p) max(p)])
saveas(figure(5), 'Graph_5_Neurons_Num_Error_n5_to_n15.jpg');
close(figure(5))

figure(6)
subplot(4,1,1)
plot(p,g_p-l2_n20_lr_med(p),'.m')
title('2 Layers 15 Neurons Error'),
grid on, xlim([min(p) max(p)])

subplot(4,1,2)
plot(p,g_p-l2_n25_lr_med(p),'.r')
title('2 Layers 25 Neurons Error'),
grid on, xlim([min(p) max(p)])

subplot(4,1,3)
plot(p,g_p-l2_n30_lr_med(p),'.b')
title('2 Layers 30 Neurons Error'),
grid on, xlim([min(p) max(p)])

subplot(4,1,4)
plot(p,g_p-l2_n35_lr_med(p),'.g')
title('2 Layers 30 Neurons Error'),
grid on, xlim([min(p) max(p)])
saveas(figure(6), 'Graph_6_Neurons_Num_Error_n20_to_n35.jpg');
close(figure(6))

figure(7)
subplot(4,1,1)
plot(p,g_p-l2_n40_lr_med(p),'.c')
title('2 Layers 40 Neurons Error'),
grid on, xlim([min(p) max(p)])

subplot(4,1,2)
plot(p,g_p-l2_n45_lr_med(p),'.m')
title('2 Layers 45 Neurons Error'),
grid on, xlim([min(p) max(p)])

subplot(4,1,3)
plot(p,g_p-l2_n50_lr_med(p),'.g')
title('2 Layers 50 Neurons Error'),
grid on, xlim([min(p) max(p)])
saveas(figure(7), 'Graph_7_Neurons_Num_Error_n40_to_n50.jpg');
close(figure(7))

figure(8)
subplot(5,1,1)
plot(p,g_p,'-k')
hold on
plot(p,l1_lr_med(p),'.r')
grid on, xlim([min(p) max(p)])
title('1 Layers Network'),

subplot(5,1,2)
plot(p,g_p,'-k')
hold on
plot(p,l2_n45_lr_med(p),'.b')
grid on, xlim([min(p) max(p)])
title('2 Layers - 45 Neurons'),

subplot(5,1,3)
plot(p,g_p,'-k')
hold on
plot(p,l3_n45_lr_med(p),'.g')
grid on, xlim([min(p) max(p)])
title('3 Layers - 45 Neurons'),

subplot(5,1,4)
plot(p,g_p,'-k')
hold on
plot(p,l4_n45_lr_med(p),'.c')
grid on, xlim([min(p) max(p)])
title('4 Layers - 45 Neurons'),

subplot(5,1,5)
plot(p,g_p,'-k')
hold on
plot(p,l5_n45_lr_med(p),'.g')
title('5 Layers - 45 Neurons'),
grid on, xlim([min(p) max(p)])
saveas(figure(8), 'Graph_8_Multilayer_n45.jpg');
close(figure(8))

figure(9)
subplot(5,1,1)
plot(p,g_p-l1_lr_med(p),'.r')
grid on, xlim([min(p) max(p)])
title('1 Layers Error'),

subplot(5,1,2)
plot(p,g_p-l2_n45_lr_med(p),'.b')
grid on, xlim([min(p) max(p)])
title('2 Layers (45 Neurons) Error'),

subplot(5,1,3)
plot(p,g_p-l3_n45_lr_med(p),'.g')
grid on, xlim([min(p) max(p)])
title('3 Layers (45 Neurons) Error'),

subplot(5,1,4)
plot(p,g_p-l4_n45_lr_med(p),'.c')
grid on, xlim([min(p) max(p)])
title('4 Layers (45 Neurons) Error'),

subplot(5,1,5)
plot(p,g_p-l5_n45_lr_med(p),'.g')
grid on, xlim([min(p) max(p)])
title('5 Layers (45 Neurons) Error'),
saveas(figure(9), 'Graph_9_Multilayer_Error_n45.jpg');
close(figure(9))

figure(10)
subplot(3,1,1)
plot(p,g_p,'-k')
hold on
plot(p,l2_n10_lr_min(p),'.r')
title(['2 Layers, 10 Neurons, Learning Rate ',num2str(learning_rate_min)]),
grid on, xlim([min(p) max(p)]), ylim([95, 105])

subplot(3,1,2)
plot(p,g_p,'-k')
hold on
plot(p,l2_n10_lr_med(p),'.b')
title(['2 Layers, 10 Neurons, Learning Rate ',num2str(learning_rate_med)]),
grid on, xlim([min(p) max(p)]), ylim([95, 105])

subplot(3,1,3)
plot(p,g_p,'-k')
hold on
plot(p,l2_n10_lr_max(p),'.g')
title(['2 Layers, 10 Neurons, Learning Rate ',num2str(learning_rate_max)]),
grid on, xlim([min(p) max(p)]), ylim([95, 105])
saveas(figure(10), 'Graph_10_Multilayer_Error_n10.jpg');
close(figure(10))

figure(11)
subplot(3,1,1)
plot(p,g_p,'-k')
hold on
plot(p,l5_n45_lr_min(p),'.c')
title(['5 Layers, 45 Neurons, Learning Rate ',num2str(learning_rate_min)]),
grid on, xlim([min(p) max(p)]), ylim([95, 105])

subplot(3,1,2)
plot(p,g_p,'-k')
hold on
plot(p,l5_n45_lr_med(p),'.g')
title(['5 Layers, 45 Neurons, Learning Rate ',num2str(learning_rate_med)]),
grid on, xlim([min(p) max(p)]), ylim([95, 105])

subplot(3,1,3)
plot(p,g_p,'-k')
hold on
plot(p,l5_n45_lr_max(p),'.m')
title(['5 Layers, 45 Neurons, Learning Rate ',num2str(learning_rate_max)]),
grid on, xlim([min(p) max(p)]), ylim([95, 105])
saveas(figure(11), 'Graph_11_Multilayer_Error_n45.jpg');
close(figure(11))
