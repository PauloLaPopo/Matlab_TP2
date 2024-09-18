function [class] = gaussianClassifier(feats, labels, means, covs)

[N, M] = size(feats{1});
class = zeros(N, M);
feat_count = numel(feats);
class_count = numel(labels);

for n = 1:N
    for m = 1:M
        G_count = zeros(feat_count, 1);
        
        for i = 1:feat_count
            window = feats{i};
            G = double(window(n, m));
            G_count(i) = G;
        end
        
        max_class = 0;
        max_val = 0;
        
        for i = 1:class_count
            cov = covs(:, :, i);
            
            gauss = - (1/2)*(G_count - means(:, i))'*inv(cov)* ...
                (G_count - means(:, i)) - (feat_count/2)*log(2*pi) - ...
                (1/2)*log(det(cov)) + log(1/class_count);
            
            if i == 1 || gauss > max_val
                max_class = labels(i);
                max_val = gauss;
            end
        end
        class(n, m) = max_class;
    end
end
end
