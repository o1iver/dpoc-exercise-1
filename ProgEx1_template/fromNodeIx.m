function [ x,y ] = fromNodeIx(T,ix)
%TONODEIX Returns node id for given terrain.
% Inputs:
% - T: terrain matrix
% - x: x position
% - y: y position

% smallT = T(2:end-1,2:end-1);
smallT = T;
heightSmallT = size(smallT,1);
widthSmallT  = size(smallT,2);

sY = mod(ix,widthSmallT);
if sY == 0; sY = widthSmallT; end;
sX = ((ix-sY)/widthSmallT)+1;

y = sY+1;
x = sX+1;
end

