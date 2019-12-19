clear
clc

im = imread('office.jpg');
figure,;

[im1(:,:,1) cpdfim1r] = histequalization(im(:,:,1));
[im1(:,:,2) cpdfim1g] = histequalization(im(:,:,2));
[im1(:,:,3) cpdfim1b] = histequalization(im(:,:,3));



% func=zeros(1,256);
% for k=1:size(func,2)
%     func(k)=(k-1);
% end
% 
%  %func(129:end)=255;
% 
% [cpdf3,cpdf2] = histmatching(im,func);
% im3=zeros(size(im));
% 
% for m=1:size(im,1)
%     for l=1:size(im,2)
%         tempr=im1(m,l,1);
%         tr=cpdf3(tempr);
%         im3(m,l,1)=tr;
%                 
%         tempg=im1(m,l,2);
%         tg=cpdf3(tempg);
%         im3(m,l,2)=tg;
%         
%         tempb=im1(m,l,3);
%         tb=cpdf3(tempb+1);
%         im3(m,l,3)=tb;
%     end
% end

imr=im(:,:,1);
img=im(:,:,2);
imb=im(:,:,3);
im1r=im3(:,:,1);
im1g=im3(:,:,2);
im1b=im3(:,:,3);

% imhistr = hist(double(imr(:)),256);
% imhistg = hist(double(img(:)),256);
% imhistb = hist(double(imb(:)),256);
% im1histr = hist(double(im1r(:)),256);
% im1histg = hist(double(im1g(:)),256);
% im1histb = hist(double(im1b(:)),256);

subplot(4,2,1),imhist(uint8(imr));

subplot(4,2,2),imhist(uint8(im1r));

subplot(4,2,3),imhist(uint8(img));

subplot(4,2,4),imhist(uint8(im1g));

subplot(4,2,5),imhist(uint8(imb));

subplot(4,2,6),imhist(uint8(im1b));

subplot(4,2,7),imshow(im);

subplot(4,2,8),imshow(uint8(im3));

