close all;
R1=1e3;
R3=1e3;
R4=1e3;
R5=100e3;
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

k=( R6*(R4*R5*R7+(R1*Ra)/A))/(R7*((Ra*(R1+2*R6))/A+R6*Ra-R5*R6*R8+(Ra*(R1+2*R6))/(A^2)));
w1=sqrt((R4*R5*R7+(R1*Ra)/A)/(C2*C6*R3*R7*(R1*Ra*(1+(1/A))-R4*R5*R7)));
w2=sqrt( ( (Ra*(R1+2*R6))/A+R6*Ra-R5*R6*R8+(Ra*(R1+2*R6))/(A^2))/(C2*R3*R6*R7*(Ra/A+C6*R5*R8+(C6*Ra)/(A^2))) );
q1= (R6*sqrt( (R4*R5*R7+(R1*Ra)/A)*(C2*C6*R3*R7*(R1*Ra*(1+1/A)-R4*R5*R7))))/(C2*R3*R4*R5*R6*R7-(R1+2*R6)*C2*R3*R4*R5*R7+R1*R6*Ra*((C6*R7+C2*R3)/A+C2*R3));
q2= ( sqrt( ((Ra*(R1+2*R6))/A+R6*Ra-R5*R6*R8+(Ra/(A^2))*(R1+2*R6) )*(C2*R3*R6*R7*(Ra/A+C6*R5*R8+(C6*Ra)/A))) )/( (C6*R6*R7*Ra+C2*R3*Ra*(R1+2*R6))/A+(R1+R6)*C2*R3*R5*R8+(Ra/(A^2))*(C2*R1*R3+2*C2*R3*R6+C6*R6*R7)) ;


num= ( (s/w1)^2 )+(s/(w1*q1))+1;
den= ( (s/w2)^2 )+(s/(w2*q2))+1;
func=k*(num/den);
bode(func)
