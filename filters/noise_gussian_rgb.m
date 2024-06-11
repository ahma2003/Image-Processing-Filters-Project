function [ output ] = noise_gussian_rgb( img,v,m )
[m n l]=size(img);
output=zeros(m,n,l);
output(:,:,1)=noise_gussian(img(:,:,1),v,m);
output(:,:,2)=noise_gussian(img(:,:,2),v,m);
output(:,:,3)=noise_gussian(img(:,:,3),v,m);
%output=cat(3,output1,output2,output3);
output=uint8(output);


end

