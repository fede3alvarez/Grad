close all;
clear all;
clc;

%-----------------------------
%      Generate Classes
%-----------------------------
% number of samples of each class
s = 100;

% Covariance
Sigma=[0.075 0.075];

A1=mvnrnd([0,0],Sigma,s);
A2=mvnrnd([1,1],Sigma,s);
B1=mvnrnd([0,1],Sigma,s);
B2=mvnrnd([1,0],Sigma,s);

A = [A1; A2]'
B = [B1; B2]'

p = [A B];
t = [ones(1,size(A,2)),-1*ones(1,size(B,2))];


%-----------------------------
%      Plotting Parameters
%-----------------------------
val_min = -0.5;
val_max =  1.5;
step = 0.1

%-----------------------------
%      Network Settings
%-----------------------------

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
l1_lr_min = feedforwardnet([]);
l1_lr_min = nn_settings(l1_lr_min);
l1_lr_min.trainParam.lr = learning_rate_min;
l1_lr_min = train(l1_lr_min,p,t);

l1_lr_med = feedforwardnet([]);
l1_lr_med = nn_settings(l1_lr_med);
l1_lr_med.trainParam.lr = learning_rate_med;
l1_lr_med = train(l1_lr_med,p,t);

l1_lr_max = feedforwardnet([]);
l1_lr_max = nn_settings(l1_lr_max);
l1_lr_max.trainParam.lr = learning_rate_max;
l1_lr_max = train(l1_lr_max,p,t);


% Two Layers Neural Networks with hidden layer neurons
%   increasing in steps of 5

% 5 Neurons
l2_n5_lr_min = feedforwardnet([5]);
l2_n5_lr_min = nn_settings(l2_n5_lr_min);
l2_n5_lr_min.trainParam.lr = learning_rate_min;
l2_n5_lr_min.layers{1}.transferFcn = actication_function;
l2_n5_lr_min = train(l2_n5_lr_min,p,t);

l2_n5_lr_med = feedforwardnet([5]);
l2_n5_lr_med = nn_settings(l2_n5_lr_med);
l2_n5_lr_med.trainParam.lr = learning_rate_med;
l2_n5_lr_med.layers{1}.transferFcn = actication_function;
l2_n5_lr_med = train(l2_n5_lr_med,p,t);

l2_n5_lr_max = feedforwardnet([5]);
l2_n5_lr_max = nn_settings(l2_n5_lr_max);
l2_n5_lr_max.trainParam.lr = learning_rate_max;
l2_n5_lr_max.layers{1}.transferFcn = actication_function;
l2_n5_lr_max = train(l2_n5_lr_max,p,t);

% 10 Neuron
l2_n10_lr_min = feedforwardnet([10]);
l2_n10_lr_min = nn_settings(l2_n10_lr_min);
l2_n10_lr_min.trainParam.lr = learning_rate_min;
l2_n10_lr_min.layers{1}.transferFcn = actication_function;
l2_n10_lr_min = train(l2_n10_lr_min,p,t);

l2_n10_lr_med = feedforwardnet([10]);
l2_n10_lr_med = nn_settings(l2_n10_lr_med);
l2_n10_lr_med.trainParam.lr = learning_rate_med;
l2_n10_lr_med.layers{1}.transferFcn = actication_function;
l2_n10_lr_med = train(l2_n10_lr_med,p,t);

l2_n10_lr_max = feedforwardnet([10]);
l2_n10_lr_max = nn_settings(l2_n10_lr_max);
l2_n10_lr_max.trainParam.lr = learning_rate_max;
l2_n10_lr_max.layers{1}.transferFcn = actication_function;
l2_n10_lr_max = train(l2_n10_lr_max,p,t);

% 15 Neurons
l2_n15_lr_min = feedforwardnet([15]);
l2_n15_lr_min = nn_settings(l2_n15_lr_min);
l2_n15_lr_min.trainParam.lr = learning_rate_min;
l2_n15_lr_min.layers{1}.transferFcn = actication_function;
l2_n15_lr_min = train(l2_n15_lr_min,p,t);

l2_n15_lr_med = feedforwardnet([15]);
l2_n15_lr_med = nn_settings(l2_n15_lr_med);
l2_n15_lr_med.trainParam.lr = learning_rate_med;
l2_n15_lr_med.layers{1}.transferFcn = actication_function;
l2_n15_lr_med = train(l2_n15_lr_med,p,t);

