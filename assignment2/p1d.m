clear
clc

im = imread('/home/sajal/3-1/DIP/Assignments/assignment2/vegan-modified.jpg');
imt = imread('home/sajal/3-1/DIP/Assignments/assignment2/soy-dessert.jpg');

im = imresize(im,0.5);
imt = double(imresize(imt,0.5));

summatriximt = integralimage(imt);
meanvalueimt = summatriximt(end,end)/numel(imt);

varmatriximt = integralimage((double(imt) - meanvalueimt).^2);

numtermt = imt - meanvalueimt;
demtermt = varmatriximt(end,end);
simindex = 0;
simcoordinates = [0 0];

summatrixim = integralimage(im);
meanvalueim = summatrixim(end,end)/numel(im);

varmatrixim = integralimage((double(im) - meanvalueim).^2);

imdiff = 0;
diffarray = [0 0];

tic
for i=1:size(im,1)-size(imt,1)
    for j=1:size(im,2)-size(imt,2)
        xtop = i;
        xleft = j;
        xbottom = i+size(imt,1);
        xright = j+size(imt,2);
        impart = double(im(xtop:xbottom-1,xleft:xright-1));
        impartmean = summatrixim(xbottom-1,xright-1) + summatrixim(xtop,xleft) - summatrixim(xtop,xright-1) - summatrixim(xbottom-1,xleft);
        impnew = impart-impartmean;
        imnum = impnew.*numtermt;
        numval = sum(imnum(:));
        demvalim = varmatrixim(xbottom-1,xright-1) + varmatrixim(xtop,xleft) - varmatrixim(xtop,xright-1) - varmatrixim(xbottom-1,xleft);
        demval = (demvalim*varmatriximt).^0.5;
        imdiff1 = numval/sum(demval(:));
        if(imdiff1 > imdiff)
            imdiff = imdiff1;
            diffarray = [j i];
        end
    end
end
toc
        
        
figure,imshow(im)
z = rectangle('Position',[diffarray(1),diffarray(2),size(imt,2),size(imt,1)]);
set(z,'EdgeColor',[1 0 0]);
set(z,'LineWidth',3);


