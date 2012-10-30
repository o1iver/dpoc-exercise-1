function [ n ] = numNodes(T)
%NUMNODEX Summary of this function goes here
%   Detailed explanation goes here

height = size(T,1);
width  = size(T,2);

n = (height-2)*(width-2);

end