l2_n15_lr_max = feedforwardnet([15]);
l2_n15_lr_max = nn_settings(l2_n15_lr_max);
l2_n15_lr_max.trainParam.lr = learning_rate_max;
l2_n15_lr_max.layers{1}.transferFcn = actication_function;
l2_n15_lr_max = train(l2_n15_lr_max,p,t);

% 20 Neuron
l2_n20_lr_min = feedforwardnet([20]);
l2_n20_lr_min = nn_settings(l2_n20_lr_min);
l2_n20_lr_min.trainParam.lr = learning_rate_min;
l2_n20_lr_min.layers{1}.transferFcn = actication_function;
l2_n20_lr_min = train(l2_n20_lr_min,p,t);

l2_n20_lr_med = feedforwardnet([20]);
l2_n20_lr_med = nn_settings(l2_n20_lr_med);
l2_n20_lr_med.trainParam.lr = learning_rate_med;
l2_n20_lr_med.layers{1}.transferFcn = actication_function;
l2_n20_lr_med = train(l2_n20_lr_med,p,t);

l2_n20_lr_max = feedforwardnet([20]);
l2_n20_lr_max = nn_settings(l2_n20_lr_max);
l2_n20_lr_max.trainParam.lr = learning_rate_max;
l2_n20_lr_max.layers{1}.transferFcn = actication_function;
l2_n20_lr_max = train(l2_n20_lr_max,p,t);

% 25 Neurons
l2_n25_lr_min = feedforwardnet([25]);
l2_n25_lr_min = nn_settings(l2_n25_lr_min);
l2_n25_lr_min.trainParam.lr = learning_rate_min;
l2_n25_lr_min.layers{1}.transferFcn = actication_function;
l2_n25_lr_min = train(l2_n25_lr_min,p,t);

l2_n25_lr_med = feedforwardnet([25]);
l2_n25_lr_med = nn_settings(l2_n25_lr_med);
l2_n25_lr_med.trainParam.lr = learning_rate_med;
l2_n25_lr_med.layers{1}.transferFcn = actication_function;
l2_n25_lr_med = train(l2_n25_lr_med,p,t);

l2_n25_lr_max = feedforwardnet([25]);
l2_n25_lr_max = nn_settings(l2_n25_lr_max);
l2_n25_lr_max.trainParam.lr = learning_rate_max;
l2_n25_lr_max.layers{1}.transferFcn = actication_function;
l2_n25_lr_max = train(l2_n25_lr_max,p,t);

% 30 Neuron
l2_n30_lr_min = feedforwardnet([30]);
l2_n30_lr_min = nn_settings(l2_n30_lr_min);
l2_n30_lr_min.trainParam.lr = learning_rate_min;
l2_n30_lr_min.layers{1}.transferFcn = actication_function;
l2_n30_lr_min = train(l2_n30_lr_min,p,t);

l2_n30_lr_med = feedforwardnet([30]);
l2_n30_lr_med = nn_settings(l2_n30_lr_med);
l2_n30_lr_med.trainParam.lr = learning_rate_med;
l2_n30_lr_med.layers{1}.transferFcn = actication_function;
l2_n30_lr_med = train(l2_n30_lr_med,p,t);

l2_n30_lr_max = feedforwardnet([30]);
l2_n30_lr_max = nn_settings(l2_n30_lr_max);
l2_n30_lr_max.trainParam.lr = learning_rate_max;
l2_n30_lr_max.layers{1}.transferFcn = actication_function;
l2_n30_lr_max = train(l2_n30_lr_max,p,t);

% 35 Neurons
l2_n35_lr_min = feedforwardnet([35]);
l2_n35_lr_min = nn_settings(l2_n35_lr_min);
l2_n35_lr_min.trainParam.lr = learning_rate_min;
l2_n35_lr_min.layers{1}.transferFcn = actication_function;
l2_n35_lr_min = train(l2_n35_lr_min,p,t);

