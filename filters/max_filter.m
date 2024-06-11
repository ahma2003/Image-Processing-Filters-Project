function [ output ] = max_filter(img )
img=padarray(img,[1,1]);
[m n l] = size (img);
output = zeros(m , n);
if l==1
    for i =2:m-1
        for j=2:n-1
            sto=[img(i-1,j-1),img(i-1,j),img(i-1,j+1),img(i,j-1),img(i,j)...
            ,img(i,j+1),img(i+1,j-1),img(i+1,j),img(i+1,j+1)];
            result = max(sto);
            output(i , j) = result;
        end
     end
output = uint8(output);
figure ,imshow(output);
else
  for k=1:3
      for i = 2:m-1
          for j = 2:n-1
              sto=[img(i-1,j-1,k),img(i-1,j,k),img(i-1,j+1,k),img(i,j-1,k),img(i,j,k)...
               , img(i,j+1,k),img(i+1,j-1,k),img(i+1,j,k),img(i+1,j+1,k)];
              result = max(sto);
              output(i , j,k) = result;
          end
      end
   end
output= uint8(output);

end
end