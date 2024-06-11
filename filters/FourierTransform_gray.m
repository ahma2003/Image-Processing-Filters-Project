function [ new_image_gray ] = FourierTransform_gray( old_image )
[h,w,l] = size(old_image);
  %gray image
new_image_gray = zeros(h,w);
fi = fft2(old_image);
fi = fftshift(fi);
new_image_gray = mat2gray(log(1+abs(fi))); 

end