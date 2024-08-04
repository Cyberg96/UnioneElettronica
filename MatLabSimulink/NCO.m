%% Enrico Ubaldino
% NCO
clear
clc

%% Parametri dell'oscillatore
Fs = 100e6;            % Frequenza di campionamento (Hz)
N = 1000;            % Numero di campioni
table_size = 2^16;   % Dimensione della tabella

%% Generazione delle tabelle
t = linspace(0, 2*pi, table_size); % Angoli per la tabella
sin_table = sin(t);                % Tabella sinusoidale
tri_table = 2 * (t / (2*pi)) - 1;  % Tabella triangolare

%% Frequenza di Controllo
disp('La frequenza di passo è: F_signal / Fs * Size Table');
freq_ctrl = 1000;  % Frequenza di controllo (Hz)
phase_increment = freq_ctrl / Fs * table_size;
% La frequenza del segnale generato dipende da quanto frequentemente il valore dell'accumulatore cambia.
% Con un incremento di phase_increment per ciclo e una frequenza di campionamento di Fs, 
% l'accumulatore completa un ciclo di table_size stati ogni: 
% Tperiodo = Size Table / frequenza di passo / Fs = Numero di cicli / Fs
Tperiodo = table_size / phase_increment / Fs;
% Check: F_signal = 1 / Tperiodo

%% Inizializzazione dell'accumulatore di fase e indici
phase_accumulator = zeros(1, N);
sin_wave = zeros(1, N);
tri_wave = zeros(1, N);

% Generazione del segnale
for k = 2:N
    % Aggiornamento dell'accumulatore di fase
    phase_accumulator(k) = phase_accumulator(k-1) + phase_increment;
    
    % Modulo per restare entro i limiti della tabella
    index = mod(round(phase_accumulator(k)), table_size) + 1;
    
    % Accesso alle tabelle
    sin_wave(k) = sin_table(index);
    tri_wave(k) = tri_table(index);
end

% Visualizzazione dei segnali
t_axis = (0:N-1) / Fs;  % Asse temporale

figure;
subplot(2,1,1);
plot(t_axis, sin_wave);
xlabel('Tempo (s)');
ylabel('Ampiezza');
title('Segnale Sinusoidale Generato dal NCO');
grid on;

subplot(2,1,2);
plot(t_axis, tri_wave);
xlabel('Tempo (s)');
ylabel('Ampiezza');
title('Segnale Triangolare Generato dal NCO');
grid on;
