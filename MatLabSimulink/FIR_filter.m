%% Enrico Ubaldino
% FIR Filter 

clear
clc

% Definizione delle specifiche del filtro
Fs = 1000;  % Frequenza di campionamento (Hz)
Fc = 100;   % Frequenza di taglio (Hz)
N = 20;     % Ordine del filtro

% Normalizzazione della frequenza di taglio
Wn = Fc / (Fs / 2);

% Progettazione del filtro FIR
b = fir1(N, Wn, 'low');  % Coefficienti del filtro passa-basso

% Generazione di un segnale di esempio
t = 0:1/Fs:1; % Vettore tempo di 1 secondo
x = sin(2*pi*50*t) + sin(2*pi*200*t); % Segnale composto da due sinusoidi

% Applicazione del filtro al segnale
y = filter(b, 1, x);

% Calcolo della FFT del segnale originale e filtrato (check sul tono
% filtrato)
NFFT = 2048; % Numero di punti nella FFT
X = fft(x, NFFT);
Y = fft(y, NFFT);
f = Fs/2*linspace(0,1,NFFT/2+1);

% Visualizzazione del segnale originale e filtrato nel dominio del tempo
figure;
subplot(2,1,1);
plot(t, x);
title('Segnale Originale');
xlabel('Tempo (s)');
ylabel('Ampiezza');

subplot(2,1,2);
plot(t, y);
title('Segnale Filtrato');
xlabel('Tempo (s)');
ylabel('Ampiezza');

% Visualizzazione della FFT del segnale originale e filtrato
figure;
subplot(2,1,1);
plot(f, 2*abs(X(1:NFFT/2+1)));
title('Spettro di Frequenza del Segnale Originale');
xlabel('Frequenza (Hz)');
ylabel('Ampiezza');

subplot(2,1,2);
plot(f, 2*abs(Y(1:NFFT/2+1)));
title('Spettro di Frequenza del Segnale Filtrato');
xlabel('Frequenza (Hz)');
ylabel('Ampiezza');
