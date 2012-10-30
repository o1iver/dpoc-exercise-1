% script.m
%
% Matlab Script that is used to load the problem data, execute the shortest
% path algorithms and display the results.
%
% Dynamic Programming and Optimal Control
% Fall 2012
% Programming Exercise 1
%
% --
% ETH Zurich
% Institute for Dynamic Systems and Control
% Nico Hübel
% nhuebel@ethz.ch
%
% --
% Revision history
% [20.10.09, ST]    first version
% [30.10.11 NH]     new problem
% [22.10.12 NH]     new problem
%

%% clear workspace and command window
clear all;
close all;
clc;


%% Load problem data
% Load the terrain matrix T
load('terrainT1.mat')

%% Convert terrain matrix T into cost matrix P
% Label all nodes in the terrain matrix and calculate the cost matrix P for
% the algorithms

% Total number of nodes
[m,n] = size(T);
totNodes = (m-2)*(n-2);
P1=generateCostMat(T,0);
P2=generateCostMat(T,1);

%% Choose start and terminal node
% User Input of start and terminal node.  Both start and terminal node can 
% take values between 1 and the total number of nodes.

disp('------------------------------------------------------------------');
disp('Shortest Path Problem'); disp(' ');

% User Input: Start node
inpStartNode = input(['Enter start node (',num2str(1),'..',num2str(totNodes),'): ']);

% Check user input
if isempty(inpStartNode)
    inpStartNode = 1;
    disp(['No start node specified.  Use default start node: ',num2str(inpStartNode),'.']);
end; 
if ~isnumeric(inpStartNode) || inpStartNode > totNodes
    inpStartNode = 1;
    disp(['Input start node not valid.  Use default start node: ',num2str(inpStartNode),'.']);
end;
startNode = inpStartNode;       % store for later use

% User Input: Terminal node
inpTermNode = input(['Enter terminal node (',num2str(1),'..',num2str(totNodes),'): ']);

% Check user input
if isempty(inpTermNode)
    inpTermNode = M;
    disp(['No Terminal node specified.  Use default terminal node: ',num2str(inpTermNode),'.']);
end; 
if ~isnumeric(inpTermNode) || inpTermNode > totNodes
    inpTermNode = totNodes;
    disp(['Input terminal node not valid.  Use default terminal node: ',num2str(inpTermNode),'.']);
end;
termNode = inpTermNode;

disp('------------------------------------------------------------------');
disp('Part I'); disp(' ');

%% Solution Method 1: Dynamic Programming Algorithm
% Solve Shortest Path (SP) problem using the Dynamic Programming Algorithm
% (DPA).
% Input: problem data P, start Node, terminal Node
% Output: optimal path length, optimal path
% Use tic, toc to time the execution.
tic;
[optCost1, optPath1] = sp_dpa(P1,startNode,termNode);
time1 = toc;

%% Solution Method 2: Label Correcting Algorithm
% Solve Shortest Path (SP) problem using the Label Correcting Algorithm
% (LCA) with depth-first method.
tic;
[optCost2, optPath2] = sp_lca(P1,startNode,termNode);
time2 = toc;


%% Display results
disp(' ');
disp('------------------------------------------------------------------');
disp('Results - Part I');
%disp(['Problem with ',num2str(totNodes),' nodes.']);
disp(['Optimal path from node ',num2str(inpStartNode),' to ',num2str(inpTermNode),':']);
%disp('------------------------------------------------------------------');
disp(' ');
disp('Method 1: Dynamic Programming Algorithm');
disp(['  Execution time: ',num2str(time1),'s.']);
disp(['  Minimum path length (minimum total cost): ',num2str(optCost1)]);
disp(['  Path: ',num2str(optPath1)]);
disp(' ');
disp('Method 2: Label Correcting Algorithm');
disp(['  Execution time: ',num2str(time2),'s  (',num2str(time2/time1),' times the time for method 1).']);
disp(['  Minimum path length (minimum total cost): ',num2str(optCost2)]);
disp(['  Path: ',num2str(optPath2)]);
disp('------------------------------------------------------------------');
      
