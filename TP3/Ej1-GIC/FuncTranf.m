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
H=simplify(H,'IgnoreAnalyticConstraints',true);
pretty(H)

Ru=R1*R6+R6*R7+R7*R1;
num1=C2*C6*R1*R3*R6*R7*(Ra*(1+1/A)-R4*R5);
num2=(R1*R6*Ra*((C6*R7)/A+C2*R3*(1+1/A))+C2*R3*R4*R5*R6*R7-C2*C6*R1*R3*R4*R5*R6*R7-C2*R3*R4*R5*Ru);
num3=R6*((R1*Ra)/A+R4*R5*R7);

den1=C2*C6*R1*R3*R6*R7*((Ra/A)*(1+1/A)+R5*R8);
den2=( (C6*R1*R6*R7*Ra+C2*R3*Ra*Ru)/A-C2*R3*R5*R6*R7*R8+C2*R3*R5*R8*Ru+(Ra/(A^2))*(C2*R3*Ru+C6*R1*R6*R7));
den3=(Ra*Ru)/A+R6*R7*Ra-R5*R6*R7*R8+(Ru*Ra)/(A^2);

num1=C2*C6*R1*R3*R6*R7*(Ra-R4*R5);
num2=(R1*R6*Ra*(C2*R3)+C2*R3*R4*R5*R6*R7-C2*C6*R1*R3*R4*R5*R6*R7-C2*R3*R4*R5*Ru);
num3=R6*(R4*R5*R7);

num1=simplify(num1);
num2=simplify(num2);
num3=simplify(num3);
wz=simplify(sqrt(num3/num1));
qz=simplify(num3/(wz*num2));
qaux=simplify(1/(2*qz));
cero1= wz*(-qaux+sqrt( (qaux^2)-(wz^2)));
cero2= wz*(-qaux-sqrt( (qaux^2)-(wz^2)));
cero1=simplify(cero1);
cero2=simplify(cero2);
pretty(cero2)
latex(cero2)