p=imread('C:/matlab/new.jpg');
mu=size(p);
crop=imcrop(p,[0 300 1300 750]);
crop = imrotate(crop,300);
red=0;
green=0;
i=0;
j=0;
toplam=0;
vale=0;
en=size(crop);
dj=0;
while dj==0
    
    
    if red==en(1)
       toplam=toplam+red;
        red=0;
        vale=vale+1;
          
    end
  
    red=red+1;
    
    i=crop(red,en(2)-vale,1);
    j=crop(red,en(2)-vale,2);
    k=crop(red,en(2)-vale,3);
    
    if i>100 && j<100 && k<100
    
    dj=1;
        
    end
    
    
    
    if (j>100 && k>100) || (j>100 && i>100) || (i>100 && k>100)
       
        i=40;
    end
    
    
    
     
   
end
disp(toplam);

j=0;

red=1;
k=0;
total=0;
blue=0;
dale=0;
top=0;
while k<100 
    
    
    
    if blue==en(1)
       total=total+blue;
        blue=0;
        dale=dale+1;
          
    end
  
    blue=blue+1;
    
    i=crop(blue,en(2)-dale,1);
    j=crop(blue,en(2)-dale,2);
      k=crop(blue,en(2)-dale,3);
  if(i>200 && j>200 && k<100)
    
        top=total;
    end
      
      if (j>100 && i>100)
       
        k=40;
    end
    
    
     
   
end
kuw=1;
muw=2;
arw=0;
pict= p;
while arw ==0
pict(kuw,720-dale+muw,1)=0;
    pict(kuw,720-dale+muw,2)=0;
    pict(kuw,720-dale+muw,3)=0;
    kuw=kuw+1;
     muw=round(kuw*1.73);
    if kuw==mu(1)
    arw=1;
    end 
     if muw>dale+625
    arw=1;
    end 
end
 
disp(total);

disp(top);


if top==0 && total>toplam
        disp('ofsayt vardir');
        J = insertText(pict, [100 315 ], 'ofsayt vardir','FontSize',55);
else
      disp('ofsayt yoktur');
    J = insertText(pict, [100 315 ], 'ofsayt yoktur','FontSize',55);
   
end

imshow(J);