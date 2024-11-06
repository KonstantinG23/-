clc
clear
close all
set([figure(1) figure(2) figure(3) figure(4)], 'WindowStyle', 'Docked');
a1_nom = 5;
a2_nom = 1;
a1 = 5;
a2 = 1;
A = [0 a1; -a2 -a2];
b = [0; a2];
c = [1 0];
p = [-5 -5];
k = acker(A,b,p);
kn = 1./(-c/(A-b*k)*b);
pl = [-20 -20];
l = acker(A',c',pl);
x0 = 0;

sim("model.slx");

figure(1)
hold on
grid on
plot(ans.plant.time, ans.plant.signals.values)
plot(ans.plant1.time, ans.plant1.signals.values)
legend("object","modal")

figure(2)
hold on
grid on
plot(ans.plant1.time, ans.plant1.signals.values)
a1 = 3*5;
a2 = 3*1;
sim("model.slx");
plot(ans.plant1.time, ans.plant1.signals.values)
a1 = 3*5/9;
a2 = 3*1/9;
sim("model.slx");
plot(ans.plant1.time, ans.plant1.signals.values)
a1 = a1_nom;
a2 = a2_nom;
legend("a_{1,2} = a_{1,2}", ...
    "a_{1,2} = 3*a_{1,2}", ...
    "a_{1,2} = a_{1,2}/3")

figure(3)
hold on
grid on
plot(ans.plant2.time, ans.plant2.signals.values)
a1 = 3*5;
a2 = 3*1;
sim("model.slx");
plot(ans.plant2.time, ans.plant2.signals.values)
a1 = 3*5/9;
a2 = 3*1/9;
sim("model.slx");
plot(ans.plant2.time, ans.plant2.signals.values,'--')
a1 = a1_nom;
a2 = a2_nom;
legend("a_{1,2} = a_{1,2}", ...
    "a_{1,2} = 3*a_{1,2}", ...
    "a_{1,2} = a_{1,2}/3")

figure(4)
hold on
grid on
for i = -1:0.1:1
    x0 = i;
    sim("model.slx");
    plot(ans.plant2.time, ans.plant2.signals.values)
end
xlim([0 3]);