% close all;
% clear all;
% clc;

% g(p) = 100 + cos(pi*p/12)

% Step up p
min_p = -3 * pi;
max_p = 3 * pi;
step_p = 0.001;

% Calculate Functions
p = min_p:step_p:max_p;
T = 10; 
g_p = 100 + cos(2*pi*p/T);

% Create training set
tr_size = 1000;
tr_set = randi(size(p,2),tr_size,1);

p_tr = p(tr_set);
g_tr = g_p(tr_set);

% learning_rate
learning_rate_min = 0.0001;
learning_rate_med = 0.01;
learning_rate_max = 1;

% activation function 
actication_function = 'tansig';
%-----------------------------
%      Network Creation
%-----------------------------

% Single Layer
l1_lr_T10_min = feedforwardnet([]);
l1_lr_T10_min = nn_settings(l1_lr_T10_min);
l1_lr_T10_min.trainParam.lr = learning_rate_min;
l1_lr_T10_min = train(l1_lr_T10_min,p_tr,g_tr);

l1_lr_T10_med = feedforwardnet([]);
l1_lr_T10_med = nn_settings(l1_lr_T10_med);
l1_lr_T10_med.trainParam.lr = learning_rate_med;
l1_lr_T10_med = train(l1_lr_T10_med,p_tr,g_tr);

l1_lr_T10_max = feedforwardnet([]);
l1_lr_T10_max = nn_settings(l1_lr_T10_max);
l1_lr_T10_max.trainParam.lr = learning_rate_max;
l1_lr_T10_max = train(l1_lr_T10_max,p_tr,g_tr);


% Two Layers Neural Networks with hidden layer neurons
%   increasing in steps of 5

% 5 Neurons
l2_n5_lr_T10_min = feedforwardnet([5]);
l2_n5_lr_T10_min = nn_settings(l2_n5_lr_T10_min);
l2_n5_lr_T10_min.trainParam.lr = learning_rate_min;
l2_n5_lr_T10_min.layers{1}.transferFcn = actication_function;
l2_n5_lr_T10_min = train(l2_n5_lr_T10_min,p_tr,g_tr);

l2_n5_lr_T10_med = feedforwardnet([5]);
l2_n5_lr_T10_med = nn_settings(l2_n5_lr_T10_med);
l2_n5_lr_T10_med.trainParam.lr = learning_rate_med;
l2_n5_lr_T10_med.layers{1}.transferFcn = actication_function;
l2_n5_lr_T10_med = train(l2_n5_lr_T10_med,p_tr,g_tr);

l2_n5_lr_T10_max = feedforwardnet([5]);
l2_n5_lr_T10_max = nn_settings(l2_n5_lr_T10_max);
l2_n5_lr_T10_max.trainParam.lr = learning_rate_max;
l2_n5_lr_T10_max.layers{1}.transferFcn = actication_function;
l2_n5_lr_T10_max = train(l2_n5_lr_T10_max,p_tr,g_tr);

% 10 Neuron
l2_n10_lr_T10_min = feedforwardnet([10]);
l2_n10_lr_T10_min = nn_settings(l2_n10_lr_T10_min);
l2_n10_lr_T10_min.trainParam.lr = learning_rate_min;
l2_n10_lr_T10_min.layers{1}.transferFcn = actication_function;
l2_n10_lr_T10_min = train(l2_n10_lr_T10_min,p_tr,g_tr);

l2_n10_lr_T10_med = feedforwardnet([10]);
l2_n10_lr_T10_med = nn_settings(l2_n10_lr_T10_med);
l2_n10_lr_T10_med.trainParam.lr = learning_rate_med;
l2_n10_lr_T10_med.layers{1}.transferFcn = actication_function;
l2_n10_lr_T10_med = train(l2_n10_lr_T10_med,p_tr,g_tr);

