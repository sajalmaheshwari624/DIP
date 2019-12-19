function [ im, cpdf ] = histequalization( im )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


a=hist(double(im),256);
histo=sum(a,2);

pdf=histo/(size(im,1)*size(im,2));
cpdf=zeros(size(histo));
summate=0;

for i=1:size(histo)
    
    if(i==1)
        summate=pdf(i,1);
    else
        summate=summate+pdf(i,1);
    end
    
    cpdf(i,1)=summate;
    
end

plot(cpdf)

transform=255.*cpdf;
transform=uint8(255.*cpdf);
for i=1:size(im,1)
    for j=1:size(im,2)
        temp=im(i,j);
        t=transform(temp+1);
        im(i,j)=t;
    end
end
end

