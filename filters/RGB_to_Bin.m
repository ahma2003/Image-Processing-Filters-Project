function [bin] = RGB_to_Bin(rgb)
bin=Gray_to_Bin(RGB_to_Gray(rgb,2));
%imshow(bin);
end