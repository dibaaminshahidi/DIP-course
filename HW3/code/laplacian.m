clear
clear all;
im=imread('face1.jpg');
gray=rgb2gray(gray);
[r c]=size(gray)
gray=im2double(gray);
filter=[-1 -2 -1;-2 12 -2; -1 -2 -1];
result=gray;
for i=2:r-1
    for j=2:c-1
        sum=0;
        row=0;
        col=1;
        
        for k=i-1:i+1
            row=row+1;
            col=1;
            for l=j-1:j+1
                sum = sum+gray(k,l)*filter(row,col);               
                col=col+1;
            end
        end
      result(i,j)=sum;      
    end
end
result
imwrite(result,'test.jpg');