% Scrivo l'indice f(z1,z3,z4,z5) che dovrò poi minimizzare
function indice=calcolo_spostamento(z1, z3, z4, z5)

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

    % CALCOLO L'INDICE DA MINIMIZZARE
    % Innanzitutto voglio calcolare il centro medio della traiettoria
    media_x=mean(vet_p(1,:));
    media_y=mean(vet_p(2,:));

    % Calcolo i raggi dal centro medio
    raggi=sqrt((vet_p(1,:)-media_x).^2+(vet_p(2,:)-media_y).^2);

    % Calcolo il raggio medio
    raggio_medio=mean(raggi);

    % Calcolo gli scostamenti dal raggio medio
    variazioni=abs(raggi-raggio_medio);

    % Per trovare l'indice faccio la media di tutte le variazioni
    indice=mean(variazioni);

end