l2_n10_lr_T10_max = feedforwardnet([10]);
l2_n10_lr_T10_max = nn_settings(l2_n10_lr_T10_max);
l2_n10_lr_T10_max.trainParam.lr = learning_rate_max;
l2_n10_lr_T10_max.layers{1}.transferFcn = actication_function;
l2_n10_lr_T10_max = train(l2_n10_lr_T10_max,p_tr,g_tr);

% 15 Neurons
l2_n15_lr_T10_min = feedforwardnet([15]);
l2_n15_lr_T10_min = nn_settings(l2_n15_lr_T10_min);
l2_n15_lr_T10_min.trainParam.lr = learning_rate_min;
l2_n15_lr_T10_min.layers{1}.transferFcn = actication_function;
l2_n15_lr_T10_min = train(l2_n15_lr_T10_min,p_tr,g_tr);

l2_n15_lr_T10_med = feedforwardnet([15]);
l2_n15_lr_T10_med = nn_settings(l2_n15_lr_T10_med);
l2_n15_lr_T10_med.trainParam.lr = learning_rate_med;
l2_n15_lr_T10_med.layers{1}.transferFcn = actication_function;
l2_n15_lr_T10_med = train(l2_n15_lr_T10_med,p_tr,g_tr);

l2_n15_lr_T10_max = feedforwardnet([15]);
l2_n15_lr_T10_max = nn_settings(l2_n15_lr_T10_max);
l2_n15_lr_T10_max.trainParam.lr = learning_rate_max;
l2_n15_lr_T10_max.layers{1}.transferFcn = actication_function;
l2_n15_lr_T10_max = train(l2_n15_lr_T10_max,p_tr,g_tr);

% 20 Neuron
l2_n20_lr_T10_min = feedforwardnet([20]);
l2_n20_lr_T10_min = nn_settings(l2_n20_lr_T10_min);
l2_n20_lr_T10_min.trainParam.lr = learning_rate_min;
l2_n20_lr_T10_min.layers{1}.transferFcn = actication_function;
l2_n20_lr_T10_min = train(l2_n20_lr_T10_min,p_tr,g_tr);

l2_n20_lr_T10_med = feedforwardnet([20]);
l2_n20_lr_T10_med = nn_settings(l2_n20_lr_T10_med);
l2_n20_lr_T10_med.trainParam.lr = learning_rate_med;
l2_n20_lr_T10_med.layers{1}.transferFcn = actication_function;
l2_n20_lr_T10_med = train(l2_n20_lr_T10_med,p_tr,g_tr);

l2_n20_lr_T10_max = feedforwardnet([20]);
l2_n20_lr_T10_max = nn_settings(l2_n20_lr_T10_max);
l2_n20_lr_T10_max.trainParam.lr = learning_rate_max;
l2_n20_lr_T10_max.layers{1}.transferFcn = actication_function;
l2_n20_lr_T10_max = train(l2_n20_lr_T10_max,p_tr,g_tr);

% 25 Neurons
l2_n25_lr_T10_min = feedforwardnet([25]);
l2_n25_lr_T10_min = nn_settings(l2_n25_lr_T10_min);
l2_n25_lr_T10_min.trainParam.lr = learning_rate_min;
l2_n25_lr_T10_min.layers{1}.transferFcn = actication_function;
l2_n25_lr_T10_min = train(l2_n25_lr_T10_min,p_tr,g_tr);

l2_n25_lr_T10_med = feedforwardnet([25]);
l2_n25_lr_T10_med = nn_settings(l2_n25_lr_T10_med);
l2_n25_lr_T10_med.trainParam.lr = learning_rate_med;
l2_n25_lr_T10_med.layers{1}.transferFcn = actication_function;
l2_n25_lr_T10_med = train(l2_n25_lr_T10_med,p_tr,g_tr);

