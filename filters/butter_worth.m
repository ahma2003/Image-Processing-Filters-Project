function [ img ] = butter_worth( I,do,index )
[h w l]=size(I);
filter=zeros(h,w,l);
for j=1:h
    for k=1:w
        dis=sqrt((j-(h/2)).^2+(k-(w/2)).^2);
        filter(j,k)=(1/(1+(dis/do)^2));
    end
end

if(index==0)
    filter=filter;
else
    filter=1-filter;
end
fi=fft2(I);
fi=fftshift(fi);
reall=real(fi);
imagin=imag(fi);
nreall=filter.*reall;
nimagin=filter.*imagin;
img=nreall(:,:)+i*nimagin(:,:);
img=fftshift(img);
img=ifft2(img);
img=mat2gray((abs(img)));


end

