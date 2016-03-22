function [ Ids_sub, Ioff, Vgs ] = subth_current_B( Lg, T_HK, eps_HK, mu, Na, Vdd, Vth)
%This function returns the subthreshold current of a device 

VT=0.026; %[V]
q=1.6*10^(-19); %[C]
eps_s=3.9*8.854*10^(-14); %[F/cm]
eps_ox=eps_HK*8.854*10^(-14); %[F/cm]
ni=10^10; %cm^-3]intrinsic carrier concentration at 300K
N_a=Na*10^18; %[cm^-3]
phi_p=VT*log(N_a/ni);%[V]
Wref=10^-4; %[cm]
Cdep=sqrt(2*eps_s*N_a*q/4*phi_p);%[F/cm]
C_HK=eps_ox/(T_HK*10^(-7));%[F/cm]
m=1+Cdep/C_HK;
Vgs=[0:0.01:Vdd];%[V]
k=((mu*Cdep*VT^2)/(Lg*10^(-7)))*10^2%[uA/um]
Ids_sub=k.*exp((Vgs-Vth)./(m*VT));%[uA/um]
Ioff=k*exp((-Vth)/(m*VT));%[uA/um]

end