l2_n25_lr_T10_max = feedforwardnet([25]);
l2_n25_lr_T10_max = nn_settings(l2_n25_lr_T10_max);
l2_n25_lr_T10_max.trainParam.lr = learning_rate_max;
l2_n25_lr_T10_max.layers{1}.transferFcn = actication_function;
l2_n25_lr_T10_max = train(l2_n25_lr_T10_max,p_tr,g_tr);

% 30 Neuron
l2_n30_lr_T10_min = feedforwardnet([30]);
l2_n30_lr_T10_min = nn_settings(l2_n30_lr_T10_min);
l2_n30_lr_T10_min.trainParam.lr = learning_rate_min;
l2_n30_lr_T10_min.layers{1}.transferFcn = actication_function;
l2_n30_lr_T10_min = train(l2_n30_lr_T10_min,p_tr,g_tr);

l2_n30_lr_T10_med = feedforwardnet([30]);
l2_n30_lr_T10_med = nn_settings(l2_n30_lr_T10_med);
l2_n30_lr_T10_med.trainParam.lr = learning_rate_med;
l2_n30_lr_T10_med.layers{1}.transferFcn = actication_function;
l2_n30_lr_T10_med = train(l2_n30_lr_T10_med,p_tr,g_tr);

l2_n30_lr_T10_max = feedforwardnet([30]);
l2_n30_lr_T10_max = nn_settings(l2_n30_lr_T10_max);
l2_n30_lr_T10_max.trainParam.lr = learning_rate_max;
l2_n30_lr_T10_max.layers{1}.transferFcn = actication_function;
l2_n30_lr_T10_max = train(l2_n30_lr_T10_max,p_tr,g_tr);

% 35 Neurons
l2_n35_lr_T10_min = feedforwardnet([35]);
l2_n35_lr_T10_min = nn_settings(l2_n35_lr_T10_min);
l2_n35_lr_T10_min.trainParam.lr = learning_rate_min;
l2_n35_lr_T10_min.layers{1}.transferFcn = actication_function;
l2_n35_lr_T10_min = train(l2_n35_lr_T10_min,p_tr,g_tr);

l2_n35_lr_T10_med = feedforwardnet([35]);
l2_n35_lr_T10_med = nn_settings(l2_n35_lr_T10_med);
l2_n35_lr_T10_med.trainParam.lr = learning_rate_med;
l2_n35_lr_T10_med.layers{1}.transferFcn = actication_function;
l2_n35_lr_T10_med = train(l2_n35_lr_T10_med,p_tr,g_tr);

l2_n35_lr_T10_max = feedforwardnet([35]);
l2_n35_lr_T10_max = nn_settings(l2_n35_lr_T10_max);
l2_n35_lr_T10_max.trainParam.lr = learning_rate_max;
l2_n35_lr_T10_max.layers{1}.transferFcn = actication_function;
l2_n35_lr_T10_max = train(l2_n35_lr_T10_max,p_tr,g_tr);

% 40 Neuron
l2_n40_lr_T10_min = feedforwardnet([40]);
l2_n40_lr_T10_min = nn_settings(l2_n40_lr_T10_min);
l2_n40_lr_T10_min.trainParam.lr = learning_rate_min;
l2_n40_lr_T10_min.layers{1}.transferFcn = actication_function;
l2_n40_lr_T10_min = train(l2_n40_lr_T10_min,p_tr,g_tr);

l2_n40_lr_T10_med = feedforwardnet([40]);
l2_n40_lr_T10_med = nn_settings(l2_n40_lr_T10_med);
l2_n40_lr_T10_med.trainParam.lr = learning_rate_med;
l2_n40_lr_T10_med.layers{1}.transferFcn = actication_function;
l2_n40_lr_T10_med = train(l2_n40_lr_T10_med,p_tr,g_tr);

l2_n40_lr_T10_max = feedforwardnet([40]);
l2_n40_lr_T10_max = nn_settings(l2_n40_lr_T10_max);
l2_n40_lr_T10_max.trainParam.lr = learning_rate_max;
l2_n40_lr_T10_max.layers{1}.transferFcn = actication_function;
l2_n40_lr_T10_max = train(l2_n40_lr_T10_max,p_tr,g_tr);

