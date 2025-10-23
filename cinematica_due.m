% Parto con lo script della seconda esercitazione e aggiungo alcuni dati

% Scrivo i valori dei dati geometrici 
delta=40*pi/180;

% ANALISI DI POSIZIONE
counter=1;
for q=0:0.1:2*pi
    
    C=z1*[cos(q), sin(q)]';
    B=[z4,0];
    zt=norm(B-C);
    HB=z3*sin(delta);
    HD=z3*cos(delta);
    alfa=asin(HB/zt);
    phi_t=atan2(B(2)-C(2), B(1)-C(1));
    phi2=phi_t+alfa;
    z2=zt*cos(alfa)-HD;

    % Calcolo le coordinate di P
    vet_p(:, counter)=z1*[cos(q); sin(q)]+z5*[cos(phi2); sin(phi2)];
    % Le colonne di vet_p hanno le coordinate x e y del punto P
    % Esempio: vet_p=[x1p, x2p, x3p, x4p;...
    %                 y1p, y2p, y3p, y4p]
    
    counter=counter+1;

end

% Plotto il luogo dei punti del punto P
figure(1);
axis equal
plot(vet_p(1, :), vet_p(2, :))
