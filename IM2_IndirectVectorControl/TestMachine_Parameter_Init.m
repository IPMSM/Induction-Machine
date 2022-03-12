%% 3H 4Pole 220V rms Induction Motor
IM.Fs = 60;                %rated freqency motor [Hz]
IM.Ws = IM.Fs*2*pi;           %rated angular frequency
IM.p = 4;                  %number of poles
IM.pp = IM.p/2;               %number of pole paris
IM.P_rate = 3*746;         %rated Power

IM.Wrpm_rated = 1795;       %rated speed
IM.Wrm_rated = 2*pi*IM  .Wrpm_rated/60; 
IM.Wr_rated = IM.pp*IM.Wrm_rated;
IM.Vll = 220;              %rated Vline to line
IM.Vs_rated = IM.Vll*sqrt(2) / sqrt(3); %Vs_rated phase voltage (peak)
IM.Jm = 0.089;			%intertia
IM.Bm = 0;
%% Motor Parameters
IM.Rs = 0.435;		IM.Rr = 0.816;
IM.Lls = 0.002;	IM.Llr = 0.002;		IM.Lm = 0.0693;
IM.Ls = IM.Lm + IM.Lls;	IM.Lr = IM.Lm + IM.Llr;
IM.A = 1/(IM.Ls*IM.Lr-IM.Lm*IM.Lm);
IM.sigma = 1-IM.Lm^2/(IM.Ls*IM.Lr);
IM.Kt = (3/2)*IM.pp*(IM.Lm/IM.Lr);
