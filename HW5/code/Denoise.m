clc,
clear all;

im = imread('tree.jpg');
g_noise = imnoise(im,'gaussian');
sp_noise = imnoise(im,'salt & pepper');

[thrg,sorhg,keepappg] = ddencmp('den','wv',g_noise);
g_denoise = wdencmp('gbl',g_noise,'sym4',2,thrg,sorhg,keepappg);

[thrsp,sorhsp,keepappsp] = ddencmp('den','wv',sp_noise);
sp_denoise = wdencmp('gbl',g_noise,'sym4',2,thrsp,sorhsp,keepappsp);

figure, 
subplot(3,1,1);
imshow(im);
subplot(3,1,2);
imshow(g_noise);
subplot(3,1,3);
imshow(uint8(g_denoise));


[peaksnrg, snrg] = psnr(uint8(g_denoise), im);
[ssimvalg,ssimmapg] = ssim(uint8(g_denoise), im);
fprintf('\n The PSNR value guassian is %0.4f', peaksnrg);
fprintf('\n The SSIM value guassian is %0.4f', ssimvalg);

figure, 
subplot(3,1,1);
imshow(im);
subplot(3,1,2);
imshow(sp_noise);
subplot(3,1,3);
imshow(uint8(sp_denoise));

[peaksnrsp, snrsp] = psnr(uint8(sp_denoise), im);
[ssimvalsp,ssimmapsp] = ssim(uint8(sp_denoise), im);
fprintf('\n The PSNR value for salt and pepper is %0.4f', peaksnrsp);
fprintf('\n The SSIM value salt and pepper is %0.4f', ssimvalsp);
