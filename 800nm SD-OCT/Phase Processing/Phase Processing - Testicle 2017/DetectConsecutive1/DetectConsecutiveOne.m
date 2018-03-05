function[B_c]=DetectConsecutiveOne(B,nConsecutiveLength)

if( nConsecutiveLength==1)
   [B_c]=DeleteSingleOne(B);    
end %if( nConsecutiveLength==1)

if( nConsecutiveLength==2)
[B_c]=DeleteDoubleOne(B)
end


end
