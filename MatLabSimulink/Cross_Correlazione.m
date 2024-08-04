%% Enrico Ubaldino

% Generazione di due liste di esempio
list1 = randn(1, 100); % Prima lista di numeri casuali
shift_amount = 20; % Spostamento di 20 posizioni
list2 = [zeros(1, shift_amount), list1(1:end-shift_amount)]; % Seconda lista spostata di 20 posizioni
%list2 = [zeros(1, shift_amount), list1(1:end-2*shift_amount), zeros(1, shift_amount),]; % + rumore
% Calcola la cross-correlazione
[c, lags] = xcorr(list1, list2);

% Trova l'indice di lag che massimizza la cross-correlazione
[~, maxIndex] = max(c);
lagDiff = lags(maxIndex)

% Visualizza xcorr
figure();
plot(lags, c);

% Allinea le due liste
if lagDiff < 0
    alignedList1 = list1(1:end--1*lagDiff);
    alignedList2 = list2(-1*lagDiff+1:end);
elseif lagDiff > 0
    alignedList1 = list1(-lagDiff+1:end);
    alignedList2 = list2(1:end+lagDiff);
else
    alignedList1 = list1;
    alignedList2 = list2;
end

% Errore
err = alignedList1-alignedList2;
figure();
plot(err);

% Visualizza le liste allineate
figure;
subplot(3,1,1);
plot(list1);
title('Lista 1');
subplot(3,1,2);
plot(list2);
title('Lista 2');
subplot(3,1,3);
plot(alignedList1);
hold on;
plot(alignedList2);
title('Liste allineate');
legend('Lista 1 Allineata', 'Lista 2 Allineata');

