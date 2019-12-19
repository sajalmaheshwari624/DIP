clear
clc

im = imread('/home/sajal/3-1/DIP/Assignments/assignment2/test-images-for-q2/son3rot3.gif');

im = im.*255;

a = fft2(im);
a1 = fftshift(a);
a2 = abs(a1);
a3 = log(a2);
for i = 1:size(im,1)
    for j = 1:size(im,2)
        if(a3(i,j) >= 12)
            a3(i,j)=255;
        else
            a3(i,j)=0;
        end
    end
end

%imshow(a3)

rotsum = zeros(1,180);
rotsum2 = zeros(1,180);
for k=0:179
    a31 = imrotate(a3,k);
    vertcol = a31(:,ceil(size(a31,2)*0.5));
    horzrow = a31(ceil(size(a31,1)*0.5),:);
    su1 = sum(vertcol);
    su2 = sum(horzrow);
    rotsum2(k+1)=su2;
    rotsum(k+1)=su1;

end

[val rotangle] = max(rotsum);
[val2 rotangle2] = max(rotsum2);

if(rotangle2 > rotangle)
    rotangle = -rotangle;
end

if(rotangle2 < rotangle)
    rotangle = 180-rotangle;
end
    

% if(rotangle>90)
%     rotangle = rotangle-180;
% end
% if(rotangle<90)
%     rotangle =

%rotangle = abs(180-rotangle);


