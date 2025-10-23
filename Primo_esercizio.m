clear all
clc

% Come prima cosa scrivo i valori dei dati geometrici
z1=0.25; z2=0.36; z3=0.27; z4=0.45;

% Ora scrivo dei valori di primo tentativo in radianti (per fare Newton)
% Scrivo due coppie di valori, così usando uno o l'altro vedo la differenza
incognite=[0.3; 5.2];
% Uso la prima coppia di valori, quindi la seconda la nascondo con "%"
%incognite=[-0.1; -0.2];

% Imposto un epsilon "di arresto"
epsilon=0.001;

% Faccio un ciclo con iterazioni da 60 gradi a 360+60 gradi con passo 5
for i=60:5:420

    % Scrivo la coordinata indipendente in radianti (dipendente da i)
    phi1=i*pi/180;
    
    % Imposto un errore fuori dal ciclo che verrà aggiornato a ogni ciclo
    errore=50;

    max_iter=100; % massimo numero di iterazioni per sicurezza
    iter=0;
    errato=0;

    %Scrivo il ciclo che fa il calcolo del metodo di Newton
    while errore>epsilon

        % Assegno alla variabile phi2 e phi3 i valori delle incognite
        phi2=incognite(1);
        phi3=incognite(2);
    
        % Scrivo la funzione F
        F=[z1*cos(phi1)+z2*cos(phi2)+z3*cos(phi3)-z4;...
           z1*sin(phi1)+z2*sin(phi2)+z3*sin(phi3)];

        % Aggiorno l'errore
        errore=norm(F);

        % Scrivo la Jacobiana
        J=[-z2*sin(phi2), -z3*sin(phi3);...
           z2*cos(phi2), z3*cos(phi3)];
    
        % Scrivo la formula per trovare l'indice i+1
        incognite_piu_1=incognite-inv(J)*F;

        % Aggiorno le incognite con quelle appena calcolate
        incognite=incognite_piu_1;

        % Se la configurazione diverge fa in modo che si passi alla configurazione successiva
        if iter>max_iter
            errato=1;
            break;
        end
        iter = iter + 1;

    end

    % PLOTTO I RISULTATI

    if errato~=1

        % Calcolo le coordinate dei punti B, C, D
        B=[z4; 0];
        C=z1*[cos(phi1); sin(phi1)];
        D=C+z2*[cos(phi2); sin(phi2)];
    
        % Apro la figura 1
        figure(1)
    
        % Mantengo aperta la figura 1 per sovrapporre le linee
        hold on
    
        % Faccio si che gli assi x e y siano uguali
        axis equal
    
        % Plot_1: primo parametro=vettore con solo le componenti x dei due punti...
        % estremi della retta (primo vettore=[Ax, Cx]) secondo parametro=vettore...
        % con solo le componenti y dei due punti estremi della retta (secondo vettore=[Ay, Cy])
        plot([0, C(1)], [0, C(2)], 'g')
    
        % Plot_2: primo parametro=vettore con solo le componenti x dei due punti...
        % estremi della retta (primo vettore=[Cx, Dx]) secondo parametro=vettore...
        % con solo le componenti y dei due punti estremi della retta (secondo vettore=[Cy, Dy])
        plot([C(1), D(1)], [C(2), D(2)], 'b')
    
        % Plot_3: primo parametro=vettore con solo le componenti x dei due punti...
        % estremi della retta (primo vettore=[Dx, Bx]) secondo parametro=vettore...
        % con solo le componenti y dei due punti estremi della retta (secondo vettore=[Dy, By])
        plot([D(1), B(1)], [D(2), B(2)], 'r')
        
        % Forzo matlab ad aggiornare la finestra grafica ad ogni iterazione
        drawnow

    end

end
