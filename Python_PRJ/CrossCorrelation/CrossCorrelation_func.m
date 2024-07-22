%% Enrico Ubaldino
function [alignedList1, alignedList2] = CrossCorrelation_func(list1, list2, plot_en)

% Calcola la cross-correlazione
[c, lags] = xcorr(list1, list2);

% Trova l'indice di lag che massimizza la cross-correlazione
[~, maxIndex] = max(c);
lagDiff = lags(maxIndex);

% Allinea le due liste
if lagDiff < 0
    alignedList1 = list1(1:end-(-1*lagDiff));
    alignedList2 = list2((-1*lagDiff)+1:end);
elseif lagDiff > 0
    alignedList1 = list1(lagDiff+1:end);
    alignedList2 = list2(1:end-lagDiff);
else
    alignedList1 = list1;
    alignedList2 = list2;
end

% Errore
err = alignedList1-alignedList2;


% Visualizza le liste allineate
if plot_en
    % Visualizza xcorr
    figure(1);
    plot(lags, c);
    title('XCORR');
    figure(2);
    plot(err);
    title('Error');
    figure(3);
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
end


%save('results.mat','alignedList1','alignedList2');
fid = fopen('aligned_ref.dat', 'w');
fprintf(fid,'%d\n',alignedList1);
fclose(fid);
fid = fopen('aligned_meas.dat', 'w');
fprintf(fid,'%d\n',alignedList2);
fclose(fid);


end
