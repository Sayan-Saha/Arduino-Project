cam=webcam(2);
s=serial('COM5','Baudrate',9600);
fopen(s);
im=snapshot(cam);
    p=size(im);
     diffim=imsubtract(im(:,:,1),rgb2gray(im));
   I=graythresh(diffim);
   bw=im2bw(diffim,I);
   l=bwlabel(bw);
   stats=regionprops(l,'centroid');
  for t=1:length(stats);
      r{t}=stats(t).Centroid;
  end
k=1;
while(k==1)
    im=snapshot(cam);
    p=size(im);
    for i=1:p(1,1)
        for j=1:p(1,2);
             if((im(i,j,1)<80)&&(im(i,j,2)>90)&&(im(i,j,2)<120)&&(im(i,j,3)>140))
   img(i,j)=255;
else
img(i,j)=0;
             end
        end
    end
     L=bwlabel(img);
stats=regionprops(L,'area','centroid');
c=stats(1).Centroid
x1=c(1,1)-20;
x2=c(1,1)+20;
y1=c(1,2)-20;
y2=c(1,2)+20;
figure;imshow(L);
    hold on
    if((c(1,2)<140)&&(c(1,1)>0)&&(c(1,1)<100))
        fwrite(s,'v');
        pause(.7);
            fwrite(s,'r');
            pause(.7);
            fwrite(s,'w');
        k=2;
    else
                   fwrite(s,'w');
    end
    hold off
end
     while(k==2)
        im=snapshot(cam);
    p=size(im);
    for i=1:p(1,1)
        for j=1:p(1,2)
            if((im(i,j,1)<80)&&(im(i,j,2)>90)&&(im(i,j,2)<120)&&(im(i,j,3)>140))
                img(i,j)=255;
            else
                img(i,j)=0;
            end
        end
    end
         L=bwlabel(img);
    stats=regionprops(L,'centroid');
    c=stats(1).Centroid
    x1=c(1,1)-20;
x2=c(1,1)+20;
y1=c(1,2)-20;
y2=c(1,2)+20;
figure;imshow(L)
    hold on
 if(((c(1,2)<140)&&(c(1,1)>240)&&(c(1,1)<290)))
                   fwrite(s,'v');
            pause(.7);
            fwrite(s,'g');
            pause(.7)
            fwrite(s,'u');
            pause(1);
            fwrite(s,'w');
            k=3;
             else
                       fwrite(s,'w');
        end
         hold off
     end
         while(k==3)
  im=snapshot(cam);
    p=size(im);
    for i=1:p(1,1)
        for j=1:p(1,2);
             if((im(i,j,1)<80)&&(im(i,j,2)>90)&&(im(i,j,2)<120)&&(im(i,j,3)>140))
   img(i,j)=255;
else
img(i,j)=0;
             end
        end
    end
 L=bwlabel(img);
stats=regionprops(L,'area','centroid');
c=stats(1).Centroid
x1=c(1,1)-20;
x2=c(1,1)+20;
y1=c(1,2)-20;
y2=c(1,2)+20;
figure;imshow(L);
    hold on
    if((c(1,2)<140)&&(c(1,1)>400)&&(c(1,1)<460))
        fwrite(s,'v');
        pause(.7);
            fwrite(s,'r');
            pause(.7);
            fwrite(s,'w');
k=4;
  else
                   fwrite(s,'w');
    end
    hold off
end
 while(k==4)
  im=snapshot(cam);
    p=size(im);
    for i=1:p(1,1)
        for j=1:p(1,2);
             if((im(i,j,1)<80)&&(im(i,j,2)>90)&&(im(i,j,2)<120)&&(im(i,j,3)>140))
   img(i,j)=255;
else
img(i,j)=0;
             end
        end
    end
 L=bwlabel(img);
stats=regionprops(L,'area','centroid');
c=stats(1).Centroid
x1=c(1,1)-20;
x2=c(1,1)+20;
y1=c(1,2)-20;
y2=c(1,2)+20;
figure;imshow(L);
    hold on
    if((c(1,2)<260)&&(c(1,2)>210)&&(c(1,1)>400)&&(c(1,1)<450))
        fwrite(s,'v');
        pause(.7);
            fwrite(s,'r');
            pause(.7);
            fwrite(s,'w');
k=5;
  else
                   fwrite(s,'w');
    end
    hold off
 end
 while(k==5);
        im=snapshot(cam);
    p=size(im);
    for i=1:p(1,1)
        for j=1:p(1,2)
            if((im(i,j,1)>200)&&(im(i,j,2)>200)&&(im(i,j,3)>200))
                img(i,j)=255;
            else
                img(i,j)=0;
            end
        end
    end
         L=bwlabel(img);
    stats=regionprops(L,'centroid');
    c=stats(1).Centroid
    x1=c(1,1)-20;
x2=c(1,1)+20;
y1=c(1,2)-20;
y2=c(1,2)+20;
    figure;imshow(L)
    hold on
      if((c(1,2)>210)&&(c(1,2)<260)&&(c(1,1)>350)&&(c(1,1)<290))
        fwrite(s,'v');
            pause(.7);
            fwrite(s,'d');
            pause(.7);
            fwrite(s,'m');
            pause(.7);
           fwrite(s,'u');
           pause(.7)
           fwrite(s,'r');
           pause(.7)
           fwrite(s,'v');
  k=6;
        
      else
                     fwrite(s,'w');
      end
       hold off
        end
