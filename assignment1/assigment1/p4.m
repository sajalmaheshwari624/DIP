im=imread('bell.jpg');

figure,;
count=1;

for k=2:5
    for j=3:2:5        
        H = fspecial('gaussian',j,2);
        imblur=imfilter(im,H);
        imedge=im-imblur;
        imedge=k.*imedge;
        imsharp=im+imedge;
        subplot(4,4,count),imshow(im);
       subplot(4,4,count+1),imshow(imsharp)
       %figure,imshow(imblur)
        count=count+2;
    end
end
        

        
% H = fspecial('gaussian',3,2);
% 
% imblur=imfilter(im,H);
% imedge=im-imblur;
% imedge=5.*imedge;
% imsharp=im+imedge;
% imshow(imsharp)
% figure,imshow(im)

