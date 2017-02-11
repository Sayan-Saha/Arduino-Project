cam=webcam(2);
s=serial('COM5','Baudrate',9600);
fopen(s);
k=1;
 im=snapshot(cam);
    p=size(im);
    for i=1:p(1,1)
        for j=1:p(1,2)
            if((im(i,j,1)<70)&&(im(i,j,2)<100)&&(im(i,j,3)<100))
                img(i,j)=255;
            else
                img(i,j)=0;
            end
        end
    end
    L=logical(img)
     L=bwareafilt(L,[700 1300]);
     L=bwlabel(L);
    stats=regionprops(L,'centroid');
    for z=1:length(stats)
        b{z}=stats(z).Centroid;
        x1{z}=b{z}(1,1)-40;
        x2{z}=b{z}(1,2)+40;
        y1{z}=b{z}(1,1)-40;
        y2{z}=b{z}(1,2)+40;
    end
   diffim=imsubtract(im(:,:,1),rgb2gray(im));
   I=graythresh(diffim);
   bw=im2bw(diffim,I);
   l=bwlabel(bw);
   stats=regionprops(l,'centroid');
   for t=1:length(stats);
      r{t}=stats(t).Centroid;
   end
  while(k==1)
    im=snapshot(cam);
    p=size(im);
    for i=1:p(1,1)
        for j=1:p(1,2);
             if((im(i,j,1)>130)&&(im(i,j,2)>100)&&(im(i,j,2)<200)&&(im(i,j,3)>150))
   img(i,j)=255;
else
img(i,j)=0;
end
end
    end
L=logical(img);
     L=bwlabel(L);
  stats=regionprops(L,'area','centroid');
c=stats(1).Centroid
figure;imshow(L);
    hold on
 if((c(1,2)>y1{1})&&(c(1,2)<y2{1})&&(c(1,1)>x1{1})&&(c(1,1)<x2{1}))
        fwrite(s,'v');
        pause(.7);
            fwrite(s,'r');
            pause(.7);
            fwrite(s,'v');
            if(c(1,2)<b{2}(1,2))
                fwrite(s,'r');
                pause(.05);
                fwrite(s,'w');
            elseif(c(1,2)>b{2}(1,2))
                fwrite(s,'l');
                pause(.05);
                fwrite(s,'w');
            else
                fwrite(s,'w');
            end
        k=2;
    else
                   fwrite(s,'w');
    end
    hold off
  end
fclose(s)
 