while(k==6);
        im=snapshot(cam);
    p=size(im);
    for i=1:p(1,1)
        for j=1:p(1,2)
             if((im(i,j,1)<80)&&(im(i,j,2)>90)&&(im(i,j,2)<120)&&(im(i,j,3)>140))
                img(i,j)=255;
            else
                img(i,j)=0;
            end
        end
    end
         L=bwlabel(img);
    stats=regionprops(L,'centroid');
    c=stats(1).Centroid
    x1=c(1,1)-20;
x2=c(1,1)+20;
y1=c(1,2)-20;
y2=c(1,2)+20;
    figure;imshow(L)
    hold on
      if((c(1,2)>200)&&(c(1,2)<240)&&(c(1,1)>190)&&(c(1,1)<250))
        fwrite(s,'v');
            pause(.7);
            fwrite(s,'l');
            pause(.7);
            fwrite(s,'w');
  k=7;
        
      else
                     fwrite(s,'w');
      end
       hold off
        end
while(k==7);
        im=snapshot(cam);
    p=size(im);
    for i=1:p(1,1)
        for j=1:p(1,2)
            if((im(i,j,1)<80)&&(im(i,j,2)>90)&&(im(i,j,2)<120)&&(im(i,j,3)>140))
                img(i,j)=255;
            else
                img(i,j)=0;
            end
        end
    end
         L=bwlabel(img);
    stats=regionprops(L,'centroid');
    c=stats(1).Centroid
    x1=c(1,1)-20;
x2=c(1,1)+20;
y1=c(1,2)-20;
y2=c(1,2)+20;
    figure;imshow(L)
    hold on
      if((c(1,2)>300)&&(c(1,1)>190)&&(c(1,1)<250))
        fwrite(s,'v');
            pause(.7);
            fwrite(s,'l');
            pause(.7);
            fwrite(s,'w');
  k=8;
        
      else
                     fwrite(s,'w');
      end
       hold off
        end
while(k==8);
        im=snapshot(cam);
    p=size(im);
    for i=1:p(1,1)
        for j=1:p(1,2)
            if((im(i,j,1)<80)&&(im(i,j,2)>90)&&(im(i,j,2)<120)&&(im(i,j,3)>140))
                img(i,j)=255;
            else
                img(i,j)=0;
            end
        end
    end
         L=bwlabel(img);
    stats=regionprops(L,'centroid');
    c=stats(1).Centroid
    x1=c(1,1)-20;
x2=c(1,1)+20;
y1=c(1,2)-20;
y2=c(1,2)+20;
    figure;imshow(L)
    hold on
      if((c(1,2)>300)&&(c(1,1)>540)&&(c(1,1)<600))
        fwrite(s,'v');
            pause(.7);
            fwrite(s,'l');
            pause(.7);
            fwrite(s,'w');
  k=9;
        
      else
                     fwrite(s,'w');
      end
       hold off
        end
while(k==9);
        im=snapshot(cam);
    p=size(im);
    for i=1:p(1,1)
        for j=1:p(1,2)
            if((im(i,j,1)<80)&&(im(i,j,2)>90)&&(im(i,j,2)<120)&&(im(i,j,3)>140))
                img(i,j)=255;
            else
                img(i,j)=0;
            end
        end
    end
         L=bwlabel(img);
    stats=regionprops(L,'centroid');
    c=stats(1).Centroid
    x1=c(1,1)-20;
x2=c(1,1)+20;
y1=c(1,2)-20;
y2=c(1,2)+20;
    figure;imshow(L)
    hold on
      if((c(1,2)>230)&&(c(1,2)<260)&&(c(1,1)>540)&&(c(1,1)<560))
        fwrite(s,'v');
            pause(.7);
            fwrite(s,'r');
            pause(.7);
            fwrite(s,'v');
            pause(.7);
            fwrite(s,'w');
            pause(1);
            fwrite(s,'r');
            pause(.7);
            fwrite(s,'w');
  k=10;
        
      else
                     fwrite(s,'w');
      end
       hold off
        end
while(k==10)
           im=snapshot(cam);
    p=size(im);
    for i=1:p(1,1)
        for j=1:p(1,2)
            if((im(i,j,1)<80)&&(im(i,j,2)>90)&&(im(i,j,2)<120)&&(im(i,j,3)>140))
                img(i,j)=255;
            else
                img(i,j)=0;
            end
        end
    end
         L=bwlabel(img);
    stats=regionprops(L,'centroid');
    c=stats(1).Centroid
    x1=c(1,1)-20;
x2=c(1,1)+20;
y1=c(1,2)-20;
y2=c(1,2)+20;
    figure;imshow(L)
    hold on   
           if((c(1,1)>520)&&(c(1,1)<580)&&(c(1,2)<560))
        fwrite(s,'v');
    end
    hold off
end
while(k==10)
           im=snapshot(cam);
    p=size(im);
    for i=1:p(1,1)
        for j=1:p(1,2)
            if((im(i,j,1)<80)&&(im(i,j,2)>90)&&(im(i,j,2)<120)&&(im(i,j,3)>140))
                img(i,j)=255;
            else
                img(i,j)=0;
            end
        end
    end
         L=bwlabel(img);
    stats=regionprops(L,'centroid');
    c=stats(1).Centroid
    x1=c(1,1)-20;
x2=c(1,1)+20;
y1=c(1,2)-20;
y2=c(1,2)+20;
    figure;imshow(L)
    hold on   
           if((c(1,1)>520)&&(c(1,1)<620)&&(c(1,2)>390))
        fwrite(s,'v');
    end
    hold off
end
fclose(s);




