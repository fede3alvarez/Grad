close all;
clear all;
clc;

%------------------------------------------------
%                 Generate Classes
%------------------------------------------------
% number of samples of each class
s = 100;

% Covariance
Sigma=[0.05 0.05];

A=mvnrnd([2,1],Sigma,s);
B=mvnrnd([2,2.5],Sigma,s);
C=mvnrnd([2,4],Sigma,s);
D=mvnrnd([1,1.75],Sigma,s);
E=mvnrnd([1,3.5],Sigma,s);

p = [A; B; C; D; E];
t = [ones(1,size(A,2)); 2*ones(1,size(B,2)); 3*ones(1,size(C,2)); 4*ones(1,size(D,2)); 5*ones(1,size(E,2))];


%------------------------------------------------
%                   Plot Data
%------------------------------------------------

i_fig = 1;

figure(i_fig)
plot(A(:,1),A(:,2),'d','MarkerFaceColor','black','MarkerSize',12),
hold on
plot(B(:,1),B(:,2),'s','MarkerFaceColor','blue','MarkerSize',12),
hold on
plot(C(:,1),C(:,2),'^','MarkerFaceColor','red','MarkerSize',12),
hold on
plot(D(:,1),D(:,2),'p','MarkerFaceColor','green','MarkerSize',12),
hold on
plot(E(:,1),E(:,2),'h','MarkerFaceColor','cyan','MarkerSize',12),
grid on
title('Raw Data and Classes'),
legend('Class A','Class B','Class C','Class D','Class E','FontSize',12,'Location','southeast'),
saveas(figure(i_fig), "Graph_" + i_fig + ".jpg");
close(figure(i_fig));
i_fig = i_fig + 1;


%------------------------------------------------
%              K-Means Calculations
%------------------------------------------------

% Loop / Repeat for different values of k
for k = 2:10

    % Plots data points in the background
    figure(i_fig);
    plot(A(:,1),A(:,2),'d','MarkerFaceColor','black','MarkerSize',6),
    hold on
    plot(B(:,1),B(:,2),'s','MarkerFaceColor','blue','MarkerSize',6),
    hold on
    plot(C(:,1),C(:,2),'^','MarkerFaceColor','red','MarkerSize',6),
    hold on
    plot(D(:,1),D(:,2),'p','MarkerFaceColor','green','MarkerSize',6),
    hold on
    plot(E(:,1),E(:,2),'h','MarkerFaceColor','cyan','MarkerSize',6),
    hold on
    grid on

    % Graph Color (Ensure each cluter is a different color for visualization) 
    cmap = colormap(colorcube(11));

    % K-means actual calculation / command
    [idx, centroids] = kmeans(p, k);

    % Plot each cluster
    for clusters = 1:k    
        % Find specific cluster and points
        curr_cluster = find(idx == clusters);
        p_i = p(curr_cluster,:);

        % Plot Cluster
        plot(p_i(:,1), p_i(:,2),'o','color',cmap(clusters,:),'MarkerSize',12,'LineWidth',2);
        hold on

        % Plot Cluster Centroid in White background (for visualization)
        plot(centroids(clusters,1),centroids(clusters,2),'wx','MarkerSize',12,'LineWidth',6);
        hold on
        plot(centroids(clusters,1),centroids(clusters,2),'x','color',cmap(clusters,:),'MarkerSize',10,'LineWidth',3);

    end

    % Save Graph and update figure number
    title(k + " K-Clusters");
    saveas(figure(i_fig), "Graph_" + i_fig + ".jpg");
    close(figure(i_fig));
    i_fig = i_fig + 1;
end

