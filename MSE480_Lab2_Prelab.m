clc
clear all
close all

syms theta1 theta2 theta3 theta4 theta5
d1=6.193; L2=14.605; L3=18.733; d5=9.843; %cm

A_01=[cosd(theta1) -sind(theta1)*cosd(90) sind(theta1)*sind(90)  0*cosd(theta1);
         sind(theta1)  cosd(theta1)*cosd(90)  -cosd(theta1)*sind(90) 0*sind(theta1);
         0             sind(90)               cosd(90)               d1;
         0             0                      0                      1];

A_12=[cosd(theta2+90) -sind(theta2+90)*cosd(0) sind(theta2+90)*sind(0)  L2*cosd(theta2+90);
         sind(theta2+90)  cosd(theta2+90)*cosd(0)  -cosd(theta2+90)*sind(0) L2*sind(theta2+90);
         0             sind(0)               cosd(0)               0;
         0             0                     0                     1];
     
A_23=[cosd(theta3-90) -sind(theta3-90)*cosd(0) sind(theta3-90)*sind(0)  L3*cosd(theta3-90);
         sind(theta3-90)  cosd(theta3-90)*cosd(0)  -cosd(theta3-90)*sind(0) L3*sind(theta3-90);
         0             sind(0)               cosd(0)               0;
         0             0                     0                     1];
  
A_34=[cosd(theta4+90) -sind(theta4+90)*cosd(90) sind(theta4+90)*sind(90)  0*cosd(theta4+90);
         sind(theta4+90)  cosd(theta4+90)*cosd(90)  -cosd(theta4+90)*sind(90) 0*sind(theta4+90);
         0             sind(90)               cosd(90)               0;
         0             0                      0                      1];
     
A_45=[cosd(theta5) -sind(theta5)*cosd(0) sind(theta5)*sind(0) 0*cosd(theta5);
         sind(theta5)  cosd(theta5)*cosd(0) -cosd(theta5)*sind(0) 0*sind(theta5);
         0             sind(0)               cosd(0)              d5;
         0             0                     0                    1];
     
T_0t=A_01*A_12*A_23*A_34*A_45;

%UNCOMMENT WHICH CASE TO TEST%%%%%%%%%%%%%%%%%%%%%%%
%case1
theta1=0; theta2=0; theta3=0; theta4=0; theta5=-90;

%case2
%theta1=0; theta2=-16.6; theta3=-37.5; theta4=54.1; theta5=0;

%case3
%theta1=33.7; theta2=-8.1; theta3=-23.4; theta4=-58.4; theta5=33.7;

%case4
%theta1=33.7; theta2=-8.1; theta3=-23.4; theta4=-58.4; theta5=-33.7;

T_0t=double(subs(T_0t))

Position = T_0t(1:3,4)
RotX = atan2d(T_0t(3,2),T_0t(3,3)) 
RotY = atan2d(-T_0t(3,1),sqrt(T_0t(3,2)^2 +T_0t(3,3)^2))
RotZ = atan2d(T_0t(2,1),T_0t(1,1))