l2_n35_lr_med = feedforwardnet([35]);
l2_n35_lr_med = nn_settings(l2_n35_lr_med);
l2_n35_lr_med.trainParam.lr = learning_rate_med;
l2_n35_lr_med.layers{1}.transferFcn = actication_function;
l2_n35_lr_med = train(l2_n35_lr_med,p,t);

l2_n35_lr_max = feedforwardnet([35]);
l2_n35_lr_max = nn_settings(l2_n35_lr_max);
l2_n35_lr_max.trainParam.lr = learning_rate_max;
l2_n35_lr_max.layers{1}.transferFcn = actication_function;
l2_n35_lr_max = train(l2_n35_lr_max,p,t);

% 40 Neuron
l2_n40_lr_min = feedforwardnet([40]);
l2_n40_lr_min = nn_settings(l2_n40_lr_min);
l2_n40_lr_min.trainParam.lr = learning_rate_min;
l2_n40_lr_min.layers{1}.transferFcn = actication_function;
l2_n40_lr_min = train(l2_n40_lr_min,p,t);

l2_n40_lr_med = feedforwardnet([40]);
l2_n40_lr_med = nn_settings(l2_n40_lr_med);
l2_n40_lr_med.trainParam.lr = learning_rate_med;
l2_n40_lr_med.layers{1}.transferFcn = actication_function;
l2_n40_lr_med = train(l2_n40_lr_med,p,t);

l2_n40_lr_max = feedforwardnet([40]);
l2_n40_lr_max = nn_settings(l2_n40_lr_max);
l2_n40_lr_max.trainParam.lr = learning_rate_max;
l2_n40_lr_max.layers{1}.transferFcn = actication_function;
l2_n40_lr_max = train(l2_n40_lr_max,p,t);

% 45 Neurons
l2_n45_lr_min = feedforwardnet([45]);
l2_n45_lr_min = nn_settings(l2_n45_lr_min);
l2_n45_lr_min.trainParam.lr = learning_rate_min;
l2_n45_lr_min.layers{1}.transferFcn = actication_function;
l2_n45_lr_min = train(l2_n45_lr_min,p,t);

l2_n45_lr_med = feedforwardnet([45]);
l2_n45_lr_med = nn_settings(l2_n45_lr_med);
l2_n45_lr_med.trainParam.lr = learning_rate_med;
l2_n45_lr_med.layers{1}.transferFcn = actication_function;
l2_n45_lr_med = train(l2_n45_lr_med,p,t);

l2_n45_lr_max = feedforwardnet([45]);
l2_n45_lr_max = nn_settings(l2_n45_lr_max);
l2_n45_lr_max.trainParam.lr = learning_rate_max;
l2_n45_lr_max.layers{1}.transferFcn = actication_function;
l2_n45_lr_max = train(l2_n45_lr_max,p,t);

% 50 Neurons
l2_n50_lr_min = feedforwardnet([50]);
l2_n50_lr_min = nn_settings(l2_n50_lr_min);
l2_n50_lr_min.trainParam.lr = learning_rate_min;
l2_n50_lr_min.layers{1}.transferFcn = actication_function;
l2_n50_lr_min = train(l2_n50_lr_min,p,t);

l2_n50_lr_med = feedforwardnet([50]);
l2_n50_lr_med = nn_settings(l2_n50_lr_med);
l2_n50_lr_med.trainParam.lr = learning_rate_med;
l2_n50_lr_med.layers{1}.transferFcn = actication_function;
l2_n50_lr_med = train(l2_n50_lr_med,p,t);

l2_n50_lr_max = feedforwardnet([50]);
l2_n50_lr_max = nn_settings(l2_n50_lr_max);
l2_n50_lr_max.trainParam.lr = learning_rate_max;
l2_n50_lr_max.layers{1}.transferFcn = actication_function;
l2_n50_lr_max = train(l2_n50_lr_max,p,t);

% Multilayer Networks with constant neurons
% 3 layers - 2 hidden layers with 45 neurons each
l3_n45_lr_min = feedforwardnet([45, 45]);
l3_n45_lr_min = nn_settings(l3_n45_lr_min);
l3_n45_lr_min.trainParam.lr = learning_rate_min;
l3_n45_lr_min.layers{1:2}.transferFcn = actication_function;
l3_n45_lr_min = train(l3_n45_lr_min,p,t);

