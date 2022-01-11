## [2022 Python for Machine Learning & Data Science Masterclass](https://www.udemy.com/course/python-for-machine-learning-data-science-masterclass/) - Udemy

```Bash
Development > Data Science > Python

Learn about Data Science and Machine Learning with Python!
Including Numpy, Pandas, Matplotlib, Scikit-Learn and more!
```

### What you'll learn
- [x] Master critical data science skills.
- [x] Understand Machine Learning from top to bottom.
- [x] Replicate real-world situations and data reports.
- [x] Learn NumPy for numerical processing with Python.
- [x] Conduct feature engineering on real world case studies.
- [x] Learn Pandas for data manipulation with Python.
- [x] Create supervised machine learning algorithms to predict classes.
- [x] Learn Matplotlib to create fully customized data visualizations with Python.
- [x] Create regression machine learning algorithms for predicting continuous values.
- [x] Learn Seaborn to create beautiful statistical plots with Python.
- [x] Construct a modern portfolio of data science and machine learning resume projects.
- [x] Learn how to use Scikit-learn to apply powerful machine learning algorithms.
- [x] Get set-up quickly with the Anaconda data science stack environment.
- [x] Learn best practices for real-world data sets.
Understand the full product workflow for the machine learning lifecycle.
- [x] Explore how to deploy your machine learning models as interactive APIs.

## Anaconda Python and Jupyter Install and Setup

```bash
$ uname -a
Operation System: Ubuntu GNU/Linux

# install Anaconda

# Download the script to install (maybe change the version)
$ wget -c https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh

# Run the installer script with bash.
$ bash Anaconda3-2021.11-Linux-x86_64.sh

# check the version installed
$ conda --version
conda 4.11.0

# check the list of python in your environment - Anaconda
$ conda list python
packages in environment at ~/anaconda3:

Name                    Version                   Build  Channel
gitpython                 3.1.18                   pypi_0    pypi
ipython                   7.22.0           py38hb070fc8_0  
ipython_genutils          0.2.0              pyhd3eb1b0_1  
msgpack-python            1.0.2            py38hff7bd54_1  
python                    3.8.8                hdb3f193_5  
python-dateutil           2.8.1              pyhd3eb1b0_0  
python-editor             1.0.4                    pypi_0    pypi
python-graphviz           0.17                     pypi_0    pypi
python-jsonrpc-server     0.4.0                      py_0  
python-language-server    0.36.2             pyhd3eb1b0_0  
python-libarchive-c       2.9                pyhd3eb1b0_1  
python_abi                3.8                      2_cp38    conda-forge

# jupyter notebook
$ jupyter-notebook --version
6.3.0
Selected Jupyter core packages...
IPython          : 7.31.0
ipykernel        : 6.6.1
ipywidgets       : 7.6.3
jupyter_client   : 7.1.0
jupyter_core     : 4.9.1
jupyter_server   : 1.4.1
jupyterlab       : 3.0.14
nbclient         : 0.5.3
nbconvert        : 6.0.7
nbformat         : 5.1.3
notebook         : 6.3.0
qtconsole        : 5.0.3
traitlets        : 5.1.1
```

## Basics - Python

- [x] Numpy
- [x] Pandas
- [x] MatLibPlot
- [x] Seaborn Data Visualizations

### NumPy

```bash
Get an overview of the NumPy topics we will discuss in this
course! Numpy is a key part of data science and machine learning.

- NumPy is a Python library used for working with arrays.

$ pip install numpy

$ python
Python 3.8.8 (default, Apr 13 2021, 19:58:26) 
[GCC 7.3.0] :: Anaconda, Inc. on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import numpy as np
>>> print(np.__version__)
1.20.1

Basic Operations With NumPy Array

>>> import numpy as np

# Create an array
>>> arr = np.array([1, 2, 3, 4, 5])

# Mean value of the array
>>> arr.mean()
3.0

# Total amount of deaths
>>> arr.sum()
15

# Smallest value in the array
>>> arr.max()
5
# Largest value in the array
>>> arr.min()
1

Generating Random Numbers With NumPy

>>> import numpy as np

# Generate A Random Number From The Normal Distribution
>>> np.random.normal()
1.069403255270876

# Generate Four Random Numbers From The Normal Distribution
>>> np.random.normal(size=4)
array([-0.51780803, -0.80553996, -0.20331401,  1.42920297])

# Generate Four Random Numbers From The Uniform Distribution
>>> np.random.uniform(size=4)
array([0.44907965, 0.09527948, 0.72465494, 0.11708249])

# Generate Four Random Integers Between 1 and 100
>>> np.random.randint(low=1, high=100, size=4)
array([72, 16, 66, 58])
```

- [x] [Basic Operations With NumPy Array](https://chrisalbon.com/code/python/basics/numpy_array_basic_operations/)
- [x] [Generating Random Numbers With NumPy](https://chrisalbon.com/code/python/basics/generating_random_numbers_with_numpy/)
- [x] [Indexing And Slicing NumPy Arrays
](https://chrisalbon.com/code/python/basics/indexing_and_slicing_numpy_arrays/)
- [x] [Indexing And Slicing NumPy Arrays
](https://chrisalbon.com/code/python/basics/numpy_indexing_and_slicing/)
- [x] [Numpy Array Basics](https://chrisalbon.com/code/python/basics/numpy_array_basics/)
- [x] [NumPy quickstart](https://numpy.org/doc/stable/user/quickstart.html)