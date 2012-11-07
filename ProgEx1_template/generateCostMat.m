
function P=generateCostMat(T,b)
% P=generateCostMat(T,b)
% 
% Function to create the cost matrix P that is required by the algorithms from the terrain matrix T
%
% Input:
%   T   		terrain matrix T that contains the height of the grid cells of the terrain
%   b    		lower bound on the cost function, i.e. 0 for part I and 1 for part II
%
% Output:
%   P           Cost matrix P where the element p_ij, is the
%               cost to move from node i to node j
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
% [23.10.12 NH]     first vresion
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Solution by: (PLEASE ENTER YOUR NAMES HERE)
%   Nico Huebel
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%% Put your code here.


%% Results:
% To be adapted.
[m,n] = size(T);
totNodes = (m-2)*(n-2); % Since first and last rows/columns are inf ignore them
P = zeros(totNodes);
for source=1:totNodes
    for sink=1:totNodes
        cost = costFunc(T,b,source,sink);
        fprintf('Cost from state %u to state %u is: %f\n',source,sink,cost);
    	P(source,sink) = cost;
    end
end


	