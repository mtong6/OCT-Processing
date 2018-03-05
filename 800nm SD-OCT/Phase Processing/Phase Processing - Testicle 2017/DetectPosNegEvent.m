function [ event ] = DetectPosNegEvent(a,Thr )
% Summary of this function goes here
%   Detailed explanation goes here


x=a>Thr;

y=a<-Thr;

z=x+y;
p=0;
event=0;

for(i=1:length(z)-1)
 
    p=p+z(i);
    
    if(p>0 && (z(i+1)==0))
      event=event+1 ;
      p=0;
        
    end
    
    
    
end

end

