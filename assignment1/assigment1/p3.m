clear
clc
close all

im = imread('chip.png');

figure,imshow(im);

im=double(im);

GAMMA = 0.5;

im1=zeros(size(im));

im = im/255;

im1 = double(im).^(GAMMA);

im1 = im1.*255;

im1 = uint8(im1);




figure,imshow(im1)

im2 = histequalization(im1);

figure,imshow(im2)

im3 = imadjust(im2);

figure,imshow(im3)

% im3 = zeros(size(im2));
% 
% for i=1:size(im2,1)
%     for j=1:size(im2,2)
%         a=im2(i,j);
%         if(a<30)
%             im3(i,j)=0;
%         else
%             im3(i,j)=255;
%         end
%     end
% end
% 
% figure,imshow(uint8(im3))
%         


