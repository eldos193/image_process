function [img] = generateFigure(imgH ,imgW )
img = zeros(imgH,imgW,3);
img = uint8(img);
img(:,:,1)=255;
img(:,:,2)=255;
img(:,:,3)=255;
x=0:2*pi/(imgW-1):2*pi;
y1=sin(x);
y2=cos(x);
y3=x.^2;
x=int32(x/2/pi*imgW);
y1=int32(imgH/40*39-round(y1*imgH/40));
y2=int32(imgH/40*39-round(y2*imgH/40));
y3=int32(imgH/40*39-round(y3*imgH/40));
for i=1:imgW
    if x(i)==0
        x(i)=x(i)+1;
    end
    if y1(i)>0 && y2(i)<=imgH
        img(y1(i),x(i),2)=0;
        img(y1(i),x(i),3)=0;
    end
    if y2(i)>0 && y2(i)<=imgH
        img(y2(i),x(i),3)=0;
        img(y2(i),x(i),1)=0;
    end
    if y3(i)>0 && y3(i)<=imgH
        img(y3(i),x(i),1)=0;
        img(y3(i),x(i),2)=0;
    end
end
img(:,1,:)=0;
img(round(imgH/40*39),:,:)=0;
imshow(img);
end