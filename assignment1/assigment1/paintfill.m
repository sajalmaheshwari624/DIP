function [vis,leftpoint,rightpoint,toppoint,bottompoint] = paintfill( im,vis,x,y,val,imleft,imright,imtop,imbottom,leftpoint,rightpoint,bottompoint,toppoint)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

if(x>=1 && y>=1 && x<=size(im,1) && y<=size(im,2) && vis(x,y)==0&&im(x,y)==val)
    vis(x,y)=1;

    if(y<imleft)
        leftpoint=[y,x];
        imleft=leftpoint(1);
    end

    if(y>imright)
        rightpoint=[y,x];
        imright=rightpoint(1);
    end

    if(x<imtop)
        toppoint=[y,x];
        imtop=toppoint(2);
    end

    if(x>imbottom)
        bottompoint=[y,x];
        imbottom=bottompoint(2);
    end
    
%if(im(x,y)==val)
    %visited(x,y)=val;
    [vis,leftpoint,rightpoint,toppoint,bottompoint] = paintfill(im,vis,(x-1),y,val,imleft,imright,imtop,imbottom,leftpoint,rightpoint,bottompoint,toppoint);
    [vis,leftpoint,rightpoint,toppoint,bottompoint] = paintfill(im,vis,(x+1),y,val,imleft,imright,imtop,imbottom,leftpoint,rightpoint,bottompoint,toppoint);
    [vis,leftpoint,rightpoint,toppoint,bottompoint] = paintfill(im,vis,x,(y+1),val,imleft,imright,imtop,imbottom,leftpoint,rightpoint,bottompoint,toppoint);
    [vis,leftpoint,rightpoint,toppoint,bottompoint] = paintfill(im,vis,x,(y-1),val,imleft,imright,imtop,imbottom,leftpoint,rightpoint,bottompoint,toppoint);
    [vis,leftpoint,rightpoint,toppoint,bottompoint] = paintfill(im,vis,(x-1),(y-1),val,imleft,imright,imtop,imbottom,leftpoint,rightpoint,bottompoint,toppoint);
    [vis,leftpoint,rightpoint,toppoint,bottompoint] = paintfill(im,vis,(x+1),(y-1),val,imleft,imright,imtop,imbottom,leftpoint,rightpoint,bottompoint,toppoint);
    [vis,leftpoint,rightpoint,toppoint,bottompoint] = paintfill(im,vis,x+1,(y+1),val,imleft,imright,imtop,imbottom,leftpoint,rightpoint,bottompoint,toppoint);
    [vis,leftpoint,rightpoint,toppoint,bottompoint] = paintfill(im,vis,x-1,(y+1),val,imleft,imright,imtop,imbottom,leftpoint,rightpoint,bottompoint,toppoint);
%end
end
%else
 %   varargout=1;
  %  [visited]=paintfill(im,x,y,val);
    
%             visited(i-1,j-1)=1;
%             visited(i,j-1)=1;
%             visited(i+1,j-1)=1;
%             visited(i-1,j)=1;
%             visited(i+1,j)=1;
%             visited(i-1,j+1)=1;
%             visited(i,j+1)=1;
%             visited(i+1,j+1)=1;
              
end

    