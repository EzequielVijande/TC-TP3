clc;
close all

s=sym('s');
%Resistencias
R1=sym('R1');
R3=sym('R3');
R4=sym('R4');
R5=sym('R5');
R6=sym('R6');
R7=sym('R7');
R8=sym('R8');

%Capacitores
C2=sym('C2');
C6=sym('C6');

A=sym('A');
wo=sym('wo');

Avol=A;

z6 = R6;
z7 = R7/((s*C6*R7)+1);
z2=1/(s*C2);
Ra=R4*R8+R5*R8+R4*R5;
Rb=R6*z7+R1*z7+R6*R7;

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
%H=simplify(H,'IgnoreAnalyticConstraints',true);
pretty(simplify(H,'IgnoreAnalyticConstraints',true))