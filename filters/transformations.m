function [ new_img ] = transformations( old_img,index,c,y)
%index 1=log  /  2=inverse  / 3= power  /  4=root  / 5=negative .
[h w l]=size(old_img);
trans_rgb=zeros(h,w);
trans_gray=zeros(h,w);
old_img=im2double(old_img);
for i=1:h
    for j=1:w
        if index==1
            if l==3
                trans_rgb(i,j,1)=c*log((old_img(i,j,1))+1);
                trans_rgb(i,j,2)=c*log((old_img(i,j,2))+1);
                trans_rgb(i,j,3)=c*log((old_img(i,j,3))+1);
            else
                trans_gray(i,j)=c*log((old_img(i,j))+1);
            end
        end
        if index==2
            if l==3
                trans_rgb(i,j,1)=exp(old_img(i,j,1))-1;
                trans_rgb(i,j,2)=exp(old_img(i,j,2))-1;
                trans_rgb(i,j,3)=exp(old_img(i,j,3))-1;

            else
                trans_gray(i,j)=exp(old_img(i,j))-1;
            end
        end
        if index==3
             if l==3
                trans_rgb(i,j,1)=c*(old_img(i,j,1)^y);
                trans_rgb(i,j,2)=c*(old_img(i,j,2)^y);
                trans_rgb(i,j,3)=c*(old_img(i,j,3)^y);
            else
                trans_gray(i,j)=c*(old_img(i,j)^y);
             end
        end
        if index==4
            if l==3
                trans_rgb(i,j,1)=c*(old_img(i,j,1)^(1/y));
                trans_rgb(i,j,2)=c*(old_img(i,j,2)^(1/y));
                trans_rgb(i,j,3)=c*(old_img(i,j,3)^(1/y));
            else
                trans_gray(i,j)=c*(old_img(i,j)^(1/y));
             end
        end
        if index==5
             if l==3
                trans_rgb(i,j,1)=1-(old_img(i,j,1));
                trans_rgb(i,j,2)=1-(old_img(i,j,2));
                trans_rgb(i,j,3)=1-(old_img(i,j,3));
            else
                trans_gray(i,j)=1-(old_img(i,j));
            end
        end
            
            
        
    end
end
if l==3
    new_img=im2uint8(trans_rgb);
else
    new_img=im2uint8(trans_gray);
end


end