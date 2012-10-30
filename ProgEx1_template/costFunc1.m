function [ g ] = costFunc1(T,t,x_k,x_kp1)
% Inputs:
% - T: terrain matrix
% - t: terminal state
% - x_k: state at k
% - x_kp1: state at k+1
if x_k == t
    g = 0;
else
    g = max(0,T(x_k)

end

