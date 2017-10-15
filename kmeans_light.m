function [dataCluster codebook] = kmeans_light(data, K)

[N dim] = size(data);
stopIter = .05;
% Initial codebook
codebook = data(randsample(N, K), :);
improvedRatio = Inf;
distortion = Inf;
iter = 0;
while true
    % Calculate euclidean distances between each sample and each codeword
    d = eucdist2(data, codebook);
    % Assign each sample to the nearest codeword (centroid)
    [dataNearClusterDist, dataCluster] = min(d, [], 2);
    % distortion. If centroids are unchanged, distortion is also unchanged.
    old_distortion = distortion;
    distortion = mean(dataNearClusterDist);
    improvedRatio = 1 - (distortion / old_distortion);
    fprintf('%d: improved ratio = %f\n', iter, improvedRatio);
    iter = iter + 1;
    if improvedRatio <= stopIter
        break;
    end;
    % Renew codebook

    for i=1:K
        % Get the id of samples which were clusterd into cluster i.
        idx = dataCluster == i;
        % Calculate centroid of each cluter, and replace codebook
        codebook(i, :) = mean(data(idx, :));
    end
end
end

function d=eucdist2(X,Y)
    U=~isnan(Y); Y(~U)=0;
    V=~isnan(X); X(~V)=0;
    d=abs(X.^2*U'+V*Y'.^2-2*X*Y');
end