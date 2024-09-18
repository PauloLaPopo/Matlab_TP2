close all;

% Choosing GLCM images to work with

texture1_90 = load('texture1dx0dymin1.txt');
texture2_90 = load('texture2dx0dymin1.txt');
texture3_90 = load('texture3dx0dymin1.txt');
texture4_90 = load('texture4dx0dymin1.txt');

figure(1)
subplot(221); imagesc(texture1_90); title('Texture 1');
subplot(222); imagesc(texture2_90); title('Texture 2');
subplot(223); imagesc(texture3_90); title('Texture 3');
subplot(224); imagesc(texture4_90); title('Texture 4');

texture1_0 = load('texture1dx1dy0.txt');
texture2_0 = load('texture2dx1dy0.txt');
texture3_0 = load('texture3dx1dy0.txt');
texture4_0 = load('texture4dx1dy0.txt');

figure(2)
subplot(221); imagesc(texture1_0); title('Texture 1');
subplot(222); imagesc(texture2_0); title('Texture 2');
subplot(223); imagesc(texture3_0); title('Texture 3');
subplot(224); imagesc(texture4_0); title('Texture 4');

texture1_45 = load('texture1dx1dymin1.txt');
texture2_45 = load('texture2dx1dymin1.txt');
texture3_45 = load('texture3dx1dymin1.txt');
texture4_45 = load('texture4dx1dymin1.txt');

figure(3)
subplot(221); imagesc(texture1_45); title('Texture 1');
subplot(222); imagesc(texture2_45); title('Texture 2');
subplot(223); imagesc(texture3_45); title('Texture 3');
subplot(224); imagesc(texture4_45); title('Texture 4');

texture1_135 = load('texture1dxmin1dymin1.txt');
texture2_135 = load('texture2dxmin1dymin1.txt');
texture3_135 = load('texture3dxmin1dymin1.txt');
texture4_135 = load('texture4dxmin1dymin1.txt');

figure(4)
subplot(221); imagesc(texture1_135); title('Texture 1');
subplot(222); imagesc(texture2_135); title('Texture 2');
subplot(223); imagesc(texture3_135); title('Texture 3');
subplot(224); imagesc(texture4_135); title('Texture 4');


% Discussing new features by subdividing the GLCM matrices

% Quadrant 1.1
t1_90_q11 = texture1_90(1:4, 1:4);
t2_90_q11 = texture2_90(1:4, 1:4);
t3_90_q11 = texture3_90(1:4, 1:4);
t4_90_q11 = texture4_90(1:4, 1:4);

% Quadrant 1.2
t1_90_q12 = texture1_90(1:4, 5:8);
t2_90_q12 = texture2_90(1:4, 5:8);
t3_90_q12 = texture3_90(1:4, 5:8);
t4_90_q12 = texture4_90(1:4, 5:8);

% Quadrant 1.4
t1_90_q14 = texture1_90(5:8, 5:8);
t2_90_q14 = texture2_90(5:8, 5:8);
t3_90_q14 = texture3_90(5:8, 5:8);
t4_90_q14 = texture4_90(5:8, 5:8);

% Quadrant 2

t1_90_q2 = texture1_90(1:8, 1:8);
t2_90_q2 = texture2_90(1:8, 1:8);
t3_90_q2 = texture3_90(1:8, 1:8);
t4_90_q2 = texture4_90(1:8, 1:8);

% Quadrant 4

t1_90_q4 = texture1_90(1:8, 9:16);
t2_90_q4 = texture2_90(1:8, 9:16);
t3_90_q4 = texture3_90(1:8, 9:16);
t4_90_q4 = texture4_90(1:8, 9:16);

% Quadrant 5
t1_90_q5 = texture1_90(9:16, 9:16);
t2_90_q5 = texture2_90(9:16, 9:16);
t3_90_q5 = texture3_90(9:16, 9:16);
t4_90_q5 = texture4_90(9:16, 9:16);

figure(5)
subplot(161); imagesc(t1_90_q11); title('Q1.1'); axis('square'); 
subplot(162); imagesc(t1_90_q12); title('Q1.2'); axis('square'); 
subplot(163); imagesc(t1_90_q14); title('Q1.4'); axis('square'); 
subplot(164); imagesc(t1_90_q2); title('Q2'); axis('square'); 
subplot(165); imagesc(t1_90_q4); title('Q4'); axis('square'); 
subplot(166); imagesc(t1_90_q5); title('Q5'); axis('square'); 

