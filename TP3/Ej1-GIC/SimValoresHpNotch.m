clc;
close all

s=sym('s');
%Resistencias
R1=sym('R1');
R3=sym('R3');
R8=sym('R8');
R4= sym('R4');
R5=sym('R5');
R6=sym('R6');
R7=sym('R7');

%Capacitores
C2=sym('C2');
C6=sym('C6');

A=sym('A');


Avol=A;
z6 = R6;
z7 = R7/((s*C6*R7)+1);
z2=1/(s*C2);
Ra=R4*R8+R5*R8+R4*R5;
Rb=R6*z7+R1*z7+R6*R1;
Ru=R1*R6+R6*R7+R7*R1;


num1=C2*C6*R1*R3*R6*R7*(Ra*(1+1/A)-R4*R5);
num2=(R1*R6*Ra*((C6*R7)/A+C2*R3*(1+1/A))+C2*R3*R4*R5*R6*R7-C2*C6*R1*R3*R4*R5*R6*R7-C2*R3*R4*R5*Ru);
num3=R6*((R1*Ra)/A+R4*R5*R7);

den1=C2*C6*R1*R3*R6*R7*((Ra/A)*(1+1/A)+R5*R8);
den2=( (C6*R1*R6*R7*Ra+C2*R3*Ra*Ru)/A-C2*R3*R5*R6*R7*R8+C2*R3*R5*R8*Ru+(Ra/(A^2))*(C2*R3*Ru+C6*R1*R6*R7));
den3=(Ra*Ru)/A+R6*R7*Ra-R5*R6*R7*R8+(Ru*Ra)/(A^2);

num=num1*(s^2)+...
    num2*s+...
    num3;
den= den1*(s^2)+...
    den2*s+...
    den3;
%calculo parametros y aplico condiciones para resolver.
%wp= sqrt( 1/(den1/den3) );
wz= sqrt( 1/(num1/num3) );
k=(wz/wp);
Q= 1/((den2/den3)*wp);


%Ecuaciones
wp=sym('wp');
eq2= wp== sqrt( 1/(den1/den3) );
eq3= R3==R1;
eq4= R8==R1;
eq5= R4== ((2*(k^2))/(1+(k^2)))*R1;
eq6= R5==((2*(k^2))/(1-(k^2)))*R1;
eq7= R6==(1+(k^2))*Q*R1;
eq8= R7==(1+(1/(k^2)))*Q*R1;
eq9= C2==C6;
eqns=[eq2,eq3,eq4,eq5,eq6,eq7,eq8,eq9];
solnum= solve(num==0, s,'IgnoreAnalyticConstraints', true);
pretty(simplify(solnum))
