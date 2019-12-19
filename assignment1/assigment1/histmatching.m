function [ cpdf3,cpdf2 ] = histmatching( im,func)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

func=func/sum(func);

cpdf=zeros(size(func));
summate=0;

for i=1:size(func,2)
    
    if(i==1)
        summate=func(1,i);
    else
        summate=summate+func(1,i);
    end
    
    cpdf(1,i)=summate;
    
end

cpdf=cpdf';
cpdf2=uint8(cpdf*255);
cpdf3=zeros(size(cpdf2));
for i=1:size(cpdf2,1)
    a=cpdf2(i);
    cpdf3(a+1)=i;
end

for j=1:size(cpdf3,1)
    if(cpdf3(j)==0)
        cpdf3(j)=cpdf3(j-1);
    end
end

% for i=size(cpdf2,1):-1:1
%     a=cpdf2(i);
%     cpdf3(a+1)=i;
% end
% 
% for j=size(cpdf3,1)-1:-1:1
%     if(cpdf3(j)==0)
%         cpdf3(j)=cpdf3(j+1);
%     end
% end
cpdf3=cpdf3-1;


end

