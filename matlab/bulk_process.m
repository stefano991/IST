%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%PLOTS SCALING SCRIPT%%%
%%%    BULK PROCESS    %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
clc

%%ITRS years

year=[2013 2014 2015 2016 2017];


%%
%%Bulk HP 
Lg_hp=[20 18 16.7 15.2 13.9]; %physical gate length [nm]
Lch_hp=[16 14.4 13.4 12.2 11.1]; %effective channel length [nm]
Vdd_hp=[0.86 0.85 0.83 0.81 0.8]; %power supply voltage [V]
EOT_hp=[0.8 0.77 0.73 0.7 0.67]; %equivalent oxide thickness [nm]
eps_HK_hp=[12.5 13 13.5 14 14.5]; %dielectric constant of gate dielectric
T_HK_hp=[2.56 2.57 2.53 2.51 2.49];%physical gate oxide thickness [nm]
CET_hp=[1.1 1.07 1.03 1 0.97]; %capacitance equivalent thickness [nm]
Cch_hp=[0.502 0.465 0.448 0.42 0.396]; %[fF/um]
Ioff_hp=[0.100 0.100 0.100 0.100 0.100]; %[uA/um]
fr_intr_ratio_hp=[1.2 1.3 1.4 1.5 1.6]; %ratio of fringing capacitance to intrinsic
C_fringe_hp=[0.6 0.6 0.63 0.63 0.63]; %[fF/um]
Cg_tot_hp=[1.1 1.07 1.07 1.05 1.03];  %[fF/um]
CVsquared_hp=[0.82	0.77 0.74 0.69 0.66]; %dynamic power indicator [fJ/um]
Idsatn_Idsatp_ratio_hp=[1.25 1.24 1.22 1.21 1.2];
Ch_doping_hp=[6 7 7.7 8.4 9]; %[10^18 cm^(-3)] 
mobility_hp=[400 400 400 400 400]; %[cm^(2)/V*s]
Ion_hp=[1348 1355 1340 1295 1267]; %[uA/um]						
Vt_lin_hp=[0.306 0.327 0.334 0.357 0.378]; %[V]						
Vth_hp=[0.19 0.2 0.206 0.218 0.23]; %[V]	in ITRS is Vt,sat						
Rsd_hp=[188 179 171 162 156]; %[ohm*um]
tau_hp=[0.705 0.67 0.666 0.656 0.65]; %intrinsic delay [ps]
Vdd_hp_Vth_hp_ratio=Vdd_hp./Vth_hp;
Ion_hp_Ioff_hp_ratio=Ion_hp./Ioff_hp;

%%
%%Bulk LP
Lg_lp=[23 21 19 18 16]; %physical gate length [nm]
Lch_lp=[18.4 16.8 15.2 14.4 12.8]; %effective channel length [nm]
Vdd_lp=[0.86 0.85 0.83 0.81 0.8]; %power supply voltage [V]
EOT_lp=[0.8 0.77 0.73 0.7 0.67]; %equivalent oxide thickness [nm]
eps_HK_lp=[12.5 13 13.5 14 14.5]; %dielectric constant of gate dielectric
T_HK_lp=[2.56 2.57 2.53 2.51 2.49];%physical gate oxide thickness [nm]
CET_lp=[1.1 1.07 1.03 1 0.97]; %capacitance equivalent thickness [nm]
Cch_lp=[0.577 0.542 0.509 0.497 0.455]; %[fF/um]
Ioff_lp=[10 10 20 20 50]; %[pA/um]
fr_intr_ratio_lp=[1.1 1.2 1.3 1.4 1.5]; %ratio of fringing capacitance to intrinsic
C_fringe_lp=[0.64 0.65 0.66 0.7 0.68]; %[fF/um]
Cg_tot_lp=[1.21 1.19 1.17 1.19 1.14];  %[fF/um]
CVsquared_lp=[0.9 0.86 0.81 0.78 0.73]; %dynamic power indicator [fJ/um]
Idsatn_Idsatp_ratio_lp=[1.27 1.26 1.25 1.24 1.22];
Ch_doping_lp=[5 6 7 7.7 8.4]; %[10^18 cm^(-3)] 
mobility_lp=[400 400 400 400 400]; %[cm^(2)/V*s]
Ion_lp=[490 459 456 485 422]; %[uA/um]						
Vt_lin_lp=[0.619 0.639 0.636 0.676 0.647]; %[V]						
Vth_lp=[0.528 0.543 0.533 0.54 0.53]; %[V]	in ITRS is Vt,sat						
Rsd_lp=[188 179 171 162 156]; %[ohm*um]
tau_lp=[2.128 2.08 2.132 1.992 2.159]; %intrinsic delay [ps]
Vdd_lp_Vth_lp_ratio=Vdd_lp./Vth_lp;
Ion_lp_Ioff_lp_ratio=(1000000.*Ion_lp)./Ioff_lp;

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
title('BULK drive current')
xlabel('Year')
ylabel('Ion [uA/um]')
legend('HP', 'LP')

%Subthreshold current
figure
semilogy(year, 1000.*Ioff_hp, 'r-*')
hold on
semilogy(year, 0.001.*Ioff_lp, 'g-o')
title('BULK subthreshold current')
axis([2013 2017 0.001 1000])
xlabel('Year')
ylabel('Ioff [pA/um]')
legend('HP', 'LP')


%Intrinsic delay 
figure
plot(year, tau_hp, 'r-*')
hold on
plot(year, tau_lp, 'g-o')
title('BULK Intrinsic delay')
xlabel('Year')
ylabel('Intrinsic delay [ps]')
legend('HP', 'LP')


%Dynamic power indicator
figure
plot(year, CVsquared_hp, 'r-*')
hold on
plot(year, CVsquared_lp, 'g-o')
title('BULK Dynamic power indicator')
xlabel('Year')
ylabel('Dynamic power indicator [fJ/um]')
legend('HP', 'LP')


%Vdd/Vth
figure
plot(year, Vdd_hp_Vth_hp_ratio, 'r-*')
hold on
plot(year, Vdd_lp_Vth_lp_ratio, 'g-o')
title('BULK Vdd/Vth')
xlabel('Year')
ylabel('Vdd/Vth')
legend('HP', 'LP')


%Ion/Ioff
figure
semilogy(year, Ion_hp_Ioff_hp_ratio, 'r-*')
hold on
semilogy(year, Ion_lp_Ioff_lp_ratio, 'g-o')
title('BULK Ion/Ioff')
xlabel('Year')
ylabel('Ion/Ioff')
legend('HP', 'LP')

