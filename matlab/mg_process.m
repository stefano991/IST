%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%PLOTS SCALING SCRIPT%%%
%%%     MG PROCESS     %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
clc

%%ITRS years

year=[2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024];

%%
%%MULTIGATE HP
Lg_hp=[20 18 16.7 15.2 13.9 12.7 11.6 10.6 9.7	8.8	8 7.3]; %physical gate length [nm]
Lch_hp=[16 14.4 13.4 12.2 11.1 10.2 9.3 8.5 7.8 7 6.4 5.8]; %effective channel length [nm]
Vdd_hp=[0.86 0.85 0.83 0.81 0.8 0.78 0.77 0.75 0.74 0.72 0.71 0.69]; %power supply voltage [V] 
EOT_hp=[0.8 0.77 0.73 0.7 0.67 0.64 0.61 0.59 0.56 0.54 0.51 0.49]; %equivalent oxide thickness [nm]
eps_HK_hp=[12.5 13 13.5 14 14.5 15 15.5 16 16.5 17 17.5 18]; %dielectric constant of gate dielectric
T_HK_hp=[2.56 2.57 2.53 2.51 2.49 2.46 2.42 2.42 2.37 2.35 2.29 2.26];%physical gate oxide thickness [nm]
CET_hp=[1.1 1.07 1.03 1 0.97 0.94 0.91 0.89 0.86 0.84 0.81 0.79]; %capacitance equivalent thickness [nm]
Cch_hp=[0.502 0.465 0.448 0.42 0.396 0.373 0.352 0.329 0.311 0.289 0.273 0.255]; %[fF/um]
Ioff_hp=[0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1]; %[uA/um]
fr_intr_ratio_hp=[1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2 2 2 2]; %ratio of fringing capacitance to intrinsic
C_fringe_hp=[0.6 0.6 0.63 0.63 0.63 0.63 0.63 0.62 0.62 0.58 0.55 0.51]; %[fF/um]
Cg_tot_hp=[1.1 1.07 1.07 1.05 1.03 1.01 0.99 0.95 0.93 0.87 0.82 0.77];  %[fF/um]
CVsquared_hp=[0.82	0.77 0.74 0.69 0.66 0.61 0.58 0.54 0.51 0.45 0.41 0.36]; %dynamic power indicator [fJ/um]
Idsatn_Idsatp_ratio_hp=[1.25 1.24 1.22 1.21 1.2 1.19 1.18 1.16 1.15 1.14 1.13 1.12];
Ch_doping_hp=[0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1]; %[10^18 cm^(-3)] 
T_body_hp=[6.4	5.8	5.3	4.9	4.4	4.1	3.7	3.4	3.1	2.8	2.6	2.3]; %[nm]
mobility_hp=[250 250 250 250 250 200 200 200 200 200 200 150]; %[cm^(2)/V*s]
Ion_hp=[1670 1680 1700 1660 1660 1610 1600 1480 1450 1350 1330 1170]; %[uA/um]
Vt_lin_hp=[0.219 0.225 0.231 0.239 0.264 0.266 0.265 0.276 0.295 0.303 0.306 0.319]; %[V]							
Vth_hp=[0.174 0.179 0.179 0.186 0.191 0.196 0.199 0.205 0.214 0.219 0.222 0.233]; %[V] in ITRS is Vt,sat
Rsd_hp=[128 146 130 126 124 117 120 116 112 111 113 123]; %[ohm*um]
tau_hp=[0.569 0.541 0.525 0.512 0.496 0.488 0.474 0.483 0.477 0.463 0.437 0.451]; %intrinsic delay [ps]
Vdd_hp_Vth_hp_ratio=Vdd_hp./Vth_hp;
Ion_hp_Ioff_hp_ratio=Ion_hp./Ioff_hp;

