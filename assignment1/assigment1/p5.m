clear
clc 

close all

im = imread('boy_smiling.jpg');
count=1;

figure,

for i=1:2:10
    for j=5:5:15
    imf(:,:,1) = bilateral(im(:,:,1),3,i,j);
    imf(:,:,2) = bilateral(im(:,:,2),3,i,j);
    imf(:,:,3) = bilateral(im(:,:,3),3,i,j); 
    subplot(5,6,count),imshow(im);
    subplot(5,6,count+1),imshow(uint8(imf));
    count=count+2;
    end
end