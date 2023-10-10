clc;
clear all;

im1 = imread('F1.bmp')
im2 = imread('F2.bmp')

f1=fftshift(fft2(im2double(im1)));
f2=fftshift(fft2(im2double(im2))); 

i1 = im1+50
i2 = im2+50


% i1 = im1-50
% i2 = im2-50


% i1 = im1*2
% i2 = im2*2


fs1=fftshift(fft2(im2double(i1)));
fs2=fftshift(fft2(im2double(i2)));


figure,
subplot(2,2,1);
imshow(im1);
title('Orginal');
subplot(2,2,2);
imshow(i1)
title('Changed');
subplot(2,2,3);
imshow(f1)
title('Orginal Fourier transform');
subplot(2,2,4);
imshow(fs1)
title('Changed Fourier transform');

figure,
subplot(2,2,1);
imshow(im2);
title('Orginal');
subplot(2,2,2);
imshow(i2)
title('Changed');
subplot(2,2,3);
imshow(f2)
title('Orginal Fourier transform');
subplot(2,2,4);
imshow(fs2)
title('Changed Fourier transform');




