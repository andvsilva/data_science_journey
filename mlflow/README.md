## Dataset

- ```data/housing.csv```

### Data description

```bash
>>> housing.info()
<class 'pandas.core.frame.DataFrame'>
RangeIndex: 20640 entries, 0 to 20639
Data columns (total 10 columns):
 #   Column              Non-Null Count  Dtype  
---  ------              --------------  -----  
 0   longitude           20640 non-null  float64
 1   latitude            20640 non-null  float64
 2   housing_median_age  20640 non-null  float64
 3   total_rooms         20640 non-null  float64
 4   total_bedrooms      20433 non-null  float64
 5   population          20640 non-null  float64
 6   households          20640 non-null  float64
 7   median_income       20640 non-null  float64
 8   median_house_value  20640 non-null  float64
 9   ocean_proximity     20640 non-null  object 
dtypes: float64(9), object(1)
memory usage: 1.6+ MB

>>> housing["ocean_proximity"].value_counts()
<1H OCEAN     9136
INLAND        6551
NEAR OCEAN    2658
NEAR BAY      2290
ISLAND           5
Name: ocean_proximity, dtype: int64

>>> housing.describe()
          longitude      latitude  ...  median_income  median_house_value
count  20640.000000  20640.000000  ...   20640.000000        20640.000000
mean    -119.569704     35.631861  ...       3.870671       206855.816909
std        2.003532      2.135952  ...       1.899822       115395.615874
min     -124.350000     32.540000  ...       0.499900        14999.000000
25%     -121.800000     33.930000  ...       2.563400       119600.000000
50%     -118.490000     34.260000  ...       3.534800       179700.000000
75%     -118.010000     37.710000  ...       4.743250       264725.000000
max     -114.310000     41.950000  ...      15.000100       500001.000000
```

## Dataset - Club Loans

## [MLFlow](https://mlflow.org/)

### Install

```bash
pip install mlflow
```

### Run

```bash
~/repo/dataset/examples

$ mlflow run mlflow_housing -P k_features=8
$ mlflow ui
```



- [requirements.txt](requirements.txt) - Lista de bibliotecas utilizadas no projeto. Para instalar essas bibliotecas, basta fazer 
```Bash
$ pip3 install -r requirements.txt

#Para criar o arquivo 'requirements.txt'

basta fazer: 
instalar: freeze usando pip
$ pip3 install freeze

$ pip3 freeze > requirements.txt
```

## Download dataset from Kaggle using command line interface

```bash
# If you want make things much more fast, maybe this 
# can help you
# Install kaggle API.
pip install --user kaggle

# Go to your account on the kaggle and create API Token
# https://www.kaggle.com/HERE-YOUR-USERNAME/account?isEditing=False

# This will trigger the download of kaggle.json
# mv kaggle.json ~/.kaggle
ls ~/.kaggle/kaggle.json

# For security, ensure that other users of your
# computer do not have read access to your credentials.
chmod 600 ~/.kaggle/kaggle.json

# To check if this works?
kaggle competitions download -c titanic
ls
titanic.zip

# Or for general
kaggle competitions download -c dataset_name
```