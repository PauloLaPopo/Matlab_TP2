function [Q1_1, Q1_2, Q1_4, Q2, Q4, Q5] = glidingGLCM(window, grayscale, d, theta, windowSize, iso)
% Calculate the GLCM for every glading window in an image 

[MOriginal, NOriginal] = size(window); % Original image size
HalfSize = floor(windowSize/2); % Size of half the filter

% Apply the zero-padding to the original image
padded = zeros(MOriginal + windowSize - 1, NOriginal + windowSize - 1);
padded(HalfSize:end - HalfSize - 1, HalfSize:end - HalfSize - 1) = window;

[M, N] = size(padded); % Padded image size

% Buffers for resulting images
Q1_1 = zeros(MOriginal, NOriginal);
Q1_2 = zeros(MOriginal, NOriginal);
Q1_4 = zeros(MOriginal, NOriginal);
Q2 = zeros(MOriginal, NOriginal);
Q4 = zeros(MOriginal, NOriginal);
Q5 = zeros(MOriginal, NOriginal);

% Go through the image
for m = (HalfSize + 1):(M - HalfSize - 1)
    for n = (HalfSize + 1):(N - HalfSize - 1)
        
        % Extracting the window
        window = padded(m - HalfSize:m + HalfSize, ...
            n - HalfSize:n + HalfSize);
        
        % Calculating the GLCM
        if iso == 1
            p = isoGLCM(window, grayscale, d);
        else
            p = GLCM(window, grayscale, d, theta);
        end
   
        % Calculating the features
        Q1_1(m - HalfSize, n - HalfSize) = sum(sum(p(1:4, 1:4)))/sum(sum(p(1:8, 1:8)));
        Q1_2(m - HalfSize, n - HalfSize) = sum(sum(p(1:4, 5:8)))/sum(sum(p(1:8, 1:8)));
        Q1_4(m - HalfSize, n - HalfSize) = sum(sum(p(5:8, 5:8)))/sum(sum(p(1:8, 1:8)));
        Q2(m - HalfSize, n - HalfSize) = sum(sum(p(1:8, 1:8)))/sum(sum(p));
        Q4(m - HalfSize, n - HalfSize) = sum(sum(p(1:8, 9:16)))/sum(sum(p));
        Q5(m - HalfSize, n - HalfSize) = sum(sum(p(9:16, 9:16)))/sum(sum(p));
        
    end
end
end