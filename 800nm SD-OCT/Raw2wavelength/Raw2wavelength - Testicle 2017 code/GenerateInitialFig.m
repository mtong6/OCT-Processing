function[f1,f2,f3]=GenerateInitialFig()
% Masum 04/27/2016

scrsz = get(0,'ScreenSize');
f1   = figure('Position',[scrsz(3)*0/3+10 scrsz(4)*2/3-300 scrsz(3)/3 scrsz(4)/2]);
f2  = figure('Position',[scrsz(3)*1/3+20 scrsz(4)*2/3-300 scrsz(3)/3 scrsz(4)/2]);
f3 = figure('Position',[scrsz(3)*2/3+30 scrsz(4)*2/3-300 scrsz(3)/3 scrsz(4)/2]);


% scrsz = get(0,'ScreenSize');
% nY = 3;
% nBottom = 50;
% nTop = 90;
% nX = 5;
% nLeft = 10;
% nRight = 10;
% nHeight = scrsz(4)-nBottom;
% nWidth = scrsz(3)-nLeft;
% f1 = figure('Position',[nLeft+0*nWidth/nX nBottom+2*nHeight/3 nWidth/nX-nRight nHeight/nY-nTop]);
% f2 = figure('Position',[nLeft+1*nWidth/nX nBottom+2*nHeight/3 nWidth/nX-nRight nHeight/nY-nTop]);
% clear scrsz nY nBottom nTop nX nLeft nRight nHeight nWidth;


end