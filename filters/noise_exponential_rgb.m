function [ output ] = noise_exponential_rgb( img,a )
[m n l]=size(img);
output=zeros(m,n,l);
output(:,:,1)=noise_exponential(img(:,:,1),a);
output(:,:,2)=noise_exponential(img(:,:,2),a);
output(:,:,3)=noise_exponential(img(:,:,3),a);
%output=cat(3,output1,output2,output3);
output=uint8(output);
imshow(output);

end

