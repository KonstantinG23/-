clc
clear
close all
set([figure(1) figure(2) figure(3) figure(4)], 'WindowStyle', 'Docked');

ParSt = MyObject;
ParUnst = MyObject;

ParSt.a0 = [0 1; -2 -4];
ParSt.b0 = [0; 1];
ParSt.am = [0 1; -10 -16]; 
ParSt.bm = [0; 16];
ParSt.p = [2 1; 1 1];
ParSt.ga = [100 0; 0 100];
ParSt.gb = 100;

ParUnst.a0 = [0 1; 2 4];
ParUnst.b0 = [0; 1];
ParUnst.am = [0 1; -10 -16];
ParUnst.bm = [0; 16];
ParUnst.p = [2 1; 1 1];
ParUnst.ga = [100 0; 0 100];
ParUnst.gb = 100;

% коэффициенты устойчивой системы
b0_st = (1./(ParSt.b0'*ParSt.b0)).*(ParSt.b0');
ka = b0_st*(ParSt.am - ParSt.a0)
kb = b0_st*(ParSt.bm - ParSt.b0)

% коэффициенты неустойчивой системы
b0_unst = (1./(ParUnst.b0'*ParUnst.b0)).*(ParUnst.b0');
ka1 = b0_unst*(ParUnst.am - ParUnst.a0)
kb1 = b0_unst*(ParUnst.bm - ParUnst.b0)

sim('model.slx');

% устойчивая система
figure(1)
hold on
grid
plot(ans.plant(:,1),ans.plant(:,2))
plot(ans.ref(:,1),ans.ref(:,2))
legend('plant','ref')

% figure(2)
% hold on
% grid
% plot(ans.ka.time, ans.ka.signals.values)
% plot(ans.kb.time, ans.kb.signals.values)
% legend('k_{a}','k_{b}')

% неустойчивая система
figure(3)
hold on
grid
plot(ans.plant1(:,1),ans.plant1(:,2))
plot(ans.ref1(:,1),ans.ref1(:,2))
legend('plant','ref')

% figure(4)
% hold on
% grid
% plot(ans.ka1.time, ans.ka1.signals.values)
% plot(ans.kb1.time, ans.kb1.signals.values)
% legend('k_{a}','k_{b}')