% 45 Neurons
l2_n45_lr_T10_min = feedforwardnet([45]);
l2_n45_lr_T10_min = nn_settings(l2_n45_lr_T10_min);
l2_n45_lr_T10_min.trainParam.lr = learning_rate_min;
l2_n45_lr_T10_min.layers{1}.transferFcn = actication_function;
l2_n45_lr_T10_min = train(l2_n45_lr_T10_min,p_tr,g_tr);

l2_n45_lr_T10_med = feedforwardnet([45]);
l2_n45_lr_T10_med = nn_settings(l2_n45_lr_T10_med);
l2_n45_lr_T10_med.trainParam.lr = learning_rate_med;
l2_n45_lr_T10_med.layers{1}.transferFcn = actication_function;
l2_n45_lr_T10_med = train(l2_n45_lr_T10_med,p_tr,g_tr);

l2_n45_lr_T10_max = feedforwardnet([45]);
l2_n45_lr_T10_max = nn_settings(l2_n45_lr_T10_max);
l2_n45_lr_T10_max.trainParam.lr = learning_rate_max;
l2_n45_lr_T10_max.layers{1}.transferFcn = actication_function;
l2_n45_lr_T10_max = train(l2_n45_lr_T10_max,p_tr,g_tr);

% 50 Neurons
l2_n50_lr_T10_min = feedforwardnet([50]);
l2_n50_lr_T10_min = nn_settings(l2_n50_lr_T10_min);
l2_n50_lr_T10_min.trainParam.lr = learning_rate_min;
l2_n50_lr_T10_min.layers{1}.transferFcn = actication_function;
l2_n50_lr_T10_min = train(l2_n50_lr_T10_min,p_tr,g_tr);

l2_n50_lr_T10_med = feedforwardnet([50]);
l2_n50_lr_T10_med = nn_settings(l2_n50_lr_T10_med);
l2_n50_lr_T10_med.trainParam.lr = learning_rate_med;
l2_n50_lr_T10_med.layers{1}.transferFcn = actication_function;
l2_n50_lr_T10_med = train(l2_n50_lr_T10_med,p_tr,g_tr);

l2_n50_lr_T10_max = feedforwardnet([50]);
l2_n50_lr_T10_max = nn_settings(l2_n50_lr_T10_max);
l2_n50_lr_T10_max.trainParam.lr = learning_rate_max;
l2_n50_lr_T10_max.layers{1}.transferFcn = actication_function;
l2_n50_lr_T10_max = train(l2_n50_lr_T10_max,p_tr,g_tr);

% l2_n50 = feedforwardnet([50]);
% l2_n50 = nn_settings(l2_n50);
% l2_n50.trainParam.lr = learning_rate_med;
% l2_n50.layers{1}.transferFcn = actication_function;
% l2_n50 = train(l2_n50,p_tr,g_tr);

% Multilayer Networks with constant neurons
% 3 layers - 2 hidden layers with 45 neurons each
l3_n45_lr_T10_min = feedforwardnet([45, 45]);
l3_n45_lr_T10_min = nn_settings(l3_n45_lr_T10_min);
l3_n45_lr_T10_min.trainParam.lr = learning_rate_min;
l3_n45_lr_T10_min.layers{1:2}.transferFcn = actication_function;
l3_n45_lr_T10_min = train(l3_n45_lr_T10_min,p_tr,g_tr);

l3_n45_lr_T10_med = feedforwardnet([45, 45]);
l3_n45_lr_T10_med = nn_settings(l3_n45_lr_T10_med);
l3_n45_lr_T10_med.trainParam.lr = learning_rate_med;
l3_n45_lr_T10_med.layers{1:2}.transferFcn = actication_function;
l3_n45_lr_T10_med = train(l3_n45_lr_T10_med,p_tr,g_tr);

