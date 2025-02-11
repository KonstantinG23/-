clc
clear
close all
set([figure(1) figure(2) figure(3) figure(4)], 'WindowStyle', 'Docked');

ParSt = MyObject;
ParUnst = MyObject;

ParSt.a0 = -0.5;
ParSt.b0 = 1;
ParSt.am = -5; 
ParSt.bm = 5;
ParSt.p = 2;
ParSt.ga = 10;
ParSt.gb = 10;

ParUnst.a0 = 0.5;
ParUnst.b0 = 1;
ParUnst.am = -5;
ParUnst.bm = 5;
ParUnst.p = 2;
ParUnst.ga = 10;
ParUnst.gb = 10;

% коэффициенты устойчивой системы
ka = (ParSt.am - ParSt.a0)/ParSt.b0
kb = (ParSt.bm - ParSt.b0)/ParSt.b0

% коэффициенты неустойчивой системы
ka1 = (ParUnst.am - ParUnst.a0)/ParUnst.b0
kb1 = (ParUnst.bm - ParUnst.b0)/ParUnst.b0

sim('model.slx');

% устойчивая система
figure(1)
hold on
grid
plot(ans.plant(:,1),ans.plant(:,2))
plot(ans.ref(:,1),ans.ref(:,2))
legend('plant','ref')

figure(2)
hold on
grid
plot(ans.ka.time, ans.ka.signals.values)
plot(ans.kb.time, ans.kb.signals.values)
legend('k_{a}','k_{b}')

% неустойчивая система
figure(3)
hold on
grid
plot(ans.plant1(:,1),ans.plant1(:,2))
plot(ans.ref1(:,1),ans.ref1(:,2))
legend('plant','ref')

figure(4)
hold on
grid
plot(ans.ka1.time, ans.ka1.signals.values)
plot(ans.kb1.time, ans.kb1.signals.values)
legend('k_{a}','k_{b}')
