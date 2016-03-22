%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%PLOTS SCALING SCRIPT%%%
%%%     HP FAMILY      %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
clc

%%ITRS years

year=[2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024];
year_B=[2013 2014 2015 2016 2017];


%%
%%Bulk (bulk parameters are marked with _B)
Lg_B=[20 18 16.7 15.2 13.9]; %physical gate length [nm]
Lch_B=[16 14.4 13.4 12.2 11.1]; %effective channel length [nm]
Vdd_B=[0.86 0.85 0.83 0.81 0.8]; %power supply voltage [V]
EOT_B=[0.8 0.77 0.73 0.7 0.67]; %equivalent oxide thickness [nm]
eps_HK_B=[12.5 13 13.5 14 14.5]; %dielectric constant of gate dielectric
T_HK_B=[2.56 2.57 2.53 2.51 2.49];%physical gate oxide thickness [nm]
CET_B=[1.1 1.07 1.03 1 0.97]; %capacitance equivalent thickness [nm]
Cch_B=[0.502 0.465 0.448 0.42 0.396]; %[fF/um]
Ioff_B=[0.100 0.100 0.100 0.100 0.100]; %[uA/um]
fr_intr_ratio_B=[1.2 1.3 1.4 1.5 1.6]; %ratio of fringing capacitance to intrinsic
C_fringe_B=[0.6 0.6 0.63 0.63 0.63]; %[fF/um]
Cg_tot_B=[1.1 1.07 1.07 1.05 1.03];  %[fF/um]
CVsquared_B=[0.82	0.77 0.74 0.69 0.66]; %dynamic power indicator [fJ/um]
Idsatn_Idsatp_ratio_B=[1.25 1.24 1.22 1.21 1.2];
Ch_doping_B=[6 7 7.7 8.4 9]; %[10^18 cm^(-3)] 
mobility_B=[400 400 400 400 400]; %[cm^(2)/V*s]
Ion_B=[1348 1355 1340 1295 1267]; %[uA/um]						
Vt_lin_B=[0.306 0.327 0.334 0.357 0.378]; %[V]						
Vth_B=[0.19 0.2 0.206 0.218 0.23]; %[V]	in ITRS is Vt,sat						
Rsd_B=[188 179 171 162 156]; %[ohm*um]
tau_B=[0.705 0.67 0.666 0.656 0.65]; %intrinsic delay [ps]
Vdd_B_Vth_B_ratio=Vdd_B./Vth_B;
Ion_B_Ioff_B_ratio=Ion_B./Ioff_B;

%%
%Bulk function plots

%Charge density for different nodes (complete Qs model)
[psi0, Qs_B, Qs_approx_B, Qs_app_exp_B]=charge_density_B(Ch_doping_B(1)); %year 2013
set(0,'DefaultAxesFontSize',13);
set(0,'DefaultTextFontSize',13);
set(0,'DefaultLineLinewidth',0.75);
plot(psi0,fliplr(Qs_B),'b-')
axis([-0.2 1.3 0 1E-005])
xlabel('Surface potential Psi(0) [V]')
ylabel('|Charge density| [C/cm^2]')
title('Charge density as a function of surface potential for HP (complete model)')
hold on
[psi0, Qs_B, Qs_approx_B, Qs_app_exp_B]=charge_density_B(Ch_doping_B(3)); %year 2015
plot(psi0,fliplr(Qs_B),'g-')
hold on
[psi0, Qs_B, Qs_approx_B, Qs_app_exp_B]=charge_density_B(Ch_doping_B(5)); %year 2017
plot(psi0,fliplr(Qs_B),'r-')
legend('23nm @2013','19nm @2015','16nm @2017')

% %Charge density with different models (same node) --> ERRORI nei modelli!!!!!
% [psi0, Qs_B, Qs_approx_B, Qs_app_exp_B]=charge_density_B(Ch_doping_B(5)); %year 2017
% figure
% set(0,'DefaultAxesFontSize',13);
% set(0,'DefaultTextFontSize',13);
% set(0,'DefaultLineLinewidth',0.75);
% plot(psi0,fliplr(Qs_B),'b-')
% axis([-0.2 1.4 0 1.2E-005])
% xlabel('Surface potential Psi(0) [V]')
% ylabel('|Charge density| [C/cm^2]')
% title('Charge density in Weak Inversion for HP2017 (16nm)')
% hold on
% [psi0, Qs_B, Qs_approx_B, Qs_app_exp_B]=charge_density_B(Ch_doping_B(5)); %year 2017
% plot(psi0,fliplr(Qs_approx_B),'g-')
% hold on
% [psi0, Qs_B, Qs_approx_B, Qs_app_exp_B]=charge_density_B(Ch_doping_B(5)); %year 2017
% plot(psi0,fliplr(Qs_app_exp_B),'r-')
% legend('Complete model','Approx. model','Approx&Expanded model')
% 
% %Error for approx and app_exp compared to complete model
% err_approx=((Qs_approx_B-Qs_B)./Qs_B).*100;
% err_app_exp=((Qs_app_exp_B-Qs_B)./Qs_B).*100;
% figure
% plot(psi0,err_approx,'g-*',psi0,err_app_exp,'r-*')

%Subthreshold current and behaviour
[Ids_sub,Ioff,Vgs]=subth_current_B(Lg_B(5), T_HK_B(5), eps_HK_B(5), mobility_B(5), Ch_doping_B(5), Vdd_B(5), Vth_B(5));
figure
semilogy(Vgs,Ids_sub)
%axis([0 Vdd_B(5) 1E-24 1E-20])

Ioff



