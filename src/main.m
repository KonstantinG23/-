clc
clear
close all

ParSt = MyObject;
ParUnst = MyObject;

ParSt.a0 = -0.5;
ParSt.b0 = 1;
ParSt.am = -5; 
ParSt.bm = 5;
ParSt.p = 2;
ParSt.ga = 1;
ParSt.gb = 1;

ParUnst.a0 = 0.5;
ParUnst.b0 = 1;
ParUnst.am = -5;
ParUnst.bm = 5;
ParUnst.p = 2;
ParUnst.ga = 1;
ParUnst.gb = 1;

sim('model.slx')
figure
hold on
grid
plot(ans.plant(:,1),ans.plant(:,2))
plot(ans.ref(:,1),ans.ref(:,2))
legend('plant','ref')