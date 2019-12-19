clear
clc
tic
im = imread('/home/sajal/3-1/DIP/Assignments/assignment2/vegan-modified.jpg');
imt = imread('home/sajal/3-1/DIP/Assignments/assignment2/soy-dessert.jpg');

im = imresize(im,0.5);
imt = imresize(imt,0.5);
imdiff = size(imt,1)*size(imt,2)*255;

diffarray = [0 0];

for i = 1:size(im,1)-size(imt,1)
    for j = 1:size(im,2)-size(imt,2)
        xtop = i;
        xbottom = min(i+size(imt,1),size(im,1));
        xleft = j;
        xright = min(j+size(imt,2),size(im,2));
        imp = im(xtop:xbottom-1,xleft:xright-1);
        imdiff1 = imp - imt;
        imdiff1 = sum(abs(imdiff1(:)));
        if(imdiff1 < imdiff)
            imdiff = imdiff1;
            diffarray = [j i];
        end
        
    end
end

figure,imshow(im)
z = rectangle('Position',[diffarray(1),diffarray(2),size(imt,2),size(imt,1)]);
set(z,'EdgeColor',[1 0 0]);
set(z,'LineWidth',3);
toc
        