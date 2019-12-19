clear
clc
close all

im = imread('coins.png');
figure,imshow(im)
imtrans = zeros(size(im,1),size(im,2),2);
for i=1:size(im,1)
    for j=1:size(im,2)
        jnew=j+10*sin(2*pi*i/70);
        inew=i+15*sin(2*pi*j/50);
        if(jnew > 0 && inew > 0 && jnew < size(im,2) && inew < size(im,1))
            imf(i,j)=im(ceil(inew),ceil(jnew));
        end 
    end
end

figure,imshow(imf)
        