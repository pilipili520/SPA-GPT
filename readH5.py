import h5py
import matplotlib.pyplot as plt
import numpy as np
import os

# list all h5 file
h5_files = [f for f in os.listdir('.') if f.endswith('.h5')]
print("Available H5 files:")
for idx, file in enumerate(h5_files, 1):
    print(f"{idx}: {file}")

print("======= (^o^) =========")
# select a file
choice = int(input("Enter the number of the file you want to plot (such as \"1: 6-AT89S52_ECC.h5\", input 1): ")) - 1
file_path = h5_files[choice]

# open h5 file
with h5py.File(file_path, 'r') as file:
    def print_keys(name, obj):
        # print key
        if isinstance(obj, h5py.Dataset):
            print(name)
    def plot_dataset(name, obj):
        if isinstance(obj, h5py.Dataset) and 'for_paper' in name:
            data = np.array(obj)
            plt.figure()
            plt.plot(data)
            plt.title(name)
            plt.show()

    # plot
    file.visititems(print_keys)
    file.visititems(plot_dataset)
