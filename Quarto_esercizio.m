clf
clear
clc

% Per prima cosa scrivo i dati della sospensione
c=2; k=800; delta=0.5; m=30; g=9.8;

% In seguito scrivo i dati della strada
A=0.05; omega=1;

% Scrivo poi i dati della simulazione
t_finale=60;        % 60 secondi
n=100000;           % num di iterazioni
delta_t=t_finale/n; % lunghezza intervallini

% Scrivo inoltre le condizioni iniziali
xi=0;
vel_xi=0;

t=0;

% Ora posso partire con le iterazioni
for counter=1:n

    % Scrivo infine, tramite y, l'andamento della strada
    y=A*sin(omega*t);
    y_punto=A*omega*cos(omega*t);     % Derivata di y

    % Ho tutto per trovare la Forza esterna
    F_esterna=k*delta-m*g+k*y+c*y_punto;

    % Ho trovato così la forza esterna, e posso calcolare l'accelerazione
    acc_xi=1/m*(F_esterna-c*vel_xi-k*xi);

    % Posso poi trovare velocità e posizione ai passi i+1
    vel_xii=vel_xi+delta_t*acc_xi;
    % Per trovare la posizione (i+1)-esima uso la velocità (i+1)-esima,
    % questo perchè la velocità i-esima crea instabilità
    xii=xi+delta_t*vel_xi;


    % SALVO I RISULTATI
    % Creo un vettore in cui salvo tutti i dati delle posizioni xi
    vet_x(counter)=xi;

    % Ed un vettore in cui salvo le forze esterne
    vet_F_esterna(counter)=F_esterna;

    % Inoltre creo un vettore per i tempi che metterò in ordinata
    vet_t(counter)=t;


    % Aggiorno infine le variabili
    t=t+delta_t;
    xi=xii;
    vel_xi=vel_xii;

end

% PLOTTO I RISULTATI
% Plotto sia la posizione della massa sia la forza esterna in questo modo
figure(1)
plot(vet_t,vet_x)
figure(2)
plot(vet_t,vet_F_esterna)
