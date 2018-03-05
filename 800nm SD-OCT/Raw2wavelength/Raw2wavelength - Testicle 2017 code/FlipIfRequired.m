function[pdRaw]=FlipIfRequired(pdRounded,bFlip)
%Masum 04/27/206

if (bFlip)  pdRaw = flipud(pdRounded);
else
    pdRaw = pdRounded;
end;
clear bFlip pdRounded;

end