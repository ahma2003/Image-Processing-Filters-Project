function [ new_image ] = FourierTransforminverse_gray( old_image )
[h,w,l] = size(old_image);
new_image = zeros(h,w);
fi = fft2(old_image);
fi = fftshift(fi);
new_image = ifft2(fi);
new_image = mat2gray(abs(new_image));

end

