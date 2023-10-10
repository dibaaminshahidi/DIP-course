clc;
clear all,

im = im2double(rgb2gray(imread('F3.jpg')));
ft = fft2(im);
ftm= abs(ft);
ftp = cos(angle(ft)) + 1i*(sin(angle(ft)));
iftm = ifft2(ftm);
iftp = ifft2(ftp);
iftp50 = ifft2(ftp*50);


figure,imshow(iftm)
title('No Phase');%phase zero

figure,imshow(iftp)
title('Magnitude = 1');

figure,imshow(iftp50)
title('Magnitude = 50');

img = im2double(rgb2gray(imread('F4.bmp')));
ft2 = fft2(img);
ftm2= abs(ft2);
ftp2 = cos(angle(ft2)) + 1i*(sin(angle(ft2)));


p3m4 = ifft2(ftm2.*ftp);
p4m3 = ifft2(ftm.*ftp2);
y = angle(ft2)
x=ifft2(ftm.*(1i.*y))

figure,imshow(x),title('Phase F3 and Mag F4');
figure,imshow(p4m3), title('Phase F4 and Mag F3');
