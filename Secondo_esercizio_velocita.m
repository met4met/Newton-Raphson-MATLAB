clear all
clc

% Scrivo i valori dei dati geometrici
z1=1; z3=4; z4=15; delta=40*pi/180;

% ANALISI DI POSIZIONE
q=0;

C=z1*[cos(q), sin(q)]';
B=[z4,0];

zt=norm(B-C);

HB=z3*sin(delta);
HD=z3*cos(delta);

alfa=asin(HB/zt);
phi_t=atan2(B(2)-C(2), B(1)-C(1));

phi2=phi_t+alfa;

z2=zt*cos(alfa)-HD;


% ANALISI DI VELOCITA'
% Come prima cosa per l'analisi di velocità scrivo a velocità della
% coordinata indipendente q_p in rad/s
q_p=12;

% In seguito scrivo la Jacobiana
J=[-z2*sin(phi2)-z3*sin(phi2-delta), cos(phi2);...
    z2*cos(phi2)+z3*cos(phi2-delta), sin(phi2)];

% Do poi a phi1 il valore di q
phi1=q;

% Scrivo allora il vettore A
A=[-z1*sin(phi1); z1*cos(phi1)];

% Ora posso scrivere il vettore soluzione per trovare le incognite
x_p=-inv(J)*A*q_p;

% Posso ora assegnare i due valori di velocità del vettore "x_p"
vel_phi2=x_p(1)
vel_z2=x_p(2)
