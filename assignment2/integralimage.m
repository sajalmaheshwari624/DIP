function [ im ] = integralimage( im )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

im = double(im);

for i=1:size(im,1)-1
    a = double(im(i,:));
    b = double(im(i+1,:));
    im(i+1,:) = a+b;
end

for j=1:size(im,2)-1
    a = double(im(:,j));
    b = double(im(:,j+1));
    im(:,j+1) = a+b;
end

% if(x==1)
%     S=im(x,y)+integralimage(x,y-1,im);
% end
% 
% if(y==1)
%     S=im(x,y)+integralimage(x-1,y,im);
% end
% 
% S=im(x,y)+integralimage(x-1,y,im)+integralimage(x,y-1,im)-integralimage(x-1,y-1,im);
% 
end

