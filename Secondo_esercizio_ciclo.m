clear all
clc

% Come prima cosa scrivo i valori dei dati geometrici
z1=1; z3=4; z4=15; delta=40*pi/180;

% Apro una figura su cui plottare i risultati
figure(1)
hold on
axis equal

% Creo un vettore con valori che vanno da 0 a 2*pi con passo 0.1
vetq=[0:0.1:2*pi];

% Scrivo il ciclo grazie al vettore vetq
for i=vetq
    
    % Assegno alla coordinata indipendente il valore iterativo i
    q=i;

    % Riscrivo ora il codice come prima cambiando la parte "plot"    
    C=z1*[cos(q), sin(q)]';
    B=[z4,0];

    zt=norm(B-C);

    HB=z3*sin(delta);
    HD=z3*cos(delta);

    alfa=asin(HB/zt);
    phi_t=atan2(B(2)-C(2), B(1)-C(1));

    phi2=phi_t+alfa;

    z2=zt*cos(alfa)-HD;

    D=[C(1)+z2*cos(phi2), C(2)+z2*sin(phi2)];
    
    % Con "cla" cancello il plot precedente
    cla

    % PLOTTO I RISULTATI
    plot([0, C(1)], [0, C(2)], 'g')
    plot([C(1), D(1)], [C(2), D(2)], 'b')
    plot([D(1), B(1)], [D(2), B(2)], 'r')
    plot([B(1), 0], [B(2), 0], 'y')
    
    % Con "drawnow" aggiorno il grafico ad ogni ciclo, invece di aggiornare
    % la figura al terimine del ciclo for [potrei usare il comando
    % pause(tot) per fermare un ciclo per un "tot" di tempo scelto]
    drawnow

end
