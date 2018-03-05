
load('I:\1310_data\08-12-2015 AP Phase\SavedRawData\6\SaveData2\SThr22_Vol1_to_Vol79_Phase.mat')

figure();
% plot(Var(1:length(Var)/2));
plot(var)

for(i=1:length(Var)/3600)
Var(3600*(i-1)+1:3600*(i-1)+10)=0;
Var(3600*(i-1)+2035:3600*(i-1)+2045)=0;

end

figure();
% plot(Var(1:length(Var)/2));
plot(Var);