l3_n45_lr_T10_max = feedforwardnet([45, 45]);
l3_n45_lr_T10_max = nn_settings(l3_n45_lr_T10_max);
l3_n45_lr_T10_max.trainParam.lr = learning_rate_max;
l3_n45_lr_T10_max.layers{1:2}.transferFcn = actication_function;
l3_n45_lr_T10_max = train(l3_n45_lr_T10_max,p_tr,g_tr);

% 4 layers - 3 hidden layers with 45 neurons each
l4_n45_lr_T10_min = feedforwardnet([45, 45, 45]);
l4_n45_lr_T10_min = nn_settings(l4_n45_lr_T10_min);
l4_n45_lr_T10_min.trainParam.lr = learning_rate_min;
l4_n45_lr_T10_min.layers{1:3}.transferFcn = actication_function;
l4_n45_lr_T10_min = train(l4_n45_lr_T10_min,p_tr,g_tr);

l4_n45_lr_T10_med = feedforwardnet([45, 45, 45]);
l4_n45_lr_T10_med = nn_settings(l4_n45_lr_T10_med);
l4_n45_lr_T10_med.trainParam.lr = learning_rate_med;
l4_n45_lr_T10_med.layers{1:3}.transferFcn = actication_function;
l4_n45_lr_T10_med = train(l4_n45_lr_T10_med,p_tr,g_tr);

l4_n45_lr_T10_max = feedforwardnet([45, 45, 45]);
l4_n45_lr_T10_max = nn_settings(l4_n45_lr_T10_max);
l4_n45_lr_T10_max.trainParam.lr = learning_rate_max;
l4_n45_lr_T10_max.layers{1:3}.transferFcn = actication_function;
l4_n45_lr_T10_max = train(l4_n45_lr_T10_max,p_tr,g_tr);

% 5 layers - 4 hidden layers with 45 neurons each
l5_n45_lr_T10_min = feedforwardnet([45, 45, 45, 45]);
l5_n45_lr_T10_min = nn_settings(l5_n45_lr_T10_min);
l5_n45_lr_T10_min.trainParam.lr = learning_rate_min;
l5_n45_lr_T10_min.layers{1:4}.transferFcn = actication_function;
l5_n45_lr_T10_min = train(l5_n45_lr_T10_min,p_tr,g_tr);

l5_n45_lr_T10_med = feedforwardnet([45, 45, 45, 45]);
l5_n45_lr_T10_med = nn_settings(l5_n45_lr_T10_med);
l5_n45_lr_T10_med.trainParam.lr = learning_rate_med;
l5_n45_lr_T10_med.layers{1:4}.transferFcn = actication_function;
l5_n45_lr_T10_med = train(l5_n45_lr_T10_med,p_tr,g_tr);

l5_n45_lr_T10_max = feedforwardnet([45, 45, 45, 45]);
l5_n45_lr_T10_max = nn_settings(l5_n45_lr_T10_max);
l5_n45_lr_T10_max.trainParam.lr = learning_rate_max;
l5_n45_lr_T10_max.layers{1:4}.transferFcn = actication_function;
l5_n45_lr_T10_max = train(l5_n45_lr_T10_max,p_tr,g_tr);


%-----------------------------
%            Plots
%-----------------------------
figure(1)
plot(p,g_p),
hold on
plot(p_tr,g_tr,'*'),
xlabel('p'), ylabel('g(p)'), 
grid on
title('Training Points'),
saveas(figure(1), 'Graph_1_Training_points_T10.jpg');
close(figure(1))

