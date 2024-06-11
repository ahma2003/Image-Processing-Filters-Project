function [ output ] = median_filter(img )
img=padarray(img,[1,1]);
noisy = imnoise(img , 'salt & pepper' , 0.02);
%figure,imshow(noisy);

[m, n ,l] = size(noisy);
output = zeros(m , n);
if l==1
    for i =2:m-1
        for j=2:n-1
            sto=[noisy(i-1,j-1),noisy(i-1,j),noisy(i-1,j+1),noisy(i,j-1),noisy(i,j)...
            ,noisy(i,j+1),noisy(i+1,j-1),noisy(i+1,j),noisy(i+1,j+1)];
            result = median(sto);
            output(i , j) = result;
        end
     end
output = uint8(output);
figure ,imshow(output);
else
  for k=1:3
      for i = 2:m-1
          for j = 2:n-1
              sto=[noisy(i-1,j-1,k),noisy(i-1,j,k),noisy(i-1,j+1,k),noisy(i,j-1,k),noisy(i,j,k)...
               , noisy(i,j+1,k),noisy(i+1,j-1,k),noisy(i+1,j,k),noisy(i+1,j+1,k)];
              result = median(sto);
              output(i , j,k) = result;
          end
      end
   end
output= uint8(output);

end
end