% decode optimal path for later visualization
r1=zeros(1,length(optPath1));
c1=zeros(1,length(optPath1));
t1=zeros(1,length(optPath1));
for i=1:length(optPath1)
    c1(i)=mod(optPath1(i)-1,n-2)+2;
    r1(i)=abs((optPath1(i)-1-mod(optPath1(i)-1,n-2))/(n-2))+2;
    t1(i)=0.2+T(r1(i),c1(i));
end

disp('------------------------------------------------------------------');
disp('Part II'); disp(' ');

%% Solution Method 1: Dynamic Programming Algorithm
% Solve Shortest Path (SP) problem using the Dynamic Programming Algorithm
% (DPA).
% Input: problem data P, start Node, terminal Node
% Output: optimal path length, optimal path
% Use tic, toc to time the execution.
tic;
[optCost1, optPath1] = sp_dpa(P2,startNode,termNode);
time1 = toc;

%% Solution Method 2: Label Correcting Algorithm
% Solve Shortest Path (SP) problem using the Label Correcting Algorithm
% (LCA) with depth-first method.
tic;
[optCost2, optPath2] = sp_lca(P2,startNode,termNode);
time2 = toc;


%% Solution Method 3: A* Algorithm
% Solve Shortest Path (SP) problem using the A* Algorithm
% by modifying your results from the Label Correcting Algorithm.
tic;
[optCost3, optPath3] = sp_astar(P2,startNode,termNode,m,n);
time3 = toc;

%% Display results
disp(' ');
disp('------------------------------------------------------------------');
disp('Results - Part II');
%disp(['Problem with ',num2str(totNodes),' nodes.']);
disp(['Optimal path from node ',num2str(inpStartNode),' to ',num2str(inpTermNode),':']);
%disp('------------------------------------------------------------------');
disp(' ');
disp('Method 1: Dynamic Programming Algorithm');
disp(['  Execution time: ',num2str(time1),'s.']);
disp(['  Minimum path length (minimum total cost): ',num2str(optCost1)]);
disp(['  Path: ',num2str(optPath1)]);
disp(' ');
disp('Method 2: Label Correcting Algorithm');
disp(['  Execution time: ',num2str(time2),'s  (',num2str(time2/time1),' times the time for method 1).']);
disp(['  Minimum path length (minimum total cost): ',num2str(optCost2)]);
disp(['  Path: ',num2str(optPath2)]);
disp(' ');
disp('Method 3: A* Algorithm');
disp(['  Execution time: ',num2str(time3),'s  (',num2str(time3/time1),' times the time for method 1).']);
disp(['  Minimum path length (minimum total cost): ',num2str(optCost3)]);
disp(['  Path: ',num2str(optPath3)]);
disp(' ');
disp('------------------------------------------------------------------');

%% visualize terrain
for i=2:m-1
    for j=2:n-1
        if T(i,j)==inf
            T(i,j)=1000;
        end
    end
end
[X,Y]=meshgrid(2:n-1,2:m-1);
size(X)
size(Y)
size(T(2:m-1,2:n-1))
surf(X,Y,T(2:m-1,2:n-1));
title('terrain')
hold on
plot3(c1,r1,t1,'--g*','LineWidth',2)
hold on
% decode optimal path
r2=zeros(1,length(optPath1));
c2=zeros(1,length(optPath1));
t2=zeros(1,length(optPath1));
for i=1:length(optPath1)
    c2(i)=mod(optPath1(i)-1,n-2)+2;
    r2(i)=abs((optPath1(i)-1-mod(optPath1(i)-1,n-2))/(n-2))+2;
    t2(i)=0.2+T(r2(i),c2(i));
end
plot3(c2,r2,t2,'--r*','LineWidth',2)
legend('terrain','part I','part II')