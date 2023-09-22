import h5py
import matplotlib.pyplot as plt
import numpy as np

with h5py.File('3-FPGA_noDelay_RSA.h5', 'r') as f:
	for fkey in f.keys():
		print(f[fkey], fkey)

	print("======= 优雅的分割线 =========")


	paper = f["traces"]["FPGA_RSA_noDelay_for_paper"]
	plt.plot(paper)
	plt.show()







