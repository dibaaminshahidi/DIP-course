clc;
clear all,

im(1:16,1:16) = 1;
im = padarray(im,[120,120],0,'both');
ft384 = fftshift(fft2(padarray(im,[64,64],0,'both')));
ft512 = fftshift(fft2(padarray(im,[128,128],0,'both')));
ft600 = fftshift(fft2(padarray(im,[172,172],0,'both')));

figure,imshow(im);

figure,imshow(fftshift(fft2(im))),title('Org');
figure,
imshow(ft384),title('384');
figure,
imshow(ft512),title('512');
figure,
imshow(ft600),title('600');

