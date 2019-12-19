function [ imf ] = bilateral( im,intensitysigma,spacesigma,winsize )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

[x y] = meshgrid(-winsize:winsize,-winsize:winsize);
G = exp(-((x.^2)+(y.^2))/(2*spacesigma));

imf=zeros(size(im));

for i=1:size(im,1)
    for j=1:size(im,2)
        imleft=max(i-winsize,1);
        imright=min((i+winsize),size(im,1));
        imtop=max((j-winsize),1);
        imbottom=min((j+winsize),size(im,2));
        impart=im(imleft:imright,imtop:imbottom);
        
        H = exp(-double(impart-im(i,j)).^2/(2*intensitysigma^2));
        
        F = H.*G((imleft:imright)-i+winsize+1,(imtop:imbottom)-j+winsize+1);
        imf(i,j) = sum(F(:).*double(impart(:)))/sum(F(:));
    end
end
        



end

