close all;
R=1636.661211;
C=47e-9;
k=0.5118;
    Q=2;
    R1=R;
    R3=R;
    R4=((2*(k^2))/(1+(k^2)) )*R;
    R5=((2*(k^2))/(1-(k^2)) )*R;
    R7=Q*(1+(1/(k^2)))*R;
    R8=R;
    R6=Q*(1+(k^2))*R;

    A=10e4;

    C2=C;
    C6=C;

    Ra=R4*R8+R5*R8+R4*R5;
    Ru=R1*R6+R6*R7+R7*R1;

    s=tf('s');


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
wz=sqrt(num3/num1);
qz=num3/(wz*num2)
    func=(num/den);
    wx=((1*2*pi):(10*pi):((1e6)*(2*pi)));
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

