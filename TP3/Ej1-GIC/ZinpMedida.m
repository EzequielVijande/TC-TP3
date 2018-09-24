close all;
Num= xlsread('ZinpMedida');
Sim1=xlsread('ZinpSIM');

R=100e3;
f1= Num(:,1);
Zinp= Num(:,2);
faseM= Num(:,3);


f1SIM= Sim1(:,1);
ZinpSIM= Sim1(:,2);
ZinpSIM= 10.^(ZinpSIM./20);
fase1SIM= Sim1(:,3);



figure(1)
semilogx(f1,Zinp, 'xr');
hold on
grid on
title('Magnitud de la impedancia de entrada')
xlabel('f(Hz)');
ylabel('|Zinp|(Ohms)');
hold on
semilogx(f1SIM, ZinpSIM);
hold on
xlim([1e2 1e6]);


figure(2)
semilogx(f1,faseM, 'xr');
hold on
semilogx(f1SIM, fase1SIM);
hold on
grid on
title('Fase de la impedancia de entrada')
xlabel('f(Hz)');
ylabel('Fase(deg)');
xlim([1e2 1e6]);
hold off