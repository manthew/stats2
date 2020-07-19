import numpy as np
import matplotlib.pyplot as plt

# Create data
data_t = np.random.standard_t(2, size=(20,200))



# Calculate the mean and median and plot axarr
fig, (ax1, ax2) = plt.subplots(2, sharex = True)
fig.suptitle('Sheet 2 Exercise 4')
ax2.set_ylim([-1, 1])
ax1.set_ylim([-1, 1])
ax1.set_title("Mean")
plt.axhline(y=0, color='black')
ax2.set_title("Median")
plt.axhline(y=0, color='black')

for j in range(len(data_t)):
	Mean = np.array([])
	Median = np.array([])
	for i in range(len(data_t[1])):
		Mean = np.append(Mean, np.mean(data_t[0:j+1, 0:i+1]))
		Median = np.append(Median, np.median(data_t[0:j+1, 0:i+1]))
	ax1.plot(Mean, linewidth=1.0)
	ax2.plot(Median, linewidth=1.0)



print(data_t)
plt.show()