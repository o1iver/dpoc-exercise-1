function [optCost, optPath] = sp_dpa(P,startNode,termNode)
% [optCost, optPath] = sp_dpa(P,startNode,termNode)
% 
% Function for solving shortest path problem using the Dynamic Programming
% Algorithm.
% Solution according to Bertsekas, p. 67.
%
% Input:
%   P           Cost matrix P where the element p_ij, is the
%               cost to move from node i to node j
%   startNode   start node of the desired shortest path, can have values
%               from 1 to M
%   termNode    terminal node of the desired shortest path, can have values
%               from 1 to M
%
% Output:
%   optCost     Cost of the shortest path(s), scalar.
%   optPath     Row vector holding the nodes that correspond to a shortest 
%               path, i.e. a path that has the optimal cost optCost.
%               For example, optPath = [88 55 33 1 76] corresponds to the 
%               shortest path 88->55->33->1->76, where 88 is the starting
%               and 76 is the terminal node.
%
% 
% Class:
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
% [16.11.09, ST]    speed up code
% [30.10.11 NH]     code review + new problem
% [23.10.12 NH]     new problem
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Solution by: (PLEASE ENTER YOUR NAMES HERE)
%   Nico Huebel
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%% Put your code here.


%% Results:
% To be adapted.
optPath = [0 0 0];
optCost = NaN;