close all;
R1=1e3;
R3=1e3;
R4=1e3;
R5=10e3;
R7=1e3;
R8=1e3;
R6=4e3;

A=1000e9;

C2=100e-9;
C6=100e-9;

Ra=R4*R8+R5*R8+R4*R5;

s=tf('s');
x1=((C2*R3*s)+1);
x2=(R1+2*R6+C6*R6*R7*s);
x3=Ra;

%num=( ((A^2)*R4*R5*R6)/(x2*x3))-( ((A^2)*C2*R3*R4*R5*s)/(x1*x3))+( (A*R1*R6*((C6*R7*s)+1)*(C2*R3*s+A*C2*R3*s+1))/(R7*x1*x2) );
%den= (A/x1)+( ((A^2)*R6)/(x1*x2))+( (A*C2*R3*s)/(x1))-(((A^2)*R5*R6*R8)/(x2*x3))+(((A^2)*C2*R3*R5*R8*s)/(x1*x3))+1;
%Ze Verificacion
num= C2*C6*R3*R6*R7*( R1*Ra*(1+(1/A))-R4*R5*R7)*(s^2)+( C2*R3*R4*R5*R6*R7-(R1+2*R6)*C2*R3*R4*R5*R7+R1*R6*Ra*(C2*R3+( (C6*R7+C2*R3)/A)))*s+...
    R6*(R4*R5*R7+(R1*Ra)/A);
den=R7*( C2*R3*R6*R7*( (Ra/A)+C6*R5*R8+(C6*Ra)/(A^2))*(s^2)+( (C6*R6*R7*Ra)/A+(C2*R3*Ra*(R1+2*R6))/A+(R1+R6)*C2*R3*R5*R8+(Ra/(A^2))*(C2*R1*R3+2*C2*R3*R6+C6*R6*R7))*s...
    +(Ra*(R1+2*R6)*A+R6*Ra*(A^2)-R5*R6*R8*(A^2)+Ra*(R1+2*R6))/(A^2));

func=num/den;
bode(func)
