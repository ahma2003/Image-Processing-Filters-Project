function [ new_img ] = noise_exponential( img,a)
img=double(img);
[h w l]=size(img);
for i=1:255
    num_of_pix=round(a*(exp(-a*i))*h*w);
    for j=1:num_of_pix
       row=ceil(rand(1,1)*h);
       colom=ceil(rand(1,1)*w);
       img(row,colom)=255;
    end
end
for k=1:1
    mn=min(min(img(:,:,k)));
    mx=max(max(img(:,:,k)));
    new_img(:,:,k)=((img(:,:,k)-mn)/(mx-mn))*255;
end
new_img=uint8(new_img);

    
end