%%
%%MULTIGATE LP
Lg_lp=[23 21 19 18 16 14.6 13.3 12.2 11.1 10.1 9.3 8.5]; %physical gate length [nm]
Lch_lp=[18.4 16.8 15.2 14.4 12.8 11.7 10.6 9.8 8.9 8.1 7.4 6.8]; %effective channel length [nm]
Vdd_lp=[0.86 0.85 0.83 0.81 0.8 0.78 0.77 0.75 0.74 0.72 0.71 0.69]; %power supply voltage [V] 
EOT_lp=[0.8 0.77 0.73 0.7 0.67 0.64 0.61 0.59 0.56 0.54 0.51 0.49]; %equivalent oxide thickness [nm]
eps_HK_lp=[12.5 13 13.5 14 14.5 15 15.5 16 16.5 17 17.5 18]; %dielectric constant of gate dielectric
T_HK_lp=[2.56 2.57 2.53 2.51 2.49 2.46 2.42 2.42 2.37 2.35 2.29 2.26];%physical gate oxide thickness [nm]
CET_lp=[1.1 1.07 1.03 1 0.97 0.94 0.91 0.89 0.86 0.84 0.81 0.79]; %capacitance equivalent thickness [nm]
Cch_lp=[0.577 0.542 0.509 0.497 0.455 0.429 0.404 0.379 0.356 0.332 0.317 0.297]; %[fF/um]
Ioff_lp=[10 10 10 10 10 10 10 20 20 20 20 20]; %[pA/um]
fr_intr_ratio_lp=[1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2 2 2]; %ratio of fringing capacitance to intrinsic
C_fringe_lp=[0.64 0.65 0.66 0.7 0.68 0.69 0.69 0.68 0.68 0.66 0.63 0.59]; %[fF/um]
Cg_tot_lp=[1.21 1.19 1.17 1.19 1.14 1.12 1.09 1.06 1.03 1 0.95 0.89];  %[fF/um]
CVsquared_lp=[0.9 0.86 0.81 0.78 0.73 0.68 0.65 0.6 0.57 0.52 0.48 0.42]; %dynamic power indicator [fJ/um]
Idsatn_Idsatp_ratio_lp=[1.25 1.24 1.22 1.21 1.2 1.19 1.18 1.16 1.15 1.14 1.13 1.12];
Ch_doping_lp=[0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1]; %[10^18 cm^(-3)] 
T_body_lp=[7.4 6.7 6.1 5.8 5.1 4.7 4.3 3.9 3.6 3.2 3 2.7]; %[nm]
mobility_lp=[375 375 375 375 375 375 375 300 300 300 300 300]; %[cm^(2)/V*s]
Ion_lp=[643 610 618 589 574 556 550 533 537 461 458 395]; %[uA/um]
Vt_lin_lp=[0.483 0.492 0.492 0.496 0.507 0.507 0.51 0.501 0.507 0.521 0.511 0.52]; %[V]							
Vth_lp=[0.446 0.453 0.453 0.454 0.461 0.459 0.461 0.447 0.446 0.454 0.453 0.46]; %[V] in ITRS is Vt,sat
Rsd_lp=[128 146 130 126 124 117 120 116 112 111 113 123]; %[ohm*um]
tau_lp=[1.622 1.661 1.573 1.64 1.587 1.564 1.525 1.491 1.424 1.556 1.474 1.557]; %intrinsic delay [ps]
Vdd_lp_Vth_lp_ratio=Vdd_lp./Vth_lp;
Ion_lp_Ioff_lp_ratio=Ion_lp./Ioff_lp;

%%
%%Plots

set(0,'DefaultAxesFontSize',13);
set(0,'DefaultTextFontSize',13);
set(0,'DefaultAxesLinewidth',1);
set(0,'DefaultLineLinewidth',1.5);
set(0,'DefaultAxesPosition',[0.15 0.2 0.7 0.6]);

%Drive current
figure
plot(year,Ion_hp, 'r-*')
hold on
plot(year,Ion_lp, 'g-o')
title('MG drive current')
xlabel('Year')
ylabel('Ion [uA/um]')
legend('HP', 'LP')

%Subthreshold current
figure
semilogy(year, 1000.*Ioff_hp, 'r-*')
hold on
semilogy(year, 0.001.*Ioff_lp, 'g-o')
axis([2013 2024 0.001 1000])
title('MG subthreshold current')
xlabel('Year')
ylabel('Ioff [nA/um]')
legend('HP', 'LP')


%Intrinsic delay 
figure
plot(year, tau_hp, 'r-*')
hold on
plot(year, tau_lp, 'g-o')
title('MG Intrinsic delay')
xlabel('Year')
ylabel('Intrinsic delay [ps]')
legend('HP', 'LP')


%Dynamic power indicator
figure
plot(year, CVsquared_hp, 'r-*')
hold on
plot(year, CVsquared_lp, 'g-o')
title('MG Dynamic power indicator')
xlabel('Year')
ylabel('Dynamic power indicator [fJ/um]')
legend('HP', 'LP')


%Vdd/Vth
figure
plot(year, Vdd_hp_Vth_hp_ratio, 'r-*')
hold on
plot(year, Vdd_lp_Vth_lp_ratio, 'g-o')
title('MG Vdd/Vth')
xlabel('Year')
ylabel('Vdd/Vth')
legend('HP', 'LP')


%Ion/Ioff
figure
semilogy(year, Ion_hp_Ioff_hp_ratio, 'r-*')
hold on
semilogy(year, Ion_lp_Ioff_lp_ratio, 'g-o')
title('MG Ion/Ioff')
xlabel('Year')
ylabel('Ion/Ioff')
legend('HP', 'LP')