clc;
clear all, 
im = imread('face.jpg');
gray = rgb2gray(im);
medi= medfilt2(gray,[10,10]);
temp = gray - medi;
unshmed = gray + temp;
imwrite(unshmed,'median50.jpg');