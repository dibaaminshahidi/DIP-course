clc;
clear all, 
im = imread('face.jpg');
gray = rgb2gray(im);
gaus= imgaussfilt(gray,1)
temp = gray - gaus;
unshgaus = gray + temp;
imwrite(unshgaus,'Guassian.jpg');