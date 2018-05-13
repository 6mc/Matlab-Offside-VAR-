p=imread('C:/matlab/clasico0.jpg');
mu=size(p);
prompt = 'Atak Yonu Ne taraf?';
x = input(prompt);
prompt = 'Hucum eden taraf?';
y = input(prompt);

if x==1
  p=  flip(p,2);
end


%crop=imcrop(p,[0 300 1300 750]);
crop = imrotate(p,12);
mad=size(crop);
d=imcrop(crop,[0 (mad(1)*5)/10 mad(2) mad(1)]); 
d = imrotate(d,288);
d=rgb2gray(d);
mad=size(d);
total=0;
top=0;
blue=1;
dale=1;
i=0;
dj=0;
toplam=0;
while dj<=2
    if dale==mad(2)-5
        dj=4;
    end
    
    if blue==mad(1)
       toplam=toplam+blue;
        blue=1;
        dale=dale+1;
    end
   % disp(blue);
    %disp(mad(2)-dale);
    i=d(blue,mad(2)-dale);
    if dj>0
d(blue,mad(2)-dale)=255;
    end
    
    if i<50 && 2<i
        dj=dj+1;
    end
    
    blue=blue+1;
end
mad=size(d);
total=0;
blue=1;
dale=1;
i=0;
dj=0;
while dj<=2
    if blue==mad(1)
       total=total+blue;
        blue=1;
        dale=dale+1;
    end
   % disp(blue);
    %disp(mad(2)-dale);
    i=d(blue,mad(2)-dale);
     if dj>0
d(blue,mad(2)-dale)=255;
    end
    if i>200
        o=1;
        v=0;
        while o<50
            if d(blue-o,mad(2)-dale)>200
                v=v+1;
            end
        o=o+1;    
        end
        
        
        if v>10
            dj=dj+1;
        end
    end
    
    blue=blue+1;
end



% while arw ==0
% pict(kuw,720-dale+muw,1)=0;
%     pict(kuw,720-dale+muw,2)=0;
%     pict(kuw,720-dale+muw,3)=0;
%     kuw=kuw+1;
%      muw=round(kuw*1.73);
%     if kuw==mu(1)
%     arw=1;
%     end 
%      if muw>dale+625
%     arw=1;
%     end 
% end
 disp(toplam);
disp(total);
disp(v);

%disp(top);

temp=0;
if y ==1
temp = total;
total = toplam;
toplam = temp;
end


if top==0 && total>toplam
        disp('ofsayt vardir');
        J = insertText(p, [100 315 ], 'ofsayt vardir','FontSize',55);
else
      disp('ofsayt yoktur');
    J = insertText(p, [100 315 ], 'ofsayt yoktur','FontSize',55);
   
end
figure,imshow(p);
figure,imshow(d);