l3_n45_lr_med = feedforwardnet([45, 45]);
l3_n45_lr_med = nn_settings(l3_n45_lr_med);
l3_n45_lr_med.trainParam.lr = learning_rate_med;
l3_n45_lr_med.layers{1:2}.transferFcn = actication_function;
l3_n45_lr_med = train(l3_n45_lr_med,p,t);

l3_n45_lr_max = feedforwardnet([45, 45]);
l3_n45_lr_max = nn_settings(l3_n45_lr_max);
l3_n45_lr_max.trainParam.lr = learning_rate_max;
l3_n45_lr_max.layers{1:2}.transferFcn = actication_function;
l3_n45_lr_max = train(l3_n45_lr_max,p,t);

% 4 layers - 3 hidden layers with 45 neurons each
l4_n45_lr_min = feedforwardnet([45, 45, 45]);
l4_n45_lr_min = nn_settings(l4_n45_lr_min);
l4_n45_lr_min.trainParam.lr = learning_rate_min;
l4_n45_lr_min.layers{1:3}.transferFcn = actication_function;
l4_n45_lr_min = train(l4_n45_lr_min,p,t);

l4_n45_lr_med = feedforwardnet([45, 45, 45]);
l4_n45_lr_med = nn_settings(l4_n45_lr_med);
l4_n45_lr_med.trainParam.lr = learning_rate_med;
l4_n45_lr_med.layers{1:3}.transferFcn = actication_function;
l4_n45_lr_med = train(l4_n45_lr_med,p,t);

l4_n45_lr_max = feedforwardnet([45, 45, 45]);
l4_n45_lr_max = nn_settings(l4_n45_lr_max);
l4_n45_lr_max.trainParam.lr = learning_rate_max;
l4_n45_lr_max.layers{1:3}.transferFcn = actication_function;
l4_n45_lr_max = train(l4_n45_lr_max,p,t);

% 5 layers - 4 hidden layers with 45 neurons each
l5_n45_lr_min = feedforwardnet([45, 45, 45, 45]);
l5_n45_lr_min = nn_settings(l5_n45_lr_min);
l5_n45_lr_min.trainParam.lr = learning_rate_min;
l5_n45_lr_min.layers{1:4}.transferFcn = actication_function;
l5_n45_lr_min = train(l5_n45_lr_min,p,t);

l5_n45_lr_med = feedforwardnet([45, 45, 45, 45]);
l5_n45_lr_med = nn_settings(l5_n45_lr_med);
l5_n45_lr_med.trainParam.lr = learning_rate_med;
l5_n45_lr_med.layers{1:4}.transferFcn = actication_function;
l5_n45_lr_med = train(l5_n45_lr_med,p,t);

l5_n45_lr_max = feedforwardnet([45, 45, 45, 45]);
l5_n45_lr_max = nn_settings(l5_n45_lr_max);
l5_n45_lr_max.trainParam.lr = learning_rate_max;
l5_n45_lr_max.layers{1:4}.transferFcn = actication_function;
l5_n45_lr_max = train(l5_n45_lr_max,p,t);


%---------------------------
%            Plots
%---------------------------

i_fig = 1

figure(i_fig)
plot(A(1,:),A(2,:),'dk','MarkerFaceColor','black'),
hold on
plot(B(1,:),B(2,:),'sb','MarkerFaceColor','blue'),
grid on
legend('Class A','Class B','FontSize',12,'Location','southeast'),
saveas(figure(i_fig), "Graph_" + i_fig + ".jpg");
close(figure(i_fig));
i_fig = i_fig + 1


figure(i_fig)

subplot(2,2,1)
plot_db(l1_lr_med,val_min, val_max,step,val_min, val_max,step)
hold on
plot(A(1,:),A(2,:),'dk','MarkerFaceColor','black'),
hold on
plot(B(1,:),B(2,:),'sb','MarkerFaceColor','blue'),
title('Single Layer'),
grid on, 

subplot(2,2,2)
plot_db(l2_n5_lr_med,val_min, val_max,step,val_min, val_max,step)
hold on
plot(A(1,:),A(2,:),'dk','MarkerFaceColor','black'),
hold on
plot(B(1,:),B(2,:),'sb','MarkerFaceColor','blue'),
title('2 Layers, 5 Neurons'),
grid on,