figure(2)
plot(p,g_p,'-k')
hold on
plot(p,l1_lr_T10_med(p),'or')
hold on
plot(p,l2_n5_lr_T10_med(p),'+b')
hold on
plot(p,l2_n10_lr_T10_med(p),'*y')
hold on
plot(p,l2_n15_lr_T10_med(p),'xc')
hold on
plot(p,l2_n20_lr_T10_med(p),'sm')
xlabel('Two Layers Neural Networks'), ylabel('Network Output'), 
legend('g(p)','Single Layer','5 Neurons','10 Neurons','15 Neurons','20 Neurons','FontSize',18,'Location','southeast'),
title('Two layers netowrk with different numbers of neurons'),
grid on, xlim([min(p) max(p)])
saveas(figure(2), 'Graph_2_Neurons_Num_n5_to_n20_T10.jpg');
close(figure(2))

figure(3)
plot(p,g_p,'-k')
hold on
plot(p,l2_n25_lr_T10_med(p),'or')
hold on
plot(p,l2_n30_lr_T10_med(p),'+b')
hold on
plot(p,l2_n35_lr_T10_med(p),'*y')
hold on
plot(p,l2_n40_lr_T10_med(p),'xc')
hold on
plot(p,l2_n45_lr_T10_med(p),'sm')
hold on
plot(p,l2_n50_lr_T10_med(p),'dg')
xlabel('Two Layers Neural Networks'), ylabel('Network Output'), 
legend('g(p)','25 Neurons','30 Neurons','35 Neurons','40 Neurons','45 Neurons','50 Neurons','FontSize',18,'Location','southeast'),
title('Two layers netowrk with different numbers of neurons'),
grid on, xlim([min(p) max(p)])
saveas(figure(3), 'Graph_3_Neurons_Num_n25_to_n50_T10.jpg');
close(figure(3))

figure(4)
plot(p,g_p-l1_lr_T10_med(p),'or')
hold on
plot(p,g_p-l2_n5_lr_T10_med(p),'+b')
hold on
plot(p,g_p-l2_n10_lr_T10_med(p),'*y')
hold on
plot(p,g_p-l2_n15_lr_T10_med(p),'xc')
hold on
plot(p,g_p-l2_n20_lr_T10_med(p),'sm')
xlabel('Two Layers Neural Networks'), ylabel('Network Output'), 
legend('Single Layer','5 Neurons','10 Neurons','15 Neurons','20 Neurons','FontSize',18,'Location','southeast'),
title('Error for Two layers netowrk with different numbers of neurons'),
grid on, xlim([min(p) max(p)])
saveas(figure(4), 'Graph_4_Neurons_Num_Error_n5_to_n20_T10.jpg');
close(figure(4))

figure(5)
plot(p,g_p-l2_n25_lr_T10_med(p),'or')
hold on
plot(p,g_p-l2_n30_lr_T10_med(p),'+b')
hold on
plot(p,g_p-l2_n35_lr_T10_med(p),'*y')
hold on
plot(p,g_p-l2_n40_lr_T10_med(p),'xc')
hold on
plot(p,g_p-l2_n45_lr_T10_med(p),'sm')
hold on
plot(p,g_p-l2_n50_lr_T10_med(p),'dg')
xlabel('Input'), ylabel('Error'), 
legend('25 Neurons','30 Neurons','35 Neurons','40 Neurons','45 Neurons','50 Neurons','FontSize',18,'Location','southeast'),
title('Error for Two layers netowrk with different numbers of neurons'),
grid on, xlim([min(p) max(p)])
saveas(figure(5), 'Graph_5_Neurons_Num_Error_n25_to_n50_T10.jpg');
close(figure(5))

figure(6)
plot(p,g_p,'-k')
hold on
plot(p,l1_lr_T10_med(p),'or')
hold on
plot(p,l2_n45_lr_T10_med(p),'+b')
hold on
plot(p,l3_n45_lr_T10_med(p),'*y')
hold on
plot(p,l4_n45_lr_T10_med(p),'xc')
hold on
plot(p,l5_n45_lr_T10_med(p),'dg')
hold on
xlabel('Input'), ylabel('Error'), 
title('Multiple layers networks with 45 Perceptrons on all hidden layers'),
legend('g(p)','1 Layers','2 Layers','3 Layers','4 Layers','5 Layers','FontSize',18,'Location','southeast')
grid on, xlim([min(p) max(p)])
saveas(figure(6), 'Graph_6_Multilayer_n45_T10.jpg');
close(figure(6))

