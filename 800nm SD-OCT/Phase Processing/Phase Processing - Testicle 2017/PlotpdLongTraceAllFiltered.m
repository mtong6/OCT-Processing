
function[]=PlotpdLongTraceAllFiltered(pdLongTraceAllFiltered,D1,D2,D3,D4,D5,D6,D7,D8)


 figure,
    subplot(511),plot(pdLongTraceAllFiltered(D1(1),:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);title('D1');
    subplot(512),plot(pdLongTraceAllFiltered(D1(1)+1,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);
    subplot(513),plot(pdLongTraceAllFiltered(D1(1)+2,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);
    subplot(514),plot(pdLongTraceAllFiltered(D1(1)+3,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);
    subplot(515),plot(pdLongTraceAllFiltered(D1(1)+4,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);

    figure,
    subplot(511),plot(pdLongTraceAllFiltered(D2(1),:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);title('D2');
    subplot(512),plot(pdLongTraceAllFiltered(D2(1)+1,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);
    subplot(513),plot(pdLongTraceAllFiltered(D2(1)+2,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);
    subplot(514),plot(pdLongTraceAllFiltered(D2(1)+3,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);
    subplot(515),plot(pdLongTraceAllFiltered(D2(1)+4,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);
    figure,
    subplot(511),plot(pdLongTraceAllFiltered(D3(1),:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);title('D3');
    subplot(512),plot(pdLongTraceAllFiltered(D3(1)+1,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);
    subplot(513),plot(pdLongTraceAllFiltered(D3(1)+2,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);
    subplot(514),plot(pdLongTraceAllFiltered(D3(1)+3,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);
    subplot(515),plot(pdLongTraceAllFiltered(D3(1)+4,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);
    figure,
    subplot(511),plot(pdLongTraceAllFiltered(D4(1),:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);title('D4');
    subplot(512),plot(pdLongTraceAllFiltered(D4(1)+1,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);
    subplot(513),plot(pdLongTraceAllFiltered(D4(1)+2,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);
    subplot(514),plot(pdLongTraceAllFiltered(D4(1)+3,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);
    subplot(515),plot(pdLongTraceAllFiltered(D4(1)+4,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);
    figure,
    subplot(511),plot(pdLongTraceAllFiltered(D5(1),:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);title('D5');
    subplot(512),plot(pdLongTraceAllFiltered(D5(1)+1,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);
    subplot(513),plot(pdLongTraceAllFiltered(D5(1)+2,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);
    subplot(514),plot(pdLongTraceAllFiltered(D5(1)+3,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);
    subplot(515),plot(pdLongTraceAllFiltered(D5(1)+4,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);
    figure,
    subplot(511),plot(pdLongTraceAllFiltered(D6(1),:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);title('D6');
    subplot(512),plot(pdLongTraceAllFiltered(D6(1)+1,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);
    subplot(513),plot(pdLongTraceAllFiltered(D6(1)+2,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);
    subplot(514),plot(pdLongTraceAllFiltered(D6(1)+3,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);
    subplot(515),plot(pdLongTraceAllFiltered(D6(1)+4,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);
    figure,
    subplot(511),plot(pdLongTraceAllFiltered(D7(1),:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);title('D7');
    subplot(512),plot(pdLongTraceAllFiltered(D7(1)+1,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);
    subplot(513),plot(pdLongTraceAllFiltered(D7(1)+2,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);
    subplot(514),plot(pdLongTraceAllFiltered(D7(1)+3,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);
    subplot(515),plot(pdLongTraceAllFiltered(D7(1)+4,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);
    figure,
    subplot(511),plot(pdLongTraceAllFiltered(D8(1),:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);title('D8');
    subplot(512),plot(pdLongTraceAllFiltered(D8(1)+1,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);
    subplot(513),plot(pdLongTraceAllFiltered(D8(1)+2,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);
    subplot(514),plot(pdLongTraceAllFiltered(D8(1)+3,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);
    subplot(515),plot(pdLongTraceAllFiltered(D8(1)+4,:));xlim([ 1,length(pdLongTraceAllFiltered(D1(1),:))]);
end
