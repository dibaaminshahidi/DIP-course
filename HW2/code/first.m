clc;
clear all,
for i=1:8
    st = sprintf('%s%d%s' ,'eye' ,i,'.bmp');
    e = imread(st);
    im = e(: , : ,2);
    mn = min(min(im));
    mx = max(max(im));
    im= double(im)/double(mx);
    im= double(im)*255;
    for v = 0.8:+0.05:1;
        imtemp = im.^(v)
        %figure,imshow(uint8(imtemp));
        gstres = sprintf('%d%s%d%s' ,i,'_1greenRes1_' ,v,'.bmp');
        imwrite(uint8(imtemp),gstres);
        res = e;
        res(: , : ,2) = uint8(imtemp);
        %figure,imshow(res);
        rgbstres = sprintf('%d%s%d%s',i ,'_1rgbRes_',v,'.bmp');
        imwrite(res,rgbstres);
        
    end
end