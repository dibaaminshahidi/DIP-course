function [B] = myaffine(image,m,method)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

B = zeros(size(image,1)*7, size(image,2)*7, size(image,3));
invm = inv(m);

if(strcmp("nn", method))
    for x = 1:size(B,1)
        for y = 1:size(B,2)
            % nearest neighbor
            w = round(y * invm(1,1) + x * invm(2,1) + invm(3,1)) - 300;
            v = round(y * invm(1,2) + x * invm(2,2) + invm(3,2)) - 300;
            if (w >= 1 && v >= 1 && v < size(image,1) && w < size(image,2))
                xx = image(v,w,:);
                B(x,y,:) = xx;
            end
        end
    end
end

if(strcmp("bl", method))
    for x = 1:size(B,1)
        for y = 1:size(B,2)
            w = y * invm(1,1) + x * invm(2,1) + invm(3,1) - 300;
            v = y * invm(1,2) + x * invm(2,2) + invm(3,2) - 300;
            
            %     if(v < 1)
            %         v = 1;
            %     end
            %     if(w<1)
            %         w = 1;
            %     end
            if (w >= 1 && v >= 1 && v < size(image,1) && w < size(image,2))
                x2 = ceil(v);
                x1 = floor(v);
                y2 = ceil(w);
                y1 = floor(w);
                
                R1 = image(x1,y1,:) + (v - x1)/(x2 - x1)*(image(x2,y1,:) - image(x1,y1,:));
                R2 = image(x1,y2,:) + (v - x1)/(x2 - x1)*(image(x2,y2,:) - image(x1,y2,:));
                P = R2 + (w - y2)/(y2 - y1)*(R1 - R2);

                B(x,y,1:3) = P(:,:,:);
            end
        end
        
        
    end
    
    % B = uint8(B);
    % B = interpolation(B, "nn");
end