subplot(2,2,3)
plot_db(l2_n10_lr_med,val_min, val_max,step,val_min, val_max,step)
hold on
plot(A(1,:),A(2,:),'dk','MarkerFaceColor','black'),
hold on
plot(B(1,:),B(2,:),'sb','MarkerFaceColor','blue'),
title('2 Layers, 10 Neurons'),
grid on, 

subplot(2,2,4)
plot_db(l2_n15_lr_med,val_min, val_max,step,val_min, val_max,step)
hold on
plot(A(1,:),A(2,:),'dk','MarkerFaceColor','black'),
hold on
plot(B(1,:),B(2,:),'sb','MarkerFaceColor','blue'),
title('2 Layers, 15 Neurons'),
grid on, 

saveas(figure(i_fig), "Graph_" + i_fig + ".jpg");
close(figure(i_fig));
i_fig = i_fig + 1


figure(i_fig)

subplot(2,2,1)
plot_db(l2_n20_lr_med,val_min, val_max,step,val_min, val_max,step)
hold on
plot(A(1,:),A(2,:),'dk','MarkerFaceColor','black'),
hold on
plot(B(1,:),B(2,:),'sb','MarkerFaceColor','blue'),
title('2 Layers, 20 Neurons'),
grid on, 

subplot(2,2,2)
plot_db(l2_n25_lr_med,val_min, val_max,step,val_min, val_max,step)
hold on
plot(A(1,:),A(2,:),'dk','MarkerFaceColor','black'),
hold on
plot(B(1,:),B(2,:),'sb','MarkerFaceColor','blue'),
title('2 Layers, 25 Neurons'),
grid on,

subplot(2,2,3)
plot_db(l2_n30_lr_med,val_min, val_max,step,val_min, val_max,step)
hold on
plot(A(1,:),A(2,:),'dk','MarkerFaceColor','black'),
hold on
plot(B(1,:),B(2,:),'sb','MarkerFaceColor','blue'),
title('2 Layers, 30 Neurons'),
grid on, 

subplot(2,2,4)
plot_db(l2_n35_lr_med,val_min, val_max,step,val_min, val_max,step)
hold on
plot(A(1,:),A(2,:),'dk','MarkerFaceColor','black'),
hold on
plot(B(1,:),B(2,:),'sb','MarkerFaceColor','blue'),
title('2 Layers, 35 Neurons'),
grid on, 

saveas(figure(i_fig), "Graph_" + i_fig + ".jpg");
close(figure(i_fig));
i_fig = i_fig + 1


figure(i_fig)

subplot(2,2,1)
plot_db(l2_n40_lr_med,val_min, val_max,step,val_min, val_max,step)
hold on
plot(A(1,:),A(2,:),'dk','MarkerFaceColor','black'),
hold on
plot(B(1,:),B(2,:),'sb','MarkerFaceColor','blue'),
title('2 Layers, 40 Neurons'),
grid on, 

subplot(2,2,2)
plot_db(l2_n45_lr_med,val_min, val_max,step,val_min, val_max,step)
hold on
plot(A(1,:),A(2,:),'dk','MarkerFaceColor','black'),
hold on
plot(B(1,:),B(2,:),'sb','MarkerFaceColor','blue'),
title('2 Layers, 45 Neurons'),
grid on,

subplot(2,2,3)
plot_db(l2_n50_lr_med,val_min, val_max,step,val_min, val_max,step)
hold on
plot(A(1,:),A(2,:),'dk','MarkerFaceColor','black'),
hold on
plot(B(1,:),B(2,:),'sb','MarkerFaceColor','blue'),
title('2 Layers, 50 Neurons'),
grid on, 

saveas(figure(i_fig), "Graph_" + i_fig + ".jpg");
close(figure(i_fig));
i_fig = i_fig + 1



figure(i_fig)

subplot(2,3,1)
plot_db(l1_lr_med,val_min, val_max,step,val_min, val_max,step)
hold on
plot(A(1,:),A(2,:),'dk','MarkerFaceColor','black'),
hold on
plot(B(1,:),B(2,:),'sb','MarkerFaceColor','blue'),
title('Single Layer'),
grid on, 

