clear all
clc
%% 3H 4Pole 220V rms Induction Motor
Fs = 60;                %rated freqency motor [Hz]
Ws = Fs*2*pi;           %rated angular frequency
p = 4;                  %number of poles
pp = p/2;               %number of pole paris
P_rate = 3*746;         %rated Power

Wrpm_rated = 1795;       %rated speed
Wrm_rated = 2*pi*Wrpm_rated/60; 
Wr_rated = pp*Wrm_rated;
Vll = 220;              %rated Vline to line
Vs_rated = Vll*sqrt(2) / sqrt(3); %Vs_rated phase voltage (peak)
Jm = 0.089;			%intertia
Bm = 0;
%% Motor Parameters
Rs = 0.435;		Rr = 0.816;
Lls = 0.002;	Llr = 0.002;		Lm = 0.0693;
Ls = Lm + Lls;	Lr = Lm + Llr;
A = 1/(Ls*Lr-Lm*Lm);
sigma = 1-Lm^2/(Ls*Lr);
Kt = (3/2)*pp*(Lm/Lr);
%% FOC 
Pm_rated = 3*746;
Te_rated = pp*Pm_rated/Wr_rated;
Idse_rated = Vs_rated / sqrt(Rs^2 + (Ws*Ls)^2);
Iqse_rated = Te_rated / ((3/2)*pp*(Lm^2/Lr)*Idse_rated);
Lam_r_rated = Lm*Idse_rated;
Lam_dre_rated = Lam_r_rated * 0.8;

Vdc = 1.2*2*Vs_rated;
%% Speed Controller
Wsc = 2*pi*20;          %bandwidth
Kps = Jm*Wsc;
Kis = Kps*Wsc/5;
Kas = 1/Kps;
alpha = 1;              %PI Controller
%% Current Controller
Wcc = 10*Wsc;
Kpc = sigma*Ls*Wcc;
Kic = (Rs + Rr*(Lm/Lr)^2)*Wcc;
Kac = 1/Kpc;
sim('indmotorwithcc',2);