%%
%%MultiGate (multigate parameters just carry their own name)
Lg=[20 18 16.7 15.2 13.9 12.7 11.6 10.6 9.7	8.8	8 7.3]; %physical gate length [nm]
Lch=[16 14.4 13.4 12.2 11.1 10.2 9.3 8.5 7.8 7 6.4 5.8]; %effective channel length [nm]
Vdd=[0.86 0.85 0.83 0.81 0.8 0.78 0.77 0.75 0.74 0.72 0.71 0.69]; %power supply voltage [V] 
EOT=[0.8 0.77 0.73 0.7 0.67 0.64 0.61 0.59 0.56 0.54 0.51 0.49]; %equivalent oxide thickness [nm]
eps_HK=[12.5 13 13.5 14 14.5 15 15.5 16 16.5 17 17.5 18]; %dielectric constant of gate dielectric
T_HK=[2.56 2.57 2.53 2.51 2.49 2.46 2.42 2.42 2.37 2.35 2.29 2.26];%physical gate oxide thickness [nm]
CET=[1.1 1.07 1.03 1 0.97 0.94 0.91 0.89 0.86 0.84 0.81 0.79]; %capacitance equivalent thickness [nm]
Cch=[0.502 0.465 0.448 0.42 0.396 0.373 0.352 0.329 0.311 0.289 0.273 0.255]; %[fF/um]
Ioff=[0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1]; %[uA/um]
fr_intr_ratio=[1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2 2 2 2]; %ratio of fringing capacitance to intrinsic
C_fringe=[0.6 0.6 0.63 0.63 0.63 0.63 0.63 0.62 0.62 0.58 0.55 0.51]; %[fF/um]
Cg_tot=[1.1 1.07 1.07 1.05 1.03 1.01 0.99 0.95 0.93 0.87 0.82 0.77];  %[fF/um]
CVsquared=[0.82	0.77 0.74 0.69 0.66 0.61 0.58 0.54 0.51 0.45 0.41 0.36]; %dynamic power indicator [fJ/um]
Idsatn_Idsatp_ratio=[1.25 1.24 1.22 1.21 1.2 1.19 1.18 1.16 1.15 1.14 1.13 1.12];
Ch_doping=[0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1]; %[10^18 cm^(-3)] 
T_body=[6.4	5.8	5.3	4.9	4.4	4.1	3.7	3.4	3.1	2.8	2.6	2.3]; %[nm]
mobility=[250 250 250 250 250 200 200 200 200 200 200 150]; %[cm^(2)/V*s]
Ion=[1670 1680 1700 1660 1660 1610 1600 1480 1450 1350 1330 1170]; %[uA/um]
Vt_lin=[0.219 0.225 0.231 0.239 0.264 0.266 0.265 0.276 0.295 0.303 0.306 0.319]; %[V]							
Vth=[0.174 0.179 0.179 0.186 0.191 0.196 0.199 0.205 0.214 0.219 0.222 0.233]; %[V] in ITRS is Vt,sat
Rsd=[128 146 130 126 124 117 120 116 112 111 113 123]; %[ohm*um]
tau=[0.569 0.541 0.525 0.512 0.496 0.488 0.474 0.483 0.477 0.463 0.437 0.451]; %intrinsic delay [ps]
Vdd_Vth_ratio=Vdd./Vth;
Ion_Ioff_ratio=Ion./Ioff;
%%
%%Plots

% set(0,'DefaultAxesFontSize',13);
% set(0,'DefaultTextFontSize',13);
% set(0,'DefaultAxesLinewidth',1);
% set(0,'DefaultLineLinewidth',1.5);
% set(0,'DefaultAxesPosition',[0.15 0.2 0.7 0.6]);
% 
% %Drive current
% figure
% plot(year_B,Ion_B, 'r-*')
% hold on
% plot(year,Ion, 'g-o')
% title('HP family: drive current')
% xlabel('Year')
% ylabel('Ion [uA/um]')
% legend('BULK', 'MultiGate')
% 
% %Subthreshold current
% figure
% plot(year_B, 1000.*Ioff_B, 'r-*')
% hold on
% plot(year, 1000.*Ioff, 'g-o')
% title('HP family: subthreshold current')
% xlabel('Year')
% ylabel('Ioff [nA/um]')
% legend('BULK', 'MultiGate')
% 
% %Intrinsic delay 
% figure
% plot(year_B, tau_B, 'r-*')
% hold on
% plot(year, tau, 'g-o')
% title('HP family: Intrinsic delay')
% xlabel('Year')
% ylabel('Intrinsic delay [ps]')
% legend('BULK', 'MultiGate')
% 
% %Dynamic power indicator
% figure
% plot(year_B, CVsquared_B, 'r-*')
% hold on
% plot(year, CVsquared, 'g-o')
% title('HP family: Dynamic power indicator')
% xlabel('Year')
% ylabel('Dynamic power indicator [fJ/um]')
% legend('BULK', 'MultiGate')
% 
% %Vdd/Vth
% figure
% plot(year_B, Vdd_B_Vth_B_ratio, 'r-*')
% hold on
% plot(year, Vdd_Vth_ratio, 'g-o')
% title('HP family: Vdd/Vth')
% xlabel('Year')
% ylabel('Vdd/Vth')
% legend('BULK', 'MultiGate')
% 
% %Ion/Ioff
% figure
% plot(year_B, Ion_B_Ioff_B_ratio, 'r-*')
% hold on
% plot(year, Ion_Ioff_ratio, 'g-o')
% title('HP family: Ion/Ioff')
% xlabel('Year')
% ylabel('Ion/Ioff')
% legend('BULK', 'MultiGate')

