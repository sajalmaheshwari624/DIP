im = imread('office.jpg');
im1=zeros(size(im));

func = zeros(1,256);

for i = 1:size(func,2);
    func(i)=i-1;
end

[im1(:,:,1)] = histequalization(im(:,:,1));
[im1(:,:,2)] = histequalization(im(:,:,2));
[im1(:,:,3)] = histequalization(im(:,:,3));

figure,


imr=im(:,:,1);
img=im(:,:,2);
imb=im(:,:,3);
im1r=im1(:,:,1);
im1g=im1(:,:,2);
im1b=im1(:,:,3);

% imhistr = hist(double(imr(:)),256)/sum(imr(:));
% imhistg = hist(double(img(:)),256)/sum(img(:));
% imhistb = hist(double(imb(:)),256)/sum(imb(:));
% im1histr = hist(double(im1r(:)),256)/sum(im1r(:));
% im1histg = hist(double(im1g(:)),256)/sum(im1g(:));
% im1histb = hist(double(im1b(:)),256)/sum(im1b(:));

subplot(4,2,1),imhist(uint8(imr));

subplot(4,2,2),imhist(uint8(im1r));

subplot(4,2,3),imhist(uint8(img));

subplot(4,2,4),imhist(uint8(im1g));

subplot(4,2,5),imhist(uint8(imb));

subplot(4,2,6),imhist(uint8(im1b));

subplot(4,2,7),imshow(im);

subplot(4,2,8),imshow(uint8(im1));









