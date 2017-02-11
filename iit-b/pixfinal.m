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
  for i=1:p(1,1)
        for j=1:p(1,2)
            if((im(i,j,1)>180)&&(im(i,j,2)>190)&&(im(i,j,3)>190))
                img(i,j)=255;
            else
                img(i,j)=0;
            end
        end
  end
    se=strel('disk',4);
im=imopen(img,se);
L=bwlabel(img);
stats=regionprops(L,'centroid');
w=stats(1).Centroid;
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
    figure;imshow(L)
    hold on
        if((c(1,2)>y1{2})&&(c(1,2)<y2{2})&&(c(1,1)>x1{2})&&(c(1,1)<x2{2}))
            fwrite(s,'v');
        pause(.7);
            fwrite(s,'r');
            pause(.7);
            fwrite(s,'v');
            if(c(1,1)<w(1,1))
                fwrite(s,'l');
                pause(.05);
                fwrite(s,'w');
            elseif(c(1,1)>w(1,1))
                fwrite(s,'l');
                pause(.05);
                fwrite(s,'w');
            else
                fwrite(s,'w');
            end
        k=3;
        else
                       fwrite(s,'w');
        end
        hold off
        end
        while(k==3);
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
    figure;imshow(L)
    hold on
        if((c(1,2)>190)&&(c(1,2)<230)&&(c(1,1)>140)&&(c(1,1)<220))
                   fwrite(s,'v');
            pause(.7);
            fwrite(s,'g');
            pause(1);
            fwrite(s,'v');
            if(c(1,1)<b{3}(1,1))
                fwrite(s,'l');
                pause(.05);
                fwrite(s,'w');
            elseif(c(1,1)>b{2}(1,1))
                fwrite(s,'l');
                pause(.05);
                fwrite(s,'w');
            else
                fwrite(s,'w');
            end
             k=4;
        else
                       fwrite(s,'w');
        end
         hold off
         end
        while(k==4);
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
    figure;imshow(L)
    hold on
      if((c(1,2)>y1{2})&&(c(1,2)<y2{2})&&(c(1,1)>x1{2})&&(c(1,1)<x2{2}))
                    fwrite(s,'v');
            pause(.7);
            fwrite(s,'l');
            pause(.7);
            fwrite(s,'v');
            if(c(1,2)<y(1,2))
                fwrite(s,'r');
                pause(.1);
                fwrite(s,'w');
            elseif(c(1,2)>b(1,2))
                fwrite(s,'l');
                pause(.05);
                fwrite(s,'w');
            else
                fwrite(s,'w');
            end
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
    figure;imshow(L)
    hold on
      if((c(1,2)>360)&&(c(1,1)>400)&&(c(1,1)<450))
        fwrite(s,'v');
            pause(.7);
            fwrite(s,'m');
            pause(.7);
           fwrite(s,'u');
           pause(.7)
           fwrite(s,'l');
           pause(.7)
           fwrite(s,'w');
  
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
    figure;imshow(L)
    hold on
      if((c(1,2)>200)&&(c(1,2)<280)&&(c(1,1)>420)&&(c(1,1)<480))
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
    figure;imshow(L)
    hold on
      if((c(1,2)<260)&&(c(1,2)>190)&&(c(1,1)>270)&&(c(1,1)<350))
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
    figure;imshow(L)
    hold on
if((c(1,2)>y1{4})&&(c(1,2)<y2{4})&&(c(1,1)>x1{4})&&(c(1,1)<x2{4}))
        pause(.7);
            fwrite(s,'r');
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
    figure;imshow(L)
    hold on
      if((c(1,2)>y1{5})&&(c(1,2)<y2{5})&&(c(1,1)>x1{5})&&(c(1,1)<x2{5}))
        pause(.7);
            fwrite(s,'r');
            pause(.7);
            fwrite(s,'v');
            if(c(1,1)<r(1,1))
                fwrite(s,'l');
                pause(.05);
                fwrite(s,'w');
            elseif(c(1,1)>r(1,1))
                fwrite(s,'r');
                pause(.05);
                fwrite(s,'w');
            else
                fwrite(s,'w');
            end
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
    figure;imshow(L)
    hold on   
           if((c(1,1)>520)&&(c(1,1)<620)&&(c(1,2)>390))
        fwrite(s,'v');
    end
    hold off
end
fclose(s);
clear all;
      