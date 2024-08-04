%% Enrico Ubaldino
% Sinusoidi a frequenze ortogonali 

clear
clc

% Parametri
Fs = 1000;            % Frequenza di campionamento (Hz)
T = 1;                % Durata del segnale (secondi)
t = 0:1/Fs:T-1/Fs;    % Vettore del tempo

% Frequenze delle sinusoidi
f1 = 5;   % Frequenza della prima sinusoide (Hz)
f2 = 50;  % Frequenza della seconda sinusoide (Hz)

% Generazione delle sinusoidi
x1 = sin(2*pi*f1*t);  % Prima sinusoide
x2 = sin(2*pi*f2*t);  % Seconda sinusoide

% Calcolo del prodotto scalare
inner_product = trapz(t, x1 .* x2);

% Visualizzazione dei segnali
figure;
subplot(3,1,1);
plot(t, x1);
title('Sinusoide a 5 Hz');
xlabel('Tempo (s)');
ylabel('Ampiezza');

subplot(3,1,2);
plot(t, x2);
title('Sinusoide a 50 Hz');
xlabel('Tempo (s)');
ylabel('Ampiezza');

subplot(3,1,3);
plot(t, x1 .* x2);
title('Prodotto delle due sinusoidi');
xlabel('Tempo (s)');
ylabel('Ampiezza');

% Mostra il prodotto scalare
disp(['Il prodotto scalare delle due sinusoidi è (goal near zero): ', num2str(inner_product)]);
