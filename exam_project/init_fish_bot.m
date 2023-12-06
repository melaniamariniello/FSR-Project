clc 
clear all

%% Fin parameters

d = 0.143;      %width
alpha_fin = pi/3;   %flexible arc angle
R = 0.8;        %arc inner diameter
lambda = 0.419; %wave length
lambda_b = 0.06; %undulating amplitude
u = 0.06;       %undulating amplitude
cf = 6.276*10e-4;    %fin coefficient
zf = 0.16;       %fin center
f_max = 6;        %max undulating freq

%% Propeller parameters

L = 0.281;          %distance between the propellers
alpha = 23.6;        %angle between the diagonal
w_max = 1.047;      %maximum rotating speed
ct = 2.188*10e-7;   %thrust coefficient
cm = 1.944*10e-9;   %reverse torque coefficient
k = cm/ct;          %proportional coefficient of propellers thrust and reverse torque
l = zf;


%% Mass parameters

m = 15.02;       %mass
Jxx = 0.119;     %X axis inertia
Jyy = 0.592;     %Y axis inertia
Jzz = 0.563;     %Z axis inertia
B = 160;         %no-load buoyancy
zb = -0.04;      %buoyant center


%% Damping coefficients

X_u = 0.7164;
Z_w = 10.9893;
K_p = 0.076;
M_q = 0.0264;
N_r = 0.0134;

X_us = 12.4744;
Z_ws = 78.8397;
K_ps = 0.3359;
M_qs = 0.9075;
N_rs = 2.9787;

%% Heave motion

% Z_d = 1;
% phi_d = 0;
% theta_d = 0;
% psi_d = 0;
% wd = 0;
% 
% k0 = 0;
% Kp_z = 80;
% Kd_z = 7;
% Ki_z = 1;
% Kp_z2 = 120;
% Ki_z2 = 2;
% Kd_z2 = 10;
% Kp = 1;
% Kd = 1;
% Ki = 1;
% 
% Kp_psi = 1;
% Ki_psi = 1;
% Kd_psi = 1;
% 
% Kp_psi2 = 1;
% Ki_psi2 = 1;
% Kd_psi = 1;

%% Yaw motion

Z_d = 0;
phi_d = 0;
theta_d = 0;
psi_d = pi/2;
wd = 0;

k0 = 0;
Kp_z = 100;
Kd_z = 7;
Ki_z = 1;

Kp_z2 = 120;
Ki_z2 = 2;
Kd_z2 = 10;

Kp = 3;
Kd = 1;
Ki = 1;

Kp_psi = 90;
Ki_psi = 1;
Kd_psi = 15;

Kp_psi2 = 65;
Ki_psi2 = 1;
Kd_psi = 10;

%% Surge motion
 
% Z_d = 1;
% phi_d = 0;
% theta_d = 0;
% psi_d = 0;
% wd = 100*2*pi/60;
% %wd = 100;
% 
% k0 = 0;
% Kp_z = 120;
% Kd_z = 5;
% Ki_z = 3;
% 
% Kp_z2 = 120;
% Ki_z2 = 2;
% Kd_z2 = 10;
% 
% Kp = 3;
% Kd = 1;
% Ki = 1;
% 
% Kp_psi = 60;
% Ki_psi = 1;
% Kd_psi = 15;
% 
% Kp_psi2 = 50;
% Ki_psi2 = 1;
% Kd_psi = 10;
