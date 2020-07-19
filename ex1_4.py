import numpy as np
import matplotlib.pyplot as plt

#Generate data from Normal Distribution
np.random.seed(3)
data = np.random.normal(0, 0.1,(20,200))

to_plot = np.array([])

for j in range(len(data)):
    for i in range(len(data[1])):
        to_plot = np.append(to_plot, np.mean(data[0:j+1,0:i+1]))
    plt.plot(to_plot, linewidth=1.0)
    to_plot = np.array([])

plt.axhline(y=0, color='black')
plt.ylim(-0.05, 0.1)
plt.savefig('foo.eps')
plt.show()