figure(7)
plot(p,g_p,'-k')
hold on
plot(p,l1_lr_T10_med(p),'or')
hold on
plot(p,l2_n45_lr_T10_med(p),'+b')
hold on
plot(p,l3_n45_lr_T10_med(p),'*y')
hold on
plot(p,l4_n45_lr_T10_med(p),'xc')
hold on
plot(p,l5_n45_lr_T10_med(p),'dg')
hold on
xlabel('Input'), ylabel('Error'), 
title('Error of multiple layers netwroks with 45 Perceptrons'),
legend('g(p)','1 Layers','2 Layers','3 Layers','4 Layers','5 Layers','FontSize',18,'Location','southeast')
grid on, xlim([min(p) max(p)])
saveas(figure(7), 'Graph_7_Multilayer_Error_n45_T10.jpg');
close(figure(7))

figure(8)
plot(p,g_p,'-k')
hold on
plot(p,l2_n10_lr_T10_min(p),'or')
hold on
plot(p,l2_n10_lr_T10_med(p),'+b')
hold on
plot(p,l2_n10_lr_T10_max(p),'*y')
hold on
plot(p,l5_n45_lr_T10_min(p),'xc')
hold on
plot(p,l5_n45_lr_T10_med(p),'dg')
hold on
plot(p,l5_n45_lr_T10_max(p),'hm')
hold on
xlabel('Input'), ylabel('Error'), 
title('Results for Different Types of Learning Rates'),
legend('g(p)','2L 10N Small','2L 10N Medium','2L 10N Large','5L 45N Small','5L 45N Medium','5L 45N Large','FontSize',18,'Location','southeast')
grid on, xlim([min(p) max(p)])
saveas(figure(8), 'Graph_8_Multilayer_Error_n45_T10.jpg');
close(figure(8))

figure(9)
plot(p,l5_n45_lr_T1_med(p),'or')
hold on
plot(p,l5_n45_lr_T3_med(p),'+b')
hold on
plot(p,l5_n45_lr_T5_med(p),'*y')
hold on
plot(p,l5_n45_lr_T7_med(p),'xc')
hold on
plot(p,l5_n45_lr_T9_med(p),'dg')
hold on
plot(p,l5_n45_lr_T10_med(p),'hm')
hold on
xlabel('Input'), ylabel('Error'), 
title('Effect of T - 5 Layers NN with 45 Neurons on each Layer'),
legend('T = 1','T = 3','T = 5','T = 7','T = 9','T = 10','FontSize',18,'Location','southeast')
grid on, xlim([min(p) max(p)])
saveas(figure(9), 'Graph_9_Multilayer_5L_45N_ALL.jpg');
close(figure(9))


figure(10)
plot(p,l2_n10_lr_T1_med(p),'or')
hold on
plot(p,l2_n10_lr_T3_med(p),'+b')
hold on
plot(p,l2_n10_lr_T5_med(p),'*y')
hold on
plot(p,l2_n10_lr_T7_med(p),'xc')
hold on
plot(p,l2_n10_lr_T9_med(p),'dg')
hold on
plot(p,l2_n10_lr_T10_med(p),'hm')
hold on
xlabel('Input'), ylabel('Error'), 
title('Effect of T - 2 Layers NN with 10 Neurons on each Layer'),
legend('T = 1','T = 3','T = 5','T = 7','T = 9','T = 10','FontSize',18,'Location','southeast')
grid on, xlim([min(p) max(p)])
saveas(figure(10), 'Graph_10_Multilayer_2L_10N_ALL.jpg');
close(figure(10))
