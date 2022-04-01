%% 获取小球触地时间
clc,clear
sim('my_sldemo_bounce_two_integrators')
BBTGTick = BBCZO.time(BBCZO.data==1);
BBTGn = size(BBTGTick);
for k = 1:BBTGn(1)
    disp(['Bouncing Ball模型小球 第' num2str(k) '次 触地时间为' num2str(BBTGTick(k))])
end
disp(' ')
sim('my_sldemo_doublebounce')
DBBTG1Tick = DBBCZO1.time(DBBCZO1.data==1);
DBBTG1n = size(DBBTG1Tick);
DBBTG2Tick = DBBCZO1.time(DBBCZO2.data==1);
DBBTG2n = size(DBBTG2Tick);
for k = 1:DBBTG1n(1)
    disp(['Double Bouncing Ball模型小球1 第' num2str(k) '次 触地时间为' num2str(DBBTG1Tick(k))])
end
disp(' ')
for k = 1:DBBTG2n(1)
    disp(['Double Bouncing Ball模型小球2 第' num2str(k) '次 触地时间为' num2str(DBBTG2Tick(k))])
end