close all;
clear all;
clc
for pic=1:8
    st = sprintf('%s%d%s' ,'eye' ,pic,'.bmp');
    e = imread(st);
    im = e(: , : ,2);
numofpixels=size(im,1)*size(im,2);
temp=uint8(zeros(size(im,1),size(im,2)));
freq=zeros(256,1);
probf=zeros(256,1);
probc=zeros(256,1);
cum=zeros(256,1);
output=zeros(256,1);
n=1:256;
for i=1:size(im,1)
    for j=1:size(im,2)
        value=im(i,j);
        freq(value+1)=freq(value+1)+1;
        probf(value+1)=freq(value+1)/numofpixels;
    end
end
sum=0;
ns=255;
for i=1:size(probf)
   sum=sum+freq(i);
   cum(i)=sum;
   probc(i)=cum(i)/numofpixels;
   output(i)=round(probc(i)*ns);
end
for i=1:size(im,1)
    for j=1:size(im,2)
            temp(i,j)=output(im(i,j)+1);
    end
end
   gstres = sprintf('%d%s%s' ,pic,'_2greenRes' ,'.bmp');
    imwrite(uint8(temp),gstres);
    res = e;
    res(: , : ,2) = uint8(temp);
    rgbstres = sprintf('%d%s%s' ,pic,'_2rgbRes' ,'.bmp');
    imwrite(res,rgbstres);
end