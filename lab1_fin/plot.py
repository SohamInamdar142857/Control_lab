
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import math
import scipy
pi=math.pi





df1 = pd.read_csv("vals - Copy.csv")


plt.plot(df1.t1,df1.final1,color='orange')
plt.ylabel(r"$e(t)$")
plt.xlabel("Time")

plt.grid(True)
plt.show()




