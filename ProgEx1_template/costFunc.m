function [ g ] = costFunc(T,b,x_k,x_kp1)
% Inputs:
% - T: terrain matrix
% - t: terminal state
% - x_k: state at k
% - x_kp1: state at k+1

[x_k_x,x_k_y]     = fromNodeIx(T,x_k);
[x_kp1_x,x_kp1_y] = fromNodeIx(T,x_kp1);

deltaH = T(x_kp1_x,x_kp1_y) - T(x_k_x,x_k_y);
fprintf('Going from state %u to state %u (deltaH: %f)...\n', x_k,x_kp1,deltaH);
g = max(b,T(x_kp1_x,x_kp1_y)-T(x_k_x,x_k_y));
    
