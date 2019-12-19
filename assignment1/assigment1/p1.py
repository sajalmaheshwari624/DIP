import numpy as np
import cv2

im1 = cv2.imread('/home/sajal/Desktop/DIP/Assignments/assignment1/assigment1/spot1-diff1.jpg')
im2 = cv2.imread('/home/sajal/Desktop/DIP/Assignments/assignment1/assigment1/spot1-diff2.jpg')

def paintfill( im,vis,x,y,val,imleft,imright,imtop,imbottom,leftpoint,rightpoint,bottompoint,toppoint) :
	if (x >= 1 and y >= 1 and x <= size(im,1) and y <= size(im,2) and vis(x,y) == 0 && im(x,y) == val) :
		vis(x,y)=1;

		if(y < imleft)
    		leftpoint=[y,x];
    		imleft=leftpoint(1);

		if(y > imright)
    		rightpoint=[y,x];
    		imright=rightpoint(1);

		if(x < imtop)
    		toppoint=[y,x];
    		imtop=toppoint(2);

		if(x>imbottom)
    		bottompoint=[y,x];
    		imbottom=bottompoint(2);
    
		#if(im(x,y)==val)
    	#visited(x,y)=val;
    	[vis,leftpoint,rightpoint,toppoint,bottompoint] = paintfill(im,vis,(x-1),y,val,imleft,imright,imtop,imbottom,leftpoint,rightpoint,bottompoint,toppoint);
    	[vis,leftpoint,rightpoint,toppoint,bottompoint] = paintfill(im,vis,(x+1),y,val,imleft,imright,imtop,imbottom,leftpoint,rightpoint,bottompoint,toppoint);
    	[vis,leftpoint,rightpoint,toppoint,bottompoint] = paintfill(im,vis,x,(y+1),val,imleft,imright,imtop,imbottom,leftpoint,rightpoint,bottompoint,toppoint);
    	[vis,leftpoint,rightpoint,toppoint,bottompoint] = paintfill(im,vis,x,(y-1),val,imleft,imright,imtop,imbottom,leftpoint,rightpoint,bottompoint,toppoint);
    	[vis,leftpoint,rightpoint,toppoint,bottompoint] = paintfill(im,vis,(x-1),(y-1),val,imleft,imright,imtop,imbottom,leftpoint,rightpoint,bottompoint,toppoint);
    	[vis,leftpoint,rightpoint,toppoint,bottompoint] = paintfill(im,vis,(x+1),(y-1),val,imleft,imright,imtop,imbottom,leftpoint,rightpoint,bottompoint,toppoint);
    	[vis,leftpoint,rightpoint,toppoint,bottompoint] = paintfill(im,vis,x+1,(y+1),val,imleft,imright,imtop,imbottom,leftpoint,rightpoint,bottompoint,toppoint);
    	[vis,leftpoint,rightpoint,toppoint,bottompoint] = paintfill(im,vis,x-1,(y+1),val,imleft,imright,imtop,imbottom,leftpoint,rightpoint,bottompoint,toppoint);
	#else
		#varargout=1;
		#[visited]=paintfill(im,x,y,val);
		#visited(i-1,j-1)=1;
		#visited(i,j-1)=1;
		#visited(i+1,j-1)=1;
		#visited(i-1,j)=1;
		#visited(i+1,j)=1;
		#visited(i-1,j+1)=1;
		#visited(i,j+1)=1;
		#visited(i+1,j+1)=1;


#cv2.imshow('image1',im1)
#cv2.imshow('image2',im2)
#cv2.waitKey(0)
#cv2.destroyAllWindows()
THRESH = 40

diffIm = cv2.absdiff(im1, im2)
[diffImCh1, diffImCh2, diffImCh3] = cv2.split(diffIm)
height, width, channels = diffIm.shape
zerosImage = np.zeros((height,width,1), np.uint8)

ret,threshImageChnl1 = cv2.threshold(diffImCh1,THRESH,255,cv2.THRESH_BINARY)
ret,threshImageChnl2 = cv2.threshold(diffImCh2,THRESH,255,cv2.THRESH_BINARY)
ret,threshImageChnl3 = cv2.threshold(diffImCh3,THRESH,255,cv2.THRESH_BINARY)

zerosImage = threshImageChnl1 + threshImageChnl2 + threshImageChnl3

visited = np.zeros((height, width,1), np.uint8)
leftpoint = np.zeros(1,2)
rightpoint = np.zeros(1,2)
toppoint = zeros(1,2)
bottompoint = zeros(1,2)
dimen = []
recchar = zeros(1,4)
count = 0

for i in range(width) :
	for j in range(height) :

