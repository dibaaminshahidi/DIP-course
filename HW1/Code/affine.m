clear;
clc;


A = imread("room.jpg");
% A = rgb2gray(A);
Aa = [1 0 0; 0 1 0; 402.5 180.2 1]; % translation
Ab = [1.2 0 0; 0 0.85 0; 0 0 1]; % scale
Ac = [cosd(30) sind(30) 0; -sind(30) cosd(30) 0; 0 0 1]; % rotate
Ad = [1 0 0; 1.25 1 0; 0 0 1]; % shear vertical
Ae = [1 1.5 0; 0 1 0; 0 0 1]; % shear horizontal
Af = [-0.1 0 0; 0 1 0; 0 0 1]; % f

% change this to desired transofrm matrix
mm = Aa * Ab * Ac;

tform = affine2d(mm);
b = imwarp(A,tform);

c = myaffine(A,mm, "bl"); % implemented function
c = uint8(c);

d = myaffine(A,mm, "nn"); % implemented function
d = uint8(d);

subplot(1,3,1);
imshow(c);
subplot(1,3,2);
imshow(d);
subplot(1,3,3);
imshow(b);

% imshow(c);
% imshow(b);