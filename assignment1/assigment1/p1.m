clear
clc
close all

im1 = imread('/home/sajal/3-1/DIP/Assignments/assignment1/assigment1/spot1-diff1.jpg');
im2 = imread('/home/sajal/3-1/DIP/Assignments/assignment1/assigment1/spot1-diff2.jpg');
% figure,imshow(im1);
% figure,imshow(im2);

THRESH = 40;

imdiff = abs(im1 - im2);

[x y] = find(imdiff(:,:,1) > THRESH | imdiff(:,:,2) > THRESH | imdiff(:,:,3) > THRESH );

imnew = zeros(size(imdiff,1),size(imdiff,2));

for i=1:size(x,1)
    a=x(i,1);
    b=y(i,1);
    imnew(a,b)=255;
end

%figure,imshow(imnew);

visited=zeros(size(imnew));
leftpoint=zeros(1,2);
rightpoint=zeros(1,2);
toppoint=zeros(1,2);
bottompoint=zeros(1,2);
dimen=[];
recchar=zeros(1,4);
count=0;

for i=1:size(imnew,1)
    for j=1:size(imnew,2)
        if(imnew(i,j)==255 && visited(i,j)==0)
            imright=1;
            imtop=size(imnew,1);
            imleft=size(imnew,2);
            imbottom=1;
            [visited,left,right,top,bottom]=paintfill(imnew,visited,i,j,255,imleft,imright,imtop,imbottom,leftpoint,rightpoint,bottompoint,toppoint);
            breadth=abs(left(1)-right(1));
            height=abs(bottom(2)-top(2));
            area=breadth*height;
            if(area>40)
                count=count+1;
                recchar(1)=left(1);
                recchar(2)=top(2);
                recchar(3)=breadth;
                recchar(4)=height;
                if(count==1)
                    dimen=recchar;
                else
                    dimen=[dimen;recchar];
                end
                
%                 z = rectangle('Position',[left(1),top(2),breadth,height]);
%                 set(z,'EdgeColor','red');
            end
        end                                            
    end
end

figure,imshow(im1);
for i=1:size(dimen,1)
    z=rectangle('Position',[dimen(i,1),dimen(i,2),dimen(i,3),dimen(i,4)]);
    set(z,'EdgeColor',[1 0 0]);
    set(z,'LineWidth',1);
end
% 
figure,imshow(im2);
for i=1:size(dimen,1)
    z=rectangle('Position',[dimen(i,1),dimen(i,2),dimen(i,3),dimen(i,4)]);
    set(z,'EdgeColor', [1 0 0]);
    set(z,'LineWidth',1);
end

