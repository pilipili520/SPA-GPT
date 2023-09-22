## About

This database offers traces that complement the paper titled "SPA-GPT: General Pulse Tailor for Simple Power
Analysis Based on Reinforcement Learning" . The database includes five implementations (software/hardware/software-hardware co-design) of RSA and
one implementations of ECC.

**Files📃 Description:**

**①.h5**📃 files are traces and parameters files. For information on how to handle .h5 files, please refer to the following link (We also provide some sample programs in this repository)：

- Desktop application for visualizing .h5 files: https://support.hdfgroup.org/HDF5/
- python for .h5 files：http://www.h5py.org/
- matlab for .h5 files：https://www.mathworks.com/help/matlab/ref/h5read.html

🔔click the **link** to get the data🔔 
| files                | Algorithm | Implementation | Device     | Trace numbers | Download                                                     |
| -------------------- | --------- | -------------- | ---------- | ------------- | ------------------------------------------------------------ |
| 1-smart_card_RSA.h5  | RSA       | co-design      | smart card | 10            | [link](https://drive.google.com/file/d/18l57iMdCMVx8COCyZ-h9jVELstLTqCyN/view?usp=drive_link) |
| 2-ASICX_RSA.h5       | RSA       | unknown        | ASIC X     | 100           | [link](https://drive.google.com/file/d/1pnWINMGel-jt2wvAbLAFCNGB68N9Eq3L/view?usp=drive_link) |
| 3-FPGA_noDelay_RSA   | RSA       | hardware       | SAKURA-G   | 1             | [link](https://drive.google.com/file/d/10b3yC6SVrGjOxHeLYBQfw3g__-7xpye_/view?usp=drive_link) |
| 4-FPGA_withDelay_RSA | RSA       | hardware       | SAKURA-G   | 10            | [link](https://drive.google.com/file/d/1LVXnNnmmEZNZTtQc5pRrwZSVCsdwhn37/view?usp=drive_link) |
| 5-F429_RSA.h5        | RSA       | software       | STM32F429  | 10            | [link](https://drive.google.com/file/d/1JJ_kOA5KVfE1O9yI09eP-j9MxdNxABAH/view?usp=drive_link) |
| 6-AT89S52_ECC.h5     | ECC       | software       | AT89S52    | 10            | [link](https://drive.google.com/file/d/1eai42ZAfCbiWt08EiDf5NKxtVObKYzPp/view?usp=drive_link) |

>  📌NOTE📌: Due to limited memory size, traces of AT89S52_ECC Only includes the parts related to the private key; SAKURA-G platform has minimal noise impact, and without any protection, it only requires a single trace to recover the private key.

For the explanation of the .h5 file structure, we will use the example of 1-CARD_RSA.h5:

```
├─ 1-card-RSA
│  ├─ metadata
│  ├─ ├─ D
│  ├─ ├─ E
│  ├─ ├─ N
│  ├─ ├─ ciphertext
│  ├─ traces
│  ├─ ├─ CARD_RSA_for_paper
│  ├─ ├─ CARD_RSA_original
```

Explanation for each group:

`metadata`: If a black box device is used, the dataset inside contains only one data point, which is -1. If other data exists, it will be in the form of an array, where each element is a single byte.

`traces`: It stores trace data. In this example, `CARD_RSA_for_paper` contains trace used in the paper, while `CARD_RSA_original contains` original traces collected using an oscilloscope.

②**.py**📃 file is a Python example program for reading .h5 files.

③**.m**📃 file is a MATLAB example program for reading .h5 files.



**Folders📁 Explanation:**

`HDFView`: Visualize and read .h5 files with a Jar application. The version provided here is for Windows; simply double-click the .bat script file to open it. For Linux and other versions, as well as additional usage instructions, please visit [https://www.hdfgroup.org](https://www.hdfgroup.org/).



## For paper

The table below illustrates the **processing** applied to the traces used **in our paper**.

> 📌NOTE📌: The processing methods in the table apply only to the **_for_paper.h5 data.

We use the following formula for low-pass filtering. The meaning of the parameter "low-pass filtered" is 𝑤, and 𝑆𝑖 Indicates the value of the 𝑖th point in the trace.
$$
s_i=\frac{w * s_{i-1}+s_i}{1+w}
$$

| ID   |  Algorithm trace   |                          Truncating                          | Preprocessing                                                | Sample rate |
| ---- | :----------------: | :----------------------------------------------------------: | ------------------------------------------------------------ | :---------: |
| 1    |   smart_card_RSA   | Originally 1562 operations (with an additional multiplication operation at the end), now 1561 operations,  truncated the first segment. | Resampled at 1000000Hz and low-pass filtered at 10           |   12.5M/s   |
| 2    |     ASICX_RSA      | Originally 1536 operations, now 1535, truncated the first three, but only reduce one operation. | Resampled at 5000000Hz, low-pass filtered at 10 and Averaged every 10 waveforms into one. |    25M/s    |
| 3    |  FPGA_noDelay_RSA  | Originally 1531 operations, now 1529, truncated the first three | low-pass filtered at 10                                      |    25M/s    |
| 4    | FPGA_withDelay_RSA | Originally 1531 operations, now 1529, truncated the first three | low-pass filtered at 10                                      |    25M/s    |
| 5    |      F429_RSA      | Originally 1535 operations, now 1533, truncated the first two | Resampled at 1000000Hz and low-pass filtered at 5, moving average 100 |    25M/s    |
| 6    |    AT89S52_ECC     | Originally  192 operations, now 188, truncated the first four | Resampled at 1000000Hz and low-pass filtered at 50           |   125M/s    |





## Copyright and license

