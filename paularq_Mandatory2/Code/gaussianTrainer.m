function [labels, means, covs] = gaussianTrainer(feats, train_mask)

% Buffers for resulting matrices
labels = unique(train_mask(train_mask > 0));
label_count = numel(labels);
feat_count = numel(feats);
means = zeros(feat_count, label_count);
covs = zeros(feat_count, feat_count, label_count);

% For each label
for i = 1:label_count
    mask = (train_mask == labels(i));
    
    % Calculate means
    means_tmp = zeros(feat_count, 1);
    feats_masked = [];   
    for j=1:feat_count
        masked_img = feats{j}(mask == true); 
        [n, m] = size(masked_img);
        means_tmp(j) = sum(masked_img(:)) / (n*m);
        feats_masked = [feats_masked masked_img];
    end
    means(:, i) = means_tmp;
    
    % Calculate covariances
    covs(:, :, i) = cov(double(feats_masked));
end
end