figure(6)
subplot(161); imagesc(t2_90_q11); title('Q1.1'); axis('square'); 
subplot(162); imagesc(t2_90_q12); title('Q1.2'); axis('square'); 
subplot(163); imagesc(t2_90_q14); title('Q1.4'); axis('square'); 
subplot(164); imagesc(t2_90_q2); title('Q2'); axis('square'); 
subplot(165); imagesc(t2_90_q4); title('Q4'); axis('square'); 
subplot(166); imagesc(t2_90_q5); title('Q5'); axis('square'); 

figure(7)
subplot(161); imagesc(t3_90_q11); title('Q1.1'); axis('square'); 
subplot(162); imagesc(t3_90_q12); title('Q1.2'); axis('square'); 
subplot(163); imagesc(t3_90_q14); title('Q1.4'); axis('square'); 
subplot(164); imagesc(t3_90_q2); title('Q2'); axis('square'); 
subplot(165); imagesc(t3_90_q4); title('Q4'); axis('square'); 
subplot(166); imagesc(t3_90_q5); title('Q5'); axis('square'); 

figure(8)
subplot(161); imagesc(t4_90_q11); title('Q1.1'); axis('square'); 
subplot(162); imagesc(t4_90_q12); title('Q1.2'); axis('square'); 
subplot(163); imagesc(t4_90_q14); title('Q1.4'); axis('square'); 
subplot(164); imagesc(t4_90_q2); title('Q2'); axis('square'); 
subplot(165); imagesc(t4_90_q4); title('Q4'); axis('square'); 
subplot(166); imagesc(t4_90_q5); title('Q5'); axis('square'); 

% Selecting and implementing a subset of these features

train_img = load('mosaic1_train.txt');

% Quantizing to G gray levels
G = 16; 
train_img = uint8(round(double(train_img)*(G - 1)/double(max(train_img(:)))));

% Getting the feature images
windowSize = 31;
[Q1_1, Q1_2, Q1_4, Q2, Q4, Q5] = glidingGLCM(train_img, G, 1, 0, windowSize, 0);
[K1_1, K1_2, K1_4, K2, K4, K5] = glidingGLCM(train_img, G, 1, 90, windowSize, 0);

figure(9)
subplot(161); imagesc(Q1_1); title('Q1.1'); axis('square'); 
subplot(162); imagesc(Q1_2); title('Q1.2'); axis('square'); 
subplot(163); imagesc(Q1_4); title('Q1.4'); axis('square'); 
subplot(164); imagesc(Q2); title('Q2'); axis('square'); 
subplot(165); imagesc(Q4); title('Q4'); axis('square'); 
subplot(166); imagesc(Q5); title('Q5'); axis('square'); 
%suptitle('0 degree angle');

figure(10)
subplot(161); imagesc(K1_1); title('Q1.1'); axis('square'); 
subplot(162); imagesc(K1_2); title('Q1.2'); axis('square'); 
subplot(163); imagesc(K1_4); title('Q1.4'); axis('square'); 
subplot(164); imagesc(K2); title('Q2'); axis('square'); 
subplot(165); imagesc(K4); title('Q4'); axis('square'); 
subplot(166); imagesc(K5); title('Q5'); axis('square'); 
%suptitle('90 degree angle');


% Training the classifier based on the feature subset from point 3

train_img = load('mosaic1_train.txt');

% Quantizing to G gray levels
G = 16;
train_img = uint8(round(double(train_img)*(G - 1)/double(max(train_img(:)))));

windowSize = 31;
[Q1_1, Q1_2, Q1_4, Q2, Q4, Q5] = glidingGLCM(train_img, G, 1, 0, windowSize, 0);
[K1_1, K1_2, K1_4, K2, K4, K5] = glidingGLCM(train_img, G, 1, 90, windowSize, 0);


feats = {Q1_2, K1_4, Q2, K2};

% Using gaussianTrainer
train_mask = load('training_mask.txt');
[labels, means, covs] = gaussianTrainer(feats, train_mask);

% Using gaussianClassifier
[class] = gaussianClassifier(feats, labels, means, covs);

% Using gaussianEvaluator
[acc, avg_acc, conf] = gaussianEvaluator(class, 4)

