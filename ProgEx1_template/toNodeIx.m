function [ ix ] = toNodeIx(T,x,y)
%TONODEIX Returns node id for given terrain.
% Inputs:
% - T: terrain matrix
% - x: x position
% - y: y position

smallT = T(2:end-1,2:end-1);
widthSmallT  = size(smallT,2);

sX = x-1;
sY = y-1;
ix = widthSmallT*(sX-1)+sY;
end

