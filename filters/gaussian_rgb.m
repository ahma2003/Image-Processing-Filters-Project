function [ output ] = gaussian_rgb( img,do,i )
[m n l]=size(img);
img=im2double(img);
output=zeros(m,n,l);
output(:,:,1)=gaussian(img(:,:,1),do,i);
output(:,:,2)=gaussian(img(:,:,2),do,i);
output(:,:,3)=gaussian(img(:,:,3),do,i);
%output=cat(3,output1,output2,output3);
output=im2uint8(output);


end

