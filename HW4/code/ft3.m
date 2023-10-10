clc;
clear all;

im = repmat(sin(linspace(0,pi,16)),[1024, 64]);
img = imcrop(im,[256,256,512,512]);
ft = fftshift(fft2(img));

img20 = imcrop(imrotate(im,20,'bilinear','crop'),[256,256,512,512]);
ft20 = fftshift(fft2(img20));

img45 = imcrop(imrotate(im,45,'bilinear','crop'),[256,256,512,512]);
ft45 = fftshift(fft2(img45));

img90 = imcrop(imrotate(im,90,'bilinear','crop'),[256,256,512,512]);
ft90 = fftshift(fft2(img90));

img135 = imcrop(imrotate(im,135,'bilinear','crop'),[256,256,512,512]);
ft135 = fftshift(fft2(img135));

figure,
imshow(img),title('0 degree')

figure,
subplot(2,1,1);
imshow(log(1+abs(ft))),title('0 degree-fft magnitude')
subplot(2,1,2);
imshow(angle(ft)),title('0 degree-fft phase')

figure,
imshow(img20),title('20 degree')
figure,
subplot(2,1,1);
imshow(log(1+abs(ft20))),title('20 degree-fft magnitude')
subplot(2,1,2);
imshow(angle(ft20)),title('20 degree-fft phase')


figure,
imshow(img45),title('45 degree')
figure,
subplot(2,1,1);
imshow(log(1+abs(ft45))),title('45 degree-fft magnitude')
subplot(2,1,2);
imshow(angle(ft45)),title('45 degree-fft phase')


figure,
imshow(img90),title('90 degree')
figure,
subplot(2,1,1);
imshow(log(1+abs(ft90))),title('90 degree-fft magnitude')
subplot(2,1,2);
imshow(angle(ft90)),title('90 degree-fft phase')

figure,
imshow(img135),title('135 degree')
figure,
subplot(2,1,1);
imshow(log(1+abs(ft135))),title('135 degree-fft magnitude')
subplot(2,1,2);
imshow(angle(ft135)),title('135 degree-fft phase')



