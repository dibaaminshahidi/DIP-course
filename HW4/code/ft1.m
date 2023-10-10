clc;
clear all;

i1 = imread('F1.bmp')
i2 = imread('F2.bmp')

f1=fftshift(fft2(im2double(i1)));
f2=fftshift(fft2(im2double(i2)));
if1=ifft2(fftshift(f1));
if2=ifft2(fftshift(f2));
figure,
subplot(2,2,1);
imshow(f1)
title('Fourier transform');
subplot(2,2,2);
imshow(if1)
title('Inverse fourier transform ');
subplot(2,2,3);
imshow(f2)
title('Fourier transform');
subplot(2,2,4);
imshow(if2)
title('Inverse fourier transform');

