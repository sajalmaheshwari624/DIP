clear
clc

im = imread('/home/sajal/3-1/DIP/Assignments/assignment2/vegan-modified.jpg');
imt = imread('home/sajal/3-1/DIP/Assignments/assignment2/soy-dessert.jpg');
tic 
a = normxcorr2(imt,im);

[y x] = find(a==max(a(:)));
y = y-size(imt,1);
x = x-size(imt,2);
toc

% im = imresize(im,0.5);
% imt = double(imresize(imt,0.5));
% 
% summatriximt = integralimage(imt);
% meanvalueimt = summatriximt(end,end)/numel(imt);
% 
% varmatriximt = integralimage((double(imt) - meanvalueimt).^2);
% 
% numtermt = imt - meanvalueimt;
% demtermt = varmatriximt(end,end);
% simindex = 0;
% simcoordinates = [0 0];
% imtfreq = fft2(numtermt);
% imtfreqangle = angle(numtermt);
% 
% imdiff = 0;
% diffarray=[0 0];
% 
% for i=1:size(im,1)-size(imt,1)
%     for j=1:size(im,2)-size(imt,2)
%         xtop = i;
%         xleft = j;
%         xbottom = i+size(imt,1);
%         xright = j+size(imt,2);
%         impart = double(im(xtop:xbottom-1,xleft:xright-1));
%         impartfreq = fft2(impart);
%         impartang = angle(impartfreq);
%         diff = abs(impartang-imtfreqangle);
%         imdiff1 = sum(diff(:));
%         if(imdiff1 > imdiff)
%             imdiff = imdiff1;
%             diffarray = [j i];
%         end
%     end
% end
% 
% figure,imshow(im)
% z = rectangle('Position',[x,y,size(imt,2),size(imt,1)]);
% set(z,'EdgeColor',[1 0 0]);
% set(z,'LineWidth',3);


figure,imshow(im)
z = rectangle('Position',[x,y,size(imt,2),size(imt,1)]);
set(z,'EdgeColor',[1 0 0]);
set(z,'LineWidth',3);

