% Per prima cosa definisco la funzione da minimizzare
fun=@(x) calcolo_spostamento(x(1), x(2), x(3), x(4))

% Scrivo ora un valore di primo tentativo (quelli usati nella seconda
% esercitazione, così sappiamo che il meccanismo è assemblabile)
x0=[1, 4, 15, 18];

% Per minimizzare l'indice, posso inserire dei vincoli al sistema
% Scrivo il limite inferiore (non voglio che i valori scendano più di così)
lb=[0.1, 0.1, 1, 0.1];

% Scrivo il limite superiore (non voglio che i valori salgano più di così)
ub=[20, 20, 50, 50];

% Posso settare alcuni parametri così che il sistema di ottimizzazione
% cerchi delle variabili in base ad essi (12:00 14/04)
options=optimoptions('fmincon','Display','iter','Algorithm','sqp')

% Gli output della funzione li chiamo "x_opt" e "fval"
[x_opt, fval]=fmincon(fun, x0, [], [], [], [], lb, ub, [], options);

% "x_opt" sono i valori di z1, z3, z4, z5
z1=x_opt(1);
z3=x_opt(2);
z4=x_opt(3);
z5=x_opt(4);

% Ora voglio visualizzare il risultato (mi servo dello script cinematica_due.m)
cinematica_due
