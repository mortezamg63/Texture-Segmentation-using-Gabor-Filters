function [GO, GF] = gauss2(I, sigma, shape)
if nargin < 4, shape = 'same';end;
if isa(I,'double') ~= 1
I = double(I);
end
for x = -fix(sigma):fix(sigma)
    for y = -fix(sigma):fix(sigma)
        % GF is gaussian Filter
        GF(fix(sigma)+x+1,fix(sigma)+y+1) = exp(-.5*((x/sigma)^2+(y/sigma)^2));
    end
end

GO = conv2(I,double(GF), shape);

end