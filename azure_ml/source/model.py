### A simple end-to-end demonstration of the workflow
### for one project of Machine Learning.

## Author: @andvsilva Tue Jan 30 03:31:58 PM 2024

import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score

from catboost import CatBoostClassifier

print('loading dataset...')
df = pd.read_csv('../dataset/turnover.csv', index_col=[0])


print(df)

# Definindo features (características) e target (alvo)
X = df.drop(['turnover'], axis=1) 
y = df['turnover']

print('split dataset in train and test for the model...')
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

#define model
print('call the model - CatBoost Classifier...')
model = CatBoostClassifier(iterations=100, learning_rate=0.1, depth=2, loss_function='MultiClass')

# train
print('training...')
model.fit(X_train, y_train, verbose=10)

# prediction
print('prediction...')
y_pred = model.predict(X_test)

# accurary
print('performance of the mode...')
accuracy = accuracy_score(y_test, y_pred)
print("Accuracy:", accuracy)

model.save_model(
    "catboostclassifier.json",
    format="json",
    # pool=pool  # this parameter is required only for models with categorical features.
)

print('That is for today, a simple demonstration for machine learning project.')

