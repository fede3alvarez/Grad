% Plots

figure(2)
plot(p,g_p,'-')
hold on
plot(p_tr,t1_l1_outputs,'or')
hold on
plot(p_tr,t1_l2_n5_outputs,'+b')
xlabel('p_t_r_a_i_n_i_n_g _s_e_t'), ylabel('Network Output'), 
legend('g(p)','Single Layer','Two Layers (5 Neurons)','FontSize',18,'Location','southeast'),
grid on, xlim([min(p_tr) max(p_tr)])

figure(3)
plot(p,g_p,'-')
hold on
plot(p_tr,t1_l2_n10_outputs,'*y')
hold on
plot(p_tr,t1_l2_n15_outputs,'xc')
hold on
plot(p_tr,t1_l2_n20_outputs,'sm')
xlabel('p_t_r_a_i_n_i_n_g _s_e_t'), ylabel('Network Output'), 
legend('g(p)','10 Neurons','15 Neurons','20 Neurons','FontSize',18,'Location','southeast'),
grid on, xlim([min(p_tr) max(p_tr)])

figure(4)
plot(p,g_p,'-')
hold on
plot(p_tr,t1_l2_n25_outputs,'dg')
hold on
plot(p_tr,t1_l2_n30_outputs,'^r')
hold on
plot(p_tr,t1_l2_n35_outputs,'vb')
xlabel('p_t_r_a_i_n_i_n_g _s_e_t'), ylabel('Network Output'), 
legend('g(p)','25 Neurons','30 Neurons','35 Neurons','FontSize',18,'Location','southeast'),
grid on, xlim([min(p_tr) max(p_tr)])

figure(5)
plot(p,g_p,'-')
hold on
plot(p_tr,t1_l2_n40_outputs,'pg')
hold on
plot(p_tr,t1_l2_n45_outputs,'hc')
hold on
plot(p_tr,t1_l2_n50_outputs,'vm')
hold on
xlabel('p_t_r_a_i_n_i_n_g _s_e_t'), ylabel('Network Output'), 
legend('g(p)','40 Neurons','45 Neurons','50 Neurons','FontSize',18,'Location','southeast')
grid on, xlim([min(p_tr) max(p_tr)])

figure(6)
plot(p,g_p,'-')
hold on
plot(p_tr,t1_l1_outputs,'pg')
hold on
plot(p_tr,t1_l2_n10_outputs,'hc')
hold on
plot(p_tr,t1_l3_n10_outputs,'vm')
hold on
plot(p_tr,t1_l4_n10_outputs,'^r')
hold on
plot(p_tr,t1_l5_n10_outputs,'vb')
xlabel('p_t_r_a_i_n_i_n_g _s_e_t'), ylabel('Network Output'), 
title('Comparison of multiple layers with 10 Perceptrons'),
legend('g(p)','1 Layers','2 Layers','3 Layers','4 Layers','5 Layers','FontSize',18,'Location','southeast')
grid on, xlim([min(p_tr) max(p_tr)])

figure(7)
plot(p,g_p,'-')
hold on
plot(p_tr,t1_l1_outputs,'pg')
hold on
plot(p_tr,t1_l2_n45_outputs,'hc')
hold on
plot(p_tr,t1_l3_n45_outputs,'vm')
hold on
plot(p_tr,t1_l4_n45_outputs,'^r')
hold on
plot(p_tr,t1_l5_n45_outputs,'vb')
xlabel('p_t_r_a_i_n_i_n_g _s_e_t'), ylabel('Network Output'), 
title('Comparison of multiple layers with 45 Perceptrons'),
legend('g(p)','1 Layers','2 Layers','3 Layers','4 Layers','5 Layers','FontSize',18,'Location','southeast')
grid on, xlim([min(p_tr) max(p_tr)])


figure(8)
plot(p_tr,t1_l2_n5_errors,'og')
hold on
plot(p_tr,t1_l2_n10_errors,'+c')
hold on
plot(p_tr,t1_l2_n15_errors,'vm')
hold on
plot(p_tr,t1_l2_n20_errors,'*c')
hold on
plot(p_tr,t1_l2_n25_errors,'.r')
hold on
plot(p_tr,t1_l2_n30_errors,'xb')
hold on
plot(p_tr,t1_l2_n35_errors,'sk')
hold on
plot(p_tr,t1_l2_n40_errors,'dg')
hold on
plot(p_tr,t1_l2_n45_errors,'hc')
hold on
plot(p_tr,t1_l2_n50_errors,'pm')
hold on
title('Errors for two layers networks with multiple neurons'),
legend('5 Neurons','10 Neurons','15 Neurons','20 Neurons','25 Neurons','30 Neurons','35 Neurons','40 Neurons','45 Neurons','50 Neurons','FontSize',18,'Location','southeast')
grid on, xlim([min(p_tr) max(p_tr)])

figure(9)
plot(p_tr,t1_l1_errors,'pg')
hold on
plot(p_tr,t1_l2_n10_errors,'hc')
hold on
plot(p_tr,t1_l3_n10_errors,'vm')
hold on
plot(p_tr,t1_l4_n10_errors,'^r')
hold on
plot(p_tr,t1_l5_n10_errors,'vb')
title('Errors for multilayers with 10 Perceptrons'),
legend('1 Layers','2 Layers','3 Layers','4 Layers','5 Layers','FontSize',18,'Location','southeast')
grid on, xlim([min(p_tr) max(p_tr)])

figure(10)
plot(p_tr,t1_l1_errors,'pg')
hold on
plot(p_tr,t1_l2_n45_errors,'hc')
hold on
plot(p_tr,t1_l3_n45_errors,'vm')
hold on
plot(p_tr,t1_l4_n45_errors,'^r')
hold on
plot(p_tr,t1_l5_n45_errors,'vb') 
title('Errors for multilayers with 45 Perceptrons'),
legend('1 Layers','2 Layers','3 Layers','4 Layers','5 Layers','FontSize',18,'Location','southeast')
grid on, xlim([min(p_tr) max(p_tr)])