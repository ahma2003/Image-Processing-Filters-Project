function [bin] = Gray_to_Bin(gray)
[h,w]=size(gray);
bin=zeros(h,w);
for i=1:h
    for j=1:w
        if gray(i,j)<127
            bin(i,j)=0;
        end
        if gray(i,j)>=127
           bin(i,j)=1;
        end
    end
end
bin=logical(bin);
%imshow(bin);
end

