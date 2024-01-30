## Generate Fake Data (Only for Tests)

#### **Microsoft Azure AI Fundamentals**

To run just type on the terminal:

### Install - requirements.txt

```bash
cd dataset/
pip install -r requirements.txt

# run generator - dataset # 100 --> number of observations/
# columns already predifine - 10
python gendata.py 100                                         
----------------------------- DATABASE ----------------------------
Waiting...: 100%|█████████████████████████████████████████████████████████████████████████████ [ time left: 00:00 ]
    satisfaction  evaluation  projectCount  averageMonthlyHours  ...  turnover  promotion  dept  salary
0           0.09        0.69             6                  187  ...         1          0     4       0
1           0.20        0.53             7                   96  ...         0          0     6       2
2           0.20        0.19             3                  224  ...         0          0     0       2
3           0.53        0.89             1                  158  ...         0          1     9       2
4           0.33        0.77             4                  226  ...         1          0     6       1
..           ...         ...           ...                  ...  ...       ...        ...   ...     ...
95          0.08        0.99             2                  255  ...         0          0     6       2
96          0.76        0.36             3                  207  ...         1          1     1       2
97          0.44        0.23             3                  213  ...         1          0     5       2
98          0.60        0.78             5                  227  ...         0          0     2       0
99          0.03        0.84             3                  240  ...         0          0     4       0

[100 rows x 10 columns]
saving the file format feather...
memory RAM released.
time of execution: 0.0231 minutes
Tue Jan 30 03:15:33 PM -03 2024
All Done. :)

```