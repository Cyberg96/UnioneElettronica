import numpy as np
import matplotlib.pyplot as plt

# Generazione di due liste di esempio
list1 = np.random.randn(100)
shift_amount = 20
list2 = np.concatenate((np.zeros(shift_amount), list1[:-shift_amount]))

# Calcola la cross-correlazione
c = np.correlate(list1, list2, mode='full')
lags = np.arange(-len(list1) + 1, len(list1))

# Trova l'indice di lag che massimizza la cross-correlazione
max_index = np.argmax(c)
lag_diff = lags[max_index]

# Visualizza xcorr
plt.figure()
plt.plot(lags, c)
plt.title('Cross-correlation')
plt.xlabel('Lags')
plt.ylabel('Correlation')
plt.show()

# Allinea le due liste
if lag_diff < 0:
    aligned_list1 = list1[:lag_diff]
    aligned_list2 = list2[-lag_diff:]
elif lag_diff > 0:
    aligned_list1 = list1[lag_diff:]
    aligned_list2 = list2[:-lag_diff]
else:
    aligned_list1 = list1
    aligned_list2 = list2

# Errore
err = aligned_list1 - aligned_list2
plt.figure()
plt.plot(err)
plt.title('Errore tra le liste allineate')
plt.xlabel('Indice')
plt.ylabel('Errore')
plt.show()

# Visualizza le liste allineate
plt.figure()
plt.subplot(3,1,1)
plt.plot(list1)
plt.title('Lista 1')

plt.subplot(3,1,2)
plt.plot(list2)
plt.title('Lista 2')

plt.subplot(3,1,3)
plt.plot(aligned_list1, label='Lista 1 Allineata')
plt.plot(aligned_list2, label='Lista 2 Allineata')
plt.title('Liste allineate')
plt.legend()

plt.tight_layout()
plt.show()
