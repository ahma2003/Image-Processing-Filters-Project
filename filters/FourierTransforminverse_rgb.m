function [ output ] = FourierTransforminverse_rgb( img )
[m n l]=size(img);
img=double(img);
output=zeros(m,n,l);
output(:,:,1)=FourierTransforminverse_gray(img(:,:,1));
output(:,:,2)=FourierTransforminverse_gray(img(:,:,2));
output(:,:,3)=FourierTransforminverse_gray(img(:,:,3));
%output=cat(3,output1,output2,output3);
output=im2uint8(output);
imshow(output);
end