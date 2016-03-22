function [ psi0, Qs_B, Qs_approx_B, Qs_app_exp_B  ] = charge_density_B(Na)
%This function returns the total charge density as a function of the
%surface potential for a MOSFET device

VT=0.026; %[V]
q=1.6*10^(-19); %[C]
eps=3.9*8.854*10^(-14); %]F/cm]
Debye_L=sqrt((eps*VT)/(Na*q)); %[cm]
ni=10^10; %intrinsic carrier concentration at 300K
phi_p=VT*log(Na/ni);
psi0=[-2:0.01:2];

Qs_B=abs((-(sqrt(2)*eps*VT)/Debye_L).*(exp(-psi0./VT)+(psi0./VT)-1+(ni^2/Na^2).*(exp(psi0./VT)-(psi0./VT)-1)).^(0.5));
Qs_approx_B=abs((-(sqrt(2)*eps*VT)/Debye_L).*((psi0./VT)+(ni^2/Na^2).*(exp(psi0./VT))).^(0.5));
%Qs_approx_B=abs((-(sqrt(2)*eps*VT)/Debye_L).*((psi0./VT)+exp((psi0-2*phi_p)./VT).^(0.5))); %approximated
Qs_app_exp_B=abs((-sqrt((2*q*eps*Na).*psi0)).*(1+0.5.*(VT.*(psi0.^(-1)).*exp((psi0-2*phi_p)./VT)))); %approximated and expanded around zero

end

