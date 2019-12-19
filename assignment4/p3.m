clear
clc
close all

im = imread('rice.png');
figure,imshow(im)
THRESH = 0;

imnoiseim = imnoise(im,'gaussian');

figure,imshow(imnoiseim,[])

[ll lh hl hh] = dwt2(imnoiseim,'haar');

lh(:) = 0;
hl(:) = 0;
hh(:) = 0;

% for i=1:size(ll,1)
%     for j=1:size(ll,2)
%         
%         if(lh(i,j)> THRESH)
%             lh(i,j)=0;
%         end
%         
%         if(hl(i,j)> THRESH)
%             hl(i,j)=0;
%         end
%         
%         if(hh(i,j)> THRESH)
%             hh(i,j)=0;
%         end
%     end
% end

imdenoise = idwt2(ll,lh,hl,hh,'haar');

figure,imshow(imdenoise,[])