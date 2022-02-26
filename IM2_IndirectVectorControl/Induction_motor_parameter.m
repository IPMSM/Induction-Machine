%% Clear & DEFINE
clear;
clc;
IM_VF_DC_Torque = 1;
IM_VF = 1; IM_IndirectVector = 2;
DC_Torque = 0; DC_Speed = 1; VFMode=1;

%% Operating Mode Variable %%
TestMode = IM_VF_DC_Torque; %IM_VF_DC_Torque

% ------- Do not edit here ----------------- %
if (TestMode  == IM_VF_DC_Torque)
    INV1.DriveMode = IM_VF; %IM_VF
    INV2.DriveMode = DC_Torque; % DC_Torque, DC_Speed
end
% ------------------------------------------ %

%% Parameter Initialize
Vdc = 300;
run("LoadMachine_Parameter_Init.m");
run("TestMachine_Parameter_Init.m");

%% INV1 (Induction Machine) Refrence Inputs
INV1.Speed_Ref = 1500; % RPM 
INV1.Fsw = 10e3;
INV1.Tsw = 1/INV1.Fsw;

%% INV2 (DCMotor) Refrence Inputs
INV2.Speed_Ref = 0 ;                    % Speed refrence [rev/min]
INV2.Torque_Ref = 10;                  % Torque refrence [Nm]
INV2.SwitchingFrequency = 10e3;    % Switching frequency [Hz]

%% Inverter GainCal
run("INV1_GainCal.m");
run("INV2_GainCal.m");

%% Run Simulation
sim("IM1_VFControl.slx");

