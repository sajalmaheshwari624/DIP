clear
clc
close all

im = imread('/home/sajal/3-1/DIP/Assignments/assignment3/map.gif');
im = im.*255;
figure,imshow(im)
im2 = zeros(size(im));
imangle = zeros(size(im,1),size(im,2),2);
% %%%%%%%%%%%%%%%%%%%%------------------------------------------------------------1------------------------------------------%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:size(im,1)
    for j=1:size(im,2)
        longitude = (j-size(im,2)/2)/4;
        
        mapping = floor(360-4*asind(1-i/360));
        imangle(i,j,2) = mapping;
        
        imangle(i,j,1)=j;
        
    end
end


imf = zeros(size(im));

for i=1:size(imf,1)-1
    for j=1:size(imf,2)
       imf(i,j)=im(imangle(i,j,2),imangle(i,j,1));
    end
end

figure,imshow(imf)

%%%%%%%%%%%%%%%%%%%%%-------------------------------------------------2-----------------------------------------------------%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(im,1)
    for j=1:size(im,2)
        longitude = (j-size(im,2)/2)/4;
        mapping = 4*floor(360-8*(atand(exp(1-i/360))-45));
        %mapping=mapping*(719/(558-161))+(720-(558*720/(558-161)));
        mapping=0.25*mapping*(719/(558-161))+(720-(558*719/(558-161)));
        imangle(i,j,2) = floor(mapping);
        imangle(i,j,1)=j;
        
    end
end


imf = zeros(size(im));

for i=1:size(imf,1)
    for j=1:size(imf,2)
       imf(i,j)=im(imangle(i,j,2),imangle(i,j,1));
    end
end

figure,imshow(imf)
