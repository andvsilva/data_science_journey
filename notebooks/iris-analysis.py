from sklearn.datasets import load_iris
import pandas as pd

# Load dataset
iris = load_iris()

# Features
X = iris.data

# Target labels
y = iris.target

# Convert to DataFrame
df = pd.DataFrame(X, columns=iris.feature_names)
df["species"] = y

print(df.head())