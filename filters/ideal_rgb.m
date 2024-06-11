function [ output ] = ideal_rgb( img,do,i )
[m n l]=size(img);
img=double(img);
output=zeros(m,n,l);
output(:,:,1)=ideal(img(:,:,1),do,i);
output(:,:,2)=ideal(img(:,:,2),do,i);
output(:,:,3)=ideal(img(:,:,3),do,i);
%output=cat(3,output1,output2,output3);
output=im2uint8(output);


end