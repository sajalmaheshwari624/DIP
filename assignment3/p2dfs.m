clear
clc
close all

imin = imread('/home/sajal/3-1/DIP/Assignments/assignment3/circles.jpg');

imin = rgb2gray(imin);
imbw = im2bw(imin,0.17);
l = bwlabel(double(imbw));
% se = strel('disk',3,8);
% imdil = imdilate(imbw,se);
% 
% se1 = strel('disk',1,8);
% imerod = imerode(imdil,se1);
% figure,imshow(imerod)
% 
% l = bwlabel(double(imerod));
% 
a = hist(l(:),max(max(l))+1);

a = a(2:end);

category = zeros(ceil(max(a)/10),1);

for i=1:size(a,2);
    c = ceil(a(i)/100);
    category(c)=category(c)+1;
end

category = [category(1:5);category(9);category(10)];
category(end-2)=category(end-2)+category(end-1)+category(end);
category = category(1:end-2);

c1 = find(a>0 & a<=100);
c2 = find(a>100 & a<=200);
c3 = find(a>200 & a<=300);
c4 = find(a>300 & a<=400);
c5 = find(a>400);
imback = zeros(size(imin));
%imback  = l;

im1 = imback;
for i=1:size(c1,2)
    [j k] = find(l==c1(i));
        im1(j,k)=255;
%         [m n] = find(l~=c(i));
%         im1(m,n)=0;
end

im2 = imback;
for i=1:size(c2,2)
    [j k] = find(l==c2(i));
        im2(j,k)=255;
end


im3 = imback;
for i=1:size(c3,2)
    [j k] = find(l==c3(i));
        im3(j,k)=255;
end

im4 = imback;
for i=1:size(c4,2)
    [j k] = find(l==c4(i));
        im4(j,k)=255;
end

% im5 = imback;
% for i=1:size(c5,2)
%     [j k] = find(l==c5(i));
%         im5(j,k)=255;
% end

subplot(3,2,1),imshow(imbw);
subplot(3,2,2),imshow(im1);
subplot(3,2,3),imshow(im2);
subplot(3,2,4),imshow(im3);
subplot(3,2,5),imshow(im4);
% subplot(3,2,6),imshow(im5);