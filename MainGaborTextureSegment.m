function MainGaborTextureSegment()
imfile = '2.jpg';
I = imread(imfile); 
K = 5; % number of cluster

[Nr, Nc, D] = size(I);
gamma = 1; b = 1; Theta = 0:pi/6:pi-pi/6; phi = 0; shape = 'valid';
% ----------------------------
J = (2.^(0:log2(Nc/8)) - .5) ./ Nc;
F = [ (.25 - J) (.25 + J) ]; F = sort(F); Lambda = 1 ./ F;
% ----------------------------
seg = GaborTextureSegment(I, K, gamma, Lambda, b, Theta, phi, shape);
% ----------------------------
[nRow, nCol] = size(seg);
color=rand(K,3); % K colors created

imseg = zeros(nRow*nCol, 3);
for i=1:K
idx = find(seg == i);
imseg(idx, :) = repmat(color(i, :), [], length(idx));
end
imseg = reshape(imseg, nRow, nCol, 3);
figure; imshow(imseg);

end