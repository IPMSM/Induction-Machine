%% V/F Controller
IM.tacc = 1; %[sec]
IM.acc_rate = IM.Wr_rated/IM.tacc;

%% FOC 
IM.Pm_rated = 3*746;
IM.Te_rated = IM.pp*IM.Pm_rated/IM.Wr_rated;
IM.Idse_rated = IM.Vs_rated / sqrt(IM.Rs^2 + (IM.Ws*IM.Ls)^2);
IM.Iqse_rated = IM.Te_rated / ((3/2)*IM.pp*(IM.Lm^2/IM.Lr)*IM.Idse_rated);
IM.Lam_r_rated = IM.Lm*IM.Idse_rated;
IM.Lam_dre_rated = IM.Lam_r_rated * 0.8;

IM.Vdc = 1.2*2*IM. Vs_rated;
%% Speed Controller
IM.Wsc = 2*pi*20;          %bandwidth
IM.Kps = IM.Jm*IM.Wsc;
IM.Kis = IM.Kps*IM.Wsc/5;
IM.Kas = 1/IM.Kps;
IM.alpha = 1;              %PI Controller
%% Current Controller
IM.Wcc = 10*IM.Wsc;
IM.Kpc = IM.sigma*IM.Ls*IM.Wcc;
IM.Kic = (IM.Rs + IM.Rr*(IM.Lm/IM.Lr)^2)*IM.Wcc;
IM.Kac = 1/IM.Kpc;