figure(11)
imagesc(class); colorbar; title('Result on training image'); axis('square'); 

test_img1 = load('mosaic2_test.txt');
test_img2 = load('mosaic3_test.txt');

G = 16; 
test_img1 = uint8(round(double(test_img1)*(G - 1)/double(max(test_img1(:)))));
test_img2 = uint8(round(double(test_img2)*(G - 1)/double(max(test_img2(:)))));

windowSize = 31;
[Q1_1, Q1_2, Q1_4, Q2, Q4] = glidingGLCM(test_img1, G, 1, 0, windowSize, 0);
[K1_1, K1_2, K1_4, K2, K4] = glidingGLCM(test_img1, G, 1, 90, windowSize, 0);
feats1 = {Q1_2, K1_4, Q2, K2};

[Q1_1, Q1_2, Q1_4, Q2, Q4] = glidingGLCM(test_img2, G, 1, 0, windowSize, 0);
[K1_1, K1_2, K1_4, K2, K4] = glidingGLCM(test_img2, G, 1, 90, windowSize, 0);
feats2 = {Q1_2, K1_4, Q2, K2};

% Using gaussianClassifier
[class1] = gaussianClassifier(feats1, labels, means, covs);
[class2] = gaussianClassifier(feats2, labels, means, covs);

% Using gaussianEvaluator
[acc1, avg_acc1, conf1] = gaussianEvaluator(class1, 4)
[acc2, avg_acc2, conf2] = gaussianEvaluator(class2, 4)

figure(12)
imagesc(class1); colorbar; title('Result on test image 1'); axis('square'); 
figure(13)
imagesc(class2); colorbar; title('Result on test image 2'); axis('square'); 


% Evaluation of classification performance on the test data set using the set of features
% selected in point 3

train_img = load('mosaic1_train.txt');
test_img1 = load('mosaic2_test.txt');
test_img2 = load('mosaic3_test.txt');

G = 16;
train_img = uint8(round(double(train_img)*(G - 1)/double(max(train_img(:)))));
test_img1 = uint8(round(double(test_img1)*(G - 1)/double(max(test_img1(:)))));
test_img2 = uint8(round(double(test_img2)*(G - 1)/double(max(test_img2(:)))));

windowSize = 31;
[Q1_1, Q1_2, Q1_4, Q2, Q4, Q5] = glidingGLCM(train_img, G, 1, 0, windowSize, 0);
[K1_1, K1_2, K1_4, K2, K4, K5] = glidingGLCM(train_img, G, 1, 90, windowSize, 0);
feats = {Q1_2, K1_4, Q2, K2};

[Q1_1, Q1_2, Q1_4, Q2, Q4, Q5] = glidingGLCM(test_img1, G, 1, 0, windowSize, 0);
[K1_1, K1_2, K1_4, K2, K4, K5] = glidingGLCM(test_img1, G, 1, 90, windowSize, 0);
feats1 = {Q1_2, K1_4, Q2, K2};

[Q1_1, Q1_2, Q1_4, Q2, Q4, Q5] = glidingGLCM(test_img2, G, 1, 0, windowSize, 0);
[K1_1, K1_2, K1_4, K2, K4, K5] = glidingGLCM(test_img2, G, 1, 90, windowSize, 0);
feats2 = {Q1_2, K1_4, Q2, K2};

% Using gaussiantTrainer
train_mask2 = load('mask_mosaic2_test.mat');
train_mask2 = cell2mat(struct2cell(train_mask2));
train_mask3 = load('mask_mosaic3_test.mat');
train_mask3 = cell2mat(struct2cell(train_mask3));
[labels2, means2, covs2] = gaussianTrainer(feats, train_mask2);
[labels3, means3, covs3] = gaussianTrainer(feats, train_mask3);

% Using gaussianClassifier
[class1] = gaussianClassifier(feats, labels2, means2, covs2);
[class2] = gaussianClassifier(feats, labels3, means3, covs3);

% Using gaussianEvaluator
[acc1, avg_acc1, conf1] = gaussianEvaluator(class1, 4)
[acc2, avg_acc2, conf2] = gaussianEvaluator(class2, 4)

figure(14)
imagesc(class1); colorbar; title('Result on test image 1'); axis('square'); 
figure(15)
imagesc(class2); colorbar; title('Result on test image 2'); axis('square'); 