function [ x,y ] = fromNodeIx(T,ix)
%TONODEIX Returns node id for given terrain.
% Inputs:
% - T: terrain matrix
% - x: x position
% - y: y position

T = T(2:end-1,2:end-1);
width = size(T,2);

rest = mod(ix,width);
div  = (ix-rest)/width;

y = rest;
x = div+1;
if rest == 0
    y = width;
    x = div;
end

x = x + 1;
y = y + 1;

end

