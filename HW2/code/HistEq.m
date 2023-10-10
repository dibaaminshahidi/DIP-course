clc;
clear all,
for i=1:1
    st = sprintf('%s%d%s' ,'eye' ,i,'.bmp');
    e = imread(st);
    im = e(: , : ,2);
    ee=im;
    imtemp =zeros(size(im));
    mn = min(min(im));
    mx = max(max(im));
    im= double(im)/double(mx);
    im= double(im)*255;
        mn = min(min(im));
    mx = max(max(im));
    q=mn:((mx-mn)/8):mx;
    pixels=size(im,1)*size(im,2);
    for j=1:8
        s(j)=sum(sum(im>=q(j) & im<q(j+1)));
        norm(j)=double(s(j)/pixels);
    end
    p(1)=norm(1);
    c(1)=round(p(1)*7);
    for j=2:8
        p(j)=norm(j)+p(j-1)
        c(j)=round(p(j)*7);
    end
    for j=1:8
        eq(j)=0;
        for k=1:8
            if(c(k)==j)
               eq(j)=eq(j)+norm(k);
                imtemp(find( im>=q(j) & im<q(j+1)))= q(k)
            end
        end
        eq(j) = round(eq(j)*8)
    end

 figure,imshow(uint8(im));
    figure,imshow(uint8(imtemp));
    %gstres = sprintf('%s%d%s%d%s' ,'greenRes1_' ,i,'_',v,'.bmp');
    %imwrite(uint8(imtemp),gstres);
    res = e;
    res(: , : ,2) = uint8(imtemp);
    figure,imshow(res);
        figure,imshow(uint8(imtemp-im));
    %rgbstres = sprintf('%s%d%s%d%s' ,'rgbRes1_' ,i,'_',v,'.bmp');
    %imwrite(res,rgbstres);
end