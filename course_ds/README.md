## [Data Science & Machine Learning(Theory+Projects)A-Z 90 HOURS](https://www.udemy.com/course/data-science-machine-learningtheoryprojectsa-z-90-hours/) - Udemy

```Bash
Development > Data Science > Python

About this course
Data Science Python-Learn Statistics for Data Science,
Machine Learning for Data Science, Deep Learning for Data Science

By the numbers
Skill level: All Levels
Students: 2204
Languages: English
Captions: Yes
Lectures: 734
Video: 94 total hours
Certificates
Get Udemy certificate by completing entire course
```

### What you'll learn
- [x] Key data science and machine learning concepts right from the beginning with a complete unfolding with examples in Python
- [x] Essential Concepts and Algorithms in Machine Learning
- [x] Python for Data Science and Data Analysis
- [x] Data Understanding and Data Visualization with Python
- [x] Probability and Statistics in Python
- [x] Feature Engineering and Dimensionality Reduction with Python
- [x] Artificial Neural Networks with Python
- [x] Convolutional Neural Networks with Python
- [x] Recurrent Neural Networks with Python
- [x] Detailed Explanation and Live Coding with Python
- [x] Building your own AI applications.

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
```
## Basics - Python

- [x] Numpy
- [x] Pandas
- [x] Matplotlib
- [x] Seaborn Data Visualizations

- SOURCE: [Notes On Using
Data Science & Machine Learning](https://chrisalbon.com/#machine_learning)
# Table of Contents

1. [Section 1: Introduction to the course]()
2. [Section 2: Basics for Data Science: Python for Data Science and data Analysis]()
3. [Section 3: Basics for Data Science: Data Understanding and Data Visualization with Python]()

## Section 1: Introduction to the course

- **Focus - General**
  - Problem solving
  - Why Python?
    - Beginner friendly
    - Versatile and flexible
    - Most mature package libraries around
    - Most popular in Machine Learning world
  - Data Science
  - Live Coding of each and every concept
  - Live Problem Solving Practice
  - Trend Analysis of real Covid-19 data set

## Section 2: Basics for Data Science: Data Understanding and Data Visualization with Python

- **Basics of programming**
  - Understading the Algorithm
  - FlowCharts and Pseudocodes
    - Powerful tool to see the workflow of the algorithm
  - Example of algorithms-Making Tea Problem
  - Example of algorithm-Searching Minimun
  - Example of algorithm-Sorting Problem
  - Sorting Problem in python
  - ipython
  - Jupyter Notebook
  - Anaconda
  - Variable and Operator
  - Bool Data type in Python
  - Comparison in Python
  - Python Useful function
  - Function and Module in Python
    - Function Practice-Output Arguments and Return Statement
    - Variable Number of input Arguments
  - String in Python
    - Methods
  - Data Structures
    - List
    - Tuple
    - Set
    - Dictionary
  - Numpy for Numerical Data processing
  - Pandas for Data Manipulation
    - MatPlotLib
    - Seaborn
  - Scikit-Learn for Machine Learning
    - SVC
    - Random Forest Classifier

## Section 3: Basics for Data Science: Data Understanding and Data Visualization with Python

- Engaging Examples
- Real Data sets
- Numpy more functions
- Images as Numpy arrays
- Manipulating images
- K-nearest-neighbor classifier using Numpy (KNN Classifier)
- Example on iris data
- KNN classifier from Scratch
- Numpy(Structure Data)
- Numpy towars Pandas
- Pandas (Grouping)
- Pandas (Where)
  - ```df.where(cond,action)```
- Pandas (clip)
  - ```df.clip(lower,upper)```
- Pandas (merge)
  - ```df.merge(df1,df2)```
- Pandas (Pivot Tables)
  - ```df.pivot_table()```
- Pandas (to_datetime)
  - ```df.to_datetime()```
- MatPlotLib
  - Visualization
  - Color and styles
  - Lines
  - Markes
  - legend
  - Axes
  - Scatter Plots
  - Contour Plots
  - Histograms
    - ```plt.hist()```
  - Subplots
    - ```plt.subplots()```
  - 3D plots
    - ```bash
      fig = plt.figure() 
      ax  = fig.gca(projection='3d')
      ```
      ```bash
      from matplotlib import cm

      fig = plt.figure(figsize=(8,8))
      ax = fig.gca(projection='3d')
      ax.plot_surface(X,Y,Z, cmap=cm.coolwarm) # 
      ```
  - Density and pairplots from seaborn
    ```bash
    import seaborn as sns
    sns.set()
    ```
  - Seaborn Heatmaps
      ```bash
      import pandas as pd
      import seaborn as sns
      df = pd.DataFrame(np.random.rand(10,10), columns=list('ABCDEFGHIJ'))
      sns.heatmap(df,annot=True,annot_kws={'size':7})
      ```
  - Interactive plotting with Bokeh
  - Interactive 3D plotting with plotly
  - Geographic Data with folium
    - ```pip install folium && conda install folium```