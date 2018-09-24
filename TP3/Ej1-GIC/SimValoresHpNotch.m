clc;
close all

R=1500;
C=47e-9;
k=0.5125;
Q=2;
R1=R;
R3=R;
R4=680;
R5=1.2e3;
R7=15e3;
R8=R;
R6=3.9e3;

A=3.16e5;

C2=C;
C6=C;
s=tf('s');


wo=298;

Avol=A/(1+(s/wo));

z6 = R6;
z7 = R7/((s*C6*R7)+1);
z2=1/(s*C2);
Ra=R4*R8+R5*R8+R4*R5;
Rb=R6*z7+R1*z7+R6*R1;

%Ganancias de caminos directos
G1=( (R4*R5)/Ra )*Avol*( R3/(R3+z2) )*(-Avol);
G2= ( (R1*R6)/Rb )*Avol;
G3= Avol*Avol*( (z7*R6)/Rb )*( (R4*R5)/Ra );

%Ganancias de los loops
loop1=(Avol)*( R3/(R3+z2))*(-Avol)*((R5*R8)/(Ra));
loop2=Avol*( (R6*z7)/Rb )*Avol*( (R5*R8)/Ra);
loop3=(-Avol)*( R3/(R3+z2));
loop4=( (z7*R6)/Rb )*Avol*(-Avol)*(z2/(z2+R3));
loop5=(-Avol)*( z2/(R3+z2));

delta=1-(loop1+loop2+loop3+loop4+loop5);
delta1=1;
delta2=1-loop3;
delta3=1;


H=(G1*delta1+G2*delta2+G3*delta3)/delta;
func=H;
    wx=((1*2*pi):(100*pi):((15e6)*(2*pi)));
    [mag, fase]= bode(func, wx);
    mag2=squeeze(mag);
    fase2=squeeze(fase);
    magDB= 20*log10(mag2);
    f=wx./(2*pi);
    figure(1)
    semilogx(f,magDB);
    hold on
    title('Bode de magnitud');
    xlabel('f(Hz)')
    ylabel('Mag(DB)')
    grid on
    figure(2)
    semilogx(f,fase2);
    hold on
    title('Bode de fase');
    xlabel('f(Hz)')
    ylabel('fase(deg)')
    grid on