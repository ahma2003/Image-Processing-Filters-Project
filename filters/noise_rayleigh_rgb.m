function [ output ] = noise_rayleigh_rgb( img,a,b)
[m n l]=size(img);
output=zeros(m,n,l);
output(:,:,1)=noise_rayleigh(img(:,:,1),a,b);
output(:,:,2)=noise_rayleigh(img(:,:,2),a,b);
output(:,:,3)=noise_rayleigh(img(:,:,3),a,b);
output=uint8(output);


end

