clear
clc

im = imread('/home/sajal/3-1/DIP/Assignments/assignment4/bottles.tif');

a = mode(double(im));
a1 = abs(diff(a));
breakpoint = find(a1 > 0);
pass = ones(0.5*numel(breakpoint)+1,1);

THRESH = 0.39;
count = 1;

b = max(im,[],2);
c = min(find(b==255));

im1 = im(:,1:breakpoint(1));
im1 = im1(c:size(im,1)/2,:);
im1 = im2bw(im1,0.75);

wp = find(im1==1);
frac = numel(wp)/numel(im1)
if(frac > THRESH)
    pass(count)=0;
end

for i=2:2:numel(breakpoint)-1
    count = count + 1;
    im1 = im(:,breakpoint(i):breakpoint(i+1));
    im1 = im1(c:size(im,1)/2,:);
    im1 = im2bw(im1,0.75);
    wp = find(im1==1);
    frac = numel(wp)/numel(im1)
    if(frac > THRESH)
        pass(count)=0;
    end
end

count = count+1;
im1 = im(:,breakpoint(end):size(im,2));
im1 = im1(c:size(im,1)/2,:);
im1 = im2bw(im1,0.75);
wp = find(im1==1);
frac = numel(wp)/numel(im1)
if(frac > THRESH)
    pass(count)=0;
end


