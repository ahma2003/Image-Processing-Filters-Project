function [gray] = RGB_to_Gray(rgb,op)
[h,w,l]=size(rgb);
gray=zeros(h,w);
gray=double(gray);
for i=1:h
    for j=1:w
        if op==1
            gray(i,j)=(rgb(i,j,1)+rgb(i,j,2)+rgb(i,j,3))/3;
        end
        if op==2
            gray(i,j)=rgb(i,j,1);
        end
         if op==3
            gray(i,j)=rgb(i,j,2);
         end
         if op==4
            gray(i,j)=rgb(i,j,3);
         end
         if op==5
            gray(i,j)=rgb(i,j,1)*0.2+rgb(i,j,2)*0.3+rgb(i,j,3)*0.5;
         end
    end
end
gray=uint8(gray);
 %imshow(gray);

 end



