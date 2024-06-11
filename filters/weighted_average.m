function [ output ] = weighted_average( image) 

filter = [1 2 1;2 4 2;1 2 1];
filter=double(filter);
pad=1;
image = double(padarray(image,[pad ,pad]));
[h w l] =size(image);
output = zeros(h,w,l);
if l==1
    for i=2:h-1
        for j=2:w-1
            s= image(i-1:i+1,j-1:j+1);
            sum1=sum(sum(s.*filter))/16;
            output(i,j)=sum1;
            if output(i,j)>255 
                output(i,j)=255;
            elseif output(i,j)<0
                output(i,j)=0;
            end
        end
    end
else  %rgb image 
    for k=1:3
        for i=2:h-1
            for j=2:w-1
                s= image(i-1:i+1,j-1:j+1,k);
                sum1=sum(sum(s.*filter))/16;
                output(i,j,k)=sum1;
                if output(i,j,k)>255
                    output(i,j,k)=255;
                elseif output(i,j,k)<0
                    output(i,j,k)=0;
                end
            end
        end
    end
end

output = uint8(output);
imshow(output);
end