clc,
clear all;

im = imread('test.jpg');
im = imresize(im,[128,128]);

for i=1:5
    img = imread([num2str(i),'.jpg']);
    img = imresize(img,[128,128]);
    [ssimval,ssimmap] = ssim((im), img);
    fprintf('\n The SSIM value %d is %0.4f',i, ssimval);
end