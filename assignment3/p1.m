clear
clc

close all

[im,map] = imread('/home/sajal/3-1/DIP/Assignments/assignment3/octone.gif');
im1 = ind2rgb(im,map);

im2 = rgb2hsv(im1);

im3 = fftshift(fft2(im2));
im3(:,:,1)=0;
im3(:,:,3)=0;
im4=ifftshift(ifft2(im3));
im4 = abs(im4);

figure,imshow(im4)

im4 = rgb2gray(im4);

im5=zeros(size(im4));

for i=1:size(im4,1)
    for j=1:size(im4,2)
        if(im4(i,j)<=0.05)
            im5(i,j)=0;
        else
            im5(i,j)=255;
        end
    end
end


im6=im1;
im6(:,:,1)=im6(:,:,1).*im5;
im6(:,:,2)=im6(:,:,2).*im5;
im6(:,:,3)=im6(:,:,3).*im5;
figure,imshow(im6)
