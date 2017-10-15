function seg = GaborTextureSegment(I, K, gamma, Lambda, b, Theta, phi, shape)
[nRow, nCol, C] = size(I);
% Step 1. Gabor Filter bank
i = 0;
for lambda = Lambda
    for theta = Theta
        i = i + 1;
        D = gabor2(I, gamma, lambda, b, theta, phi, shape);
        % Normalize into [0, 1]
        D = D - min(reshape(D, [], 1)); D = D / max(reshape(D, [], 1));
        % D is output of each filter
        %figure; imshow(uint8(D * 255));
        
        if (isequal(shape, 'valid') && i >= 2)
            [nRow, nCol, C] = size(O(:, :, i-1));
            [Nr, Nc, C] = size(D);
            DNr = (Nr - nRow)/2;
            DNc = (Nc - nCol)/2;
            D = D(1+floor(DNr):Nr-ceil(DNr), 1+floor(DNc):Nc-ceil(DNc));
        end
        O(:, :, i) = D;
    end
end

[nRow, nCol, N] = size(O);

% Step 2. Energy (Feature Extraction)
  % Step 2-1. Nonlinearity
for i=1:N
    D = O(:, :, i);
    alpha = 1;
    D = tanh(double(O(:, :, i)) .* alpha); % Eq. (3). Input is [0, 1]
    % Normalize into [0, 1] 
    D = D - min(reshape(D, [], 1)); D = D / max(reshape(D, [], 1));
    % figure; imshow(uint8(D * 255));pause
    O(:, :, i) = D;
end
  % Step 2-2. Smoothing
for i=1:N
    D = O(:, :, i);
    lambda = Lambda(floor((i-1)/length(Theta))+1);
    sigma = (1 / pi) * sqrt(log(2)/2) * (2^b+1) / (2^b-1) * lambda;
    sigma = 3 * sigma;
    D = gauss2(D, sigma, shape); % Instead of Eq, (4) Avg filter
    % Normalize into [0, 1]
    D = D - min(reshape(D, [], 1)); D = D / max(reshape(D, [], 1));
    % figure; imshow(uint8(D * 255));pause
    if (isequal(shape, 'valid') && i >= 2)
        [nRow, nCol, C] = size(P(:, :, i-1));
        [Nr, Nc, C] = size(D);
        DNr = (Nr - nRow)/2;
        DNc = (Nc - nCol)/2;
        D = D(1+floor(DNr):Nr-ceil(DNr), 1+floor(DNc):Nc-ceil(DNc));
    end
    P(:, :, i) = D;
end

O = P; clear P;
[nRow, nCol, N] = size(O);

% Step 3. Clustering
   % Step 3-1. Adding coordinates information to involves adjacency
for i=1:nRow
    for j=1:nCol
        O(i, j, N+1) = i / nRow; % [0, 1]
        O(i, j, N+2) = j / nCol;
    end
end

% Step 3-2. Clustering
data = reshape(O, [], size(O, 3));
[cluster, codebook] = kmeans_light(data, K);
seg = reshape(cluster, nRow, nCol, 1);
end