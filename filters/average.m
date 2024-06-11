function [ output ] = average( image) 

filter = [1 1 1;1 1 1;1 1 1];

filter=double(filter);
image = double(padarray(image,[1,1]));
[h w l] =size(image);
output = zeros(h,w,l);
if l==1
    for i=2:h-1
        for j=2:w-1
            s= image(i-1:i+1,j-1:j+1);
            sum1=sum(sum(s.*filter))/9;
            output(i,j)=sum1;
            if output(i,j)>255
                output(i,j)=255;
            elseif output(i,j)<0
                output(i,j)=0;
            end
        end
    end
else
    for k=1:3
        for i=2:h-1
            for j=2:w-1
                 % i-1 ---> red
                 % i ---> green
                 % i+1 ---> blue
                s= image(i-1:i+1,j-1:j+1,k); %will go through all three channels row and column
                
                sum1=sum(sum(s.*filter))/9;
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
end