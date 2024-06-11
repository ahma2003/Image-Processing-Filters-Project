function [ new_img ] = salt_pepper( img,ps,pp )
[h w l]=size(img);
num_of_S=round(ps*h*w);
num_of_p=round(pp*h*w);
for i=1:num_of_S
    row=ceil(rand(1,1)*h);
    colom=ceil(rand(1,1)*w);
    img(row,colom)=255;
end
for i=1:num_of_p
    row=ceil(rand(1,1)*h);
    colom=ceil(rand(1,1)*w);
    img(row,colom)=0;
end
new_img=img;
new_img=uint8(new_img);


end