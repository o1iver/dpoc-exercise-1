function [ g ] = costFunc(T,b,t,x_k,x_kp1)
% Inputs:
% - T: terrain matrix
% - t: terminal state
% - x_k: state at k
% - x_kp1: state at k+1

[t_x,t_y]         = fromNodeIx(T,t);
[x_k_x,x_k_y]     = fromNodeIx(T,x_k);
[x_kp1_x,x_kp1_y] = fromNodeIx(T,x_kp1);

if x_k == t
    fprintf('At terminal state...\n');
    g = b;
else
    T(x_kp1_x,x_kp1_y)
    T(x_k_x,x_k_y)
    deltaH = T(x_kp1_x,x_kp1_y) - T(x_k_x,x_k_y)
    fprintf('Going from state %u to state %u (deltaH: %f)...\n', x_k,x_kp1,deltaH);
    g = max(0,T(x_kp1_x,x_kp1_y)-T(x_k_x,x_k_y));
end
    