subplot(2,3,2)
plot_db(l2_n45_lr_med,val_min, val_max,step,val_min, val_max,step)
hold on
plot(A(1,:),A(2,:),'dk','MarkerFaceColor','black'),
hold on
plot(B(1,:),B(2,:),'sb','MarkerFaceColor','blue'),
title('2 Layers, 45 N'),
grid on,

subplot(2,3,3)
plot_db(l3_n45_lr_med,val_min, val_max,step,val_min, val_max,step)
hold on
plot(A(1,:),A(2,:),'dk','MarkerFaceColor','black'),
hold on
plot(B(1,:),B(2,:),'sb','MarkerFaceColor','blue'),
title('3 Layers, 45 N'),
grid on, 

subplot(2,3,4)
plot_db(l4_n45_lr_med,val_min, val_max,step,val_min, val_max,step)
hold on
plot(A(1,:),A(2,:),'dk','MarkerFaceColor','black'),
hold on
plot(B(1,:),B(2,:),'sb','MarkerFaceColor','blue'),
title('4 Layers, 45 N'),
grid on, 

subplot(2,3,5)
plot_db(l5_n45_lr_med,val_min, val_max,step,val_min, val_max,step)
hold on
plot(A(1,:),A(2,:),'dk','MarkerFaceColor','black'),
hold on
plot(B(1,:),B(2,:),'sb','MarkerFaceColor','blue'),
title('5 Layers, 45 N'),
grid on, 

saveas(figure(i_fig), "Graph_" + i_fig + ".jpg");
close(figure(i_fig));
i_fig = i_fig + 1



figure(i_fig)

subplot(2,2,1)
plot_db(l2_n10_lr_min,val_min, val_max,step,val_min, val_max,step)
hold on
plot(A(1,:),A(2,:),'dk','MarkerFaceColor','black'),
hold on
plot(B(1,:),B(2,:),'sb','MarkerFaceColor','blue'),
title("Learning Rate: " + learning_rate_min),
grid on, 

subplot(2,2,2)
plot_db(l2_n10_lr_med,val_min, val_max,step,val_min, val_max,step)
hold on
plot(A(1,:),A(2,:),'dk','MarkerFaceColor','black'),
hold on
plot(B(1,:),B(2,:),'sb','MarkerFaceColor','blue'),
title("Learning Rate: " + learning_rate_med),
grid on,

subplot(2,2,3)
plot_db(l2_n10_lr_max,val_min, val_max,step,val_min, val_max,step)
hold on
plot(A(1,:),A(2,:),'dk','MarkerFaceColor','black'),
hold on
plot(B(1,:),B(2,:),'sb','MarkerFaceColor','blue'),
title("Learning Rate: " + learning_rate_max),
grid on, 

sgtitle('2 Layers, 10 Neurons Network with different Learning Rates')
saveas(figure(i_fig), "Graph_" + i_fig + ".jpg");
close(figure(i_fig));
i_fig = i_fig + 1


figure(i_fig)

subplot(2,2,1)
plot_db(l5_n45_lr_min,val_min, val_max,step,val_min, val_max,step)
hold on
plot(A(1,:),A(2,:),'dk','MarkerFaceColor','black'),
hold on
plot(B(1,:),B(2,:),'sb','MarkerFaceColor','blue'),
title("Learning Rate: " + learning_rate_min),
grid on, 


subplot(2,2,2)
plot_db(l5_n45_lr_med,val_min, val_max,step,val_min, val_max,step)
hold on
plot(A(1,:),A(2,:),'dk','MarkerFaceColor','black'),
hold on
plot(B(1,:),B(2,:),'sb','MarkerFaceColor','blue'),
title("Learning Rate: " + learning_rate_med),
grid on,


subplot(2,2,3)
plot_db(l5_n45_lr_max,val_min, val_max,step,val_min, val_max,step)
hold on
plot(A(1,:),A(2,:),'dk','MarkerFaceColor','black'),
hold on
plot(B(1,:),B(2,:),'sb','MarkerFaceColor','blue'),
title("Learning Rate: " + learning_rate_max),
grid on, 

sgtitle('5 Layers, 45 Neurons Network with different Learning Rates')
saveas(figure(i_fig), "Graph_" + i_fig + ".jpg");
close(figure(i_fig));
i_fig = i_fig + 1