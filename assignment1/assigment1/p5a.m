clear
clc 

close all

im = imread('face.png');
count=1;


for i=1:2:10
    imf = bilateral(im,3,i,5);
    figure,;
    subplot(2,1,1),imshow(im);
    subplot(2,1,2),imshow(uint8(imf));
end