close all;
Num= xlsread('mequierosuicidar');
Sim1=xlsread('ZoutSim');

f1= Num(:,1);
Zout= Num(:,2);
faseM= Num(:,3);


f1SIM= Sim1(:,1);
ZoutSIM= Sim1(:,2);
ZoutSIM= 10.^(ZoutSIM./20);
fase1SIM= Sim1(:,3);



figure(1)
semilogx(f1,Zout, 'xr');
hold on
grid on
title('Magnitud de la impedancia de salida')
xlabel('f(Hz)');
ylabel('|Zout|(Ohms)');
hold on
semilogx(f1SIM, ZoutSIM);
hold on
xlim([1e2 1e6]);


figure(2)
semilogx(f1,faseM, 'xr');
hold on
semilogx(f1SIM, fase1SIM);
hold on
grid on
title('Fase de la impedancia de salida')
xlabel('f(Hz)');
ylabel('Fase(deg)');
xlim([1e2 1e6]);
hold off