clc;
clear all,

mn = zeros(9);
for j=1:9
    img = imread(['im',num2str(j),'.jpg']);
    im = rgb2gray(img);
    [x,y]=size(im);
    if x>1000 && y>1000
        im = imresize(im, 0.3);
    end
    [x,y]=size(im);
    sizex = floor(x/120);
    sizey = floor(y/120);
    %filter size
    medi= medfilt2(im,[sizex,sizey]);
    %salt and pepper
    sharp = imsharpen(medi);
    blur= imgaussfilt(sharp,1);
    rotcrop = blur;
    cormn = mean(mean(blur(1:10,1:10)))
        if(cormn<60)
            %if rotate needed
            c = corner(blur, 'Harris')
            minx=0;
            miny=0;
            minCor = min(c)
            for i=1:size(c,1)-1
                if(c(i,1)==minCor(1,1))
                     minx=c(i,:)
                end
                if(c(i,2)==minCor(1,2))
                miny=c(i,:)
                end
            end
        x1 = minx(1);
        y1 = minx(2);
        x2 = miny(1);
        y2 = miny(2);
        slope = (y2 - y1) ./ (x2 - x1)
        rot = imrotate(blur,atand(slope),'bicubic','crop');
        rot = imclearborder(rot,8);
        C = corner(rot);
        myMin = min(C);
        myMax = max(C);
        rotcrop = (rot(myMin(1,2)+15:myMax(1,2)-15,myMin(1,1)+25:myMax(1,1)-25))
        end
        %crop border
        [x,y]=size(rotcrop);
        sample = rotcrop(floor(x/2)-50:floor(x/2)+50,floor(y/2)-50:floor(y/2)+50);
        minsamp = min(min(sample));
        meansamp = mean(mean(sample));
        %find the pen color
        for a=1:x
            for b=1:y
                if(rotcrop(a,b)<minsamp+70 && rotcrop(a,b)>minsamp-20)
                    rotcrop(a,b) = 0;
                else
                     rotcrop(a,b) = 255;
                end
            end
        end
%       threshold

        sizex = floor(x/100);
        sizey = floor(y/100);
        rotcrop= medfilt2(rotcrop,[sizex,sizey]);
        rotcrop = imsharpen(rotcrop);
        rotcrop= medfilt2(rotcrop,[sizex,sizey]);
        rotcrop = imsharpen(rotcrop);
        rotcrop= medfilt2(rotcrop,[sizex,sizey]);
        rotcrop = imsharpen(rotcrop);
        rotcrop= medfilt2(rotcrop,[sizex,sizey]);
        rotcrop = imsharpen(rotcrop);
        
%       better

        resized = imresize(rotcrop, 0.8);
        [x,y]=size(resized);
        corners = corner(resized);
        corns = zeros(x,y);
        corns = insertMarker(corns,corners,'*','color','red','size',1);
        corns = corns(:,:,1);
        
%         figure,
%         imshow(corns),title('corners');

        lim = 40;
        if (j==7) && (j==2) 
            lim=30
        end
        if (j<=9) && (j>7)
            lim=25
        end
        
        for t=1:x-20-1
            for w=1:y-20-1
                nonz=nnz(corns(t:t+20,w:w+20));
                if(nonz>lim)
                    resized =insertMarker(resized,[w+10,t+10],'*','color','red','size',1);
                end
            end
        end
        
        figure,
        subplot(2,1,1);
        imshow(resized),title('Org');
        subplot(2,1,2);
        imshow(rotcrop),title('Done');
        
end

% function [ output ] = medFilt( input, Size )
% 
%     filter = ones(Size);
%     [H,W] = size(filter);
%     [row,column] = size(input);
%     output = zeros(size(input));
% 
%     for i=1:row-H-1
%         for j=1:column-W-1
%             box = input(i:i+(H-1),j:j+(W-1));
%             med = median(median(box,2),1);
%             output(i+floor(H/2),j+floor(W/2)) = med;
%         end
%     end
% end


% function [ c ] = median ( a,b )
% c=a;
% temp=(0);
% for i=1:size(a,1)-b(1)
%     for j=1:size(a,2)-b(2)
%         k=i;
%         l=j;
%         z=0;
%     for m=k:k+b(1)-1
%         
%         for n=l:l+b(2)-1
%             temp(z+1)=a(m,n);
%             z=z+1;
%         end
%     end
%     temp=sort(temp);
%     mid=b(1)*(b(2)/2+1;
%     c(i+1,j+1)=temp(uint8(mid));
%     end
% end
% 
% end


