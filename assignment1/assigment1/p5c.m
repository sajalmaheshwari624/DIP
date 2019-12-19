im = imread('face.png');
count=1;
figure,;
for k=1:2:10
    [imf] = invbilateral(im,k,1,3);
    subplot(5,2,count),imshow(im);
    subplot(5,2,count+1),imshow(uint8(imf));
    count=count+2;
end