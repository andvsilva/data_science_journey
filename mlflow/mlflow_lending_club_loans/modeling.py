###########################################################
### step  3 - training and prediction
# 
# Author: André V. Silva 2021-01-02
###########################################################
# libraries for this project
import json
import math
import pandas as pd
import numpy as np
from numpy import mean, std
from IPython.display import HTML
import matplotlib.pyplot as plt
from icecream import ic
#import seaborn as sns
import os.path
import sys
import gc
import feather
from icecream import ic
from sys import getsizeof
import time
from datetime import datetime
import matplotlib.pyplot as plt
from matplotlib.backends.backend_pdf import PdfPages
import matplotlib.dates as mdates
from matplotlib.ticker import MaxNLocator
from sklearn.preprocessing import StandardScaler, OneHotEncoder
from sklearn.model_selection import cross_val_score
from sklearn.model_selection import train_test_split
from sklearn.metrics import classification_report
from sklearn.feature_selection import SelectKBest, f_regression, mutual_info_regression
from sklearn.pipeline import Pipeline
from sklearn.impute import SimpleImputer
from sklearn.compose import ColumnTransformer
from sklearn.metrics import r2_score
from matplotlib import pyplot
import seaborn as sns

# models
from sklearn.ensemble import RandomForestClassifier
from sklearn.tree import DecisionTreeClassifier
from sklearn.neighbors import KNeighborsClassifier
import xgboost as xgb
import catboost as cb
from sklearn.linear_model import SGDClassifier
from sklearn.metrics import accuracy_score
from sklearn.feature_selection import f_classif
from sklearn.feature_selection import SelectKBest, chi2

# models
from sklearn.ensemble import RandomForestRegressor
from sklearn.tree import DecisionTreeRegressor
from sklearn.neighbors import KNeighborsRegressor
import xgboost as xgb
import catboost as cb
from sklearn.linear_model import LinearRegression
from sklearn.linear_model import LogisticRegression
from sklearn.ensemble import StackingRegressor

import mlflow
import mlflow.sklearn

# Pandas has a high consume of memory RAM usage
# release memory RAM
def release_memory(df):   
    del df
    gc.collect() 
    df = pd.DataFrame() # point to NULL
    print('memory RAM released.')

# Get start time 
start_time = time.time()

# datetime object containing current date and time
now = datetime.now()

def transf_cat_num(df):

    print("preprocessing: the categorical and numerical feature now...")
    categorical_feature_names = list(df.select_dtypes(include='category').columns)
    numeric_feature_names = list(df.drop(categorical_feature_names, axis=1).columns)
    
    print("One Hot Encoder...")
    print(f'categorical features: {categorical_feature_names}')
    
    categorical_transformer = Pipeline(steps=[('imputer', SimpleImputer(strategy='constant', fill_value='missing')),
                                            ('onehot', OneHotEncoder(handle_unknown='ignore'))] )
    
    numeric_transformer = Pipeline(steps=[('imputer', SimpleImputer(strategy='median')),
                                        ('scaler', StandardScaler())])

    # Two preprocessed steps together using the Column Transformer module
    preprocessor = ColumnTransformer(
    transformers=[('num', numeric_transformer, numeric_feature_names),
                  ('cat', categorical_transformer, categorical_feature_names)])
    
    return preprocessor

# Install requirements to this project
#pip install freeze
#pip install -r requirements.txt


# dd/mm/YY H:M:S
dt_string = now.strftime("%d/%m/%Y %H:%M:%S")
print(">>> date: ", dt_string)


k_features = sys.argv[1]

def eval_metrics(actual, pred):
    rmse = np.sqrt(mean_squared_error(actual, pred))
    mae = mean_absolute_error(actual, pred)
    r2 = r2_score(actual, pred)
    return rmse, mae, r2

# This make machine learning interpretable and understandable to everyone.
# fshapashrom shapash.explainer.smart_explainer import SmartExplainer 

# Pandas has a high consume of memory RAM usage
# release memory RAM
def release_memory(df):   
    del df
    gc.collect() 
    df = pd.DataFrame() # point to NULL
    print('memory RAM released.')

# Get start time 
start_time = time.time()

def transf_cat_num(df):

    print("preprocessing: the categorical and numerical feature now...")
    categorical_feature_names = list(df.select_dtypes(include='category').columns)
    numeric_feature_names = list(df.drop(categorical_feature_names, axis=1).columns)
    
    print("One Hot Encoder...")
    print(f'categorical features: {categorical_feature_names}')
    
    categorical_transformer = Pipeline(steps=[('imputer', SimpleImputer(strategy='constant', fill_value='missing')),
                                            ('onehot', OneHotEncoder(handle_unknown='ignore'))] )
    
    numeric_transformer = Pipeline(steps=[('imputer', SimpleImputer(strategy='median')),
                                        ('scaler', StandardScaler())])

    # Two preprocessed steps together using the Column Transformer module
    preprocessor = ColumnTransformer(
    transformers=[('num', numeric_transformer, numeric_feature_names),
                  ('cat', categorical_transformer, categorical_feature_names)])
    
    return preprocessor


print("Loading dataset - to modeling...")

# loading data feather format
df = pd.read_feather('../../data/dataset_featuresel_loan.ftr')

print(f'Number of rows.....................: {df.shape[0]}')
print(f'Number of columns..................: {df.shape[1]}')

# Here start mlflow run
with mlflow.start_run():
    
    ## Pipeline
    def pipeline_project(df, model):
        # Pipeline object
        print("setting the pipeline object ...")
        print('preprocessor...')
        preprocessor = transf_cat_num(df)

        feature_selection = SelectKBest(score_func=mutual_info_regression, k = k_features) # f_regression

        pipe = Pipeline(steps=[('preprocessor', preprocessor),
                                ('fs', feature_selection),
                                ('scaler', StandardScaler()),
                                ('model', model)])

        print('>>> pipeline defined!')    
        return pipe

    inbalance_target = dict(df['loan_status'].value_counts(normalize=True).map('{:.2}'.format))

    count_neg = float(inbalance_target[0])*100
    count_pos = float(inbalance_target[1])*100
    scale_inbalance = round(math.sqrt(count_neg/count_pos), 4)
    scale_inbalance

    # Regression models
    def get_models():
      models['RandomForest']=RandomForestRegressor(n_estimators=5, random_state = 42, n_jobs = -1)
      #models['DecisionTree']=DecisionTreeRegressor()
      #models['KNR']=KNeighborsRegressor()
      models['XGBoost']=xgb.XGBRegressor(objective="reg:linear", random_state=42)
      models['CatBoost'] = cb.CatBoostRegressor(loss_function='RMSE')
      #models['LinearR']= LinearRegression(n_jobs = -1) # Use all computer cores

      return models

    models = dict()
    models = get_models()

    print(models)

    # evaluate the models and store results
    results, names = list(), list()

    # target name
    target_name = 'loan_status'

    for name, model in models.items():

        # Alternatively X and y can be obtained directly from the dataframe attribute:
        X = df.drop(target_name, axis=1) # drop the column target
        y = df[target_name] # target

        pipe = pipeline_project(X, model)

        ## Split-out validation dataset
        X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.14, random_state=1)

        ## Training the model
        #print('training the model...')
             
        ## Fitting...
        pipe.fit(X_train, y_train)

        ## prediction
        print('prediction...')
        y_pred = pipe.predict(X_test)

        scores = r2_score(y_test, y_pred)
        # store the results
        results.append(scores)

        ## model names
        names.append(name)

        # summarize the performance along the way
        print('>%s %.3f (%.3f)' % (name, mean(scores), std(scores)))
        
        (rmse, mae, r2) = eval_metrics(y_test, y_pred)
        
        print("Elasticnet model (k_features=%f):" % (k_features))
        print("  RMSE: %s" % rmse)
        print("  MAE: %s" % mae)
        print("  R2: %s" % r2)
        
        mlflow.log_metric("rmse", rmse)
        mlflow.log_metric("r2", r2)
        mlflow.log_metric("mae", mae)
        
        mlflow.sklearn.log_model(pipe, "model")

        release_memory(X)
        release_memory(y)

    # plot model performance for comparison
    sns.boxplot(x=names, y=results, palette="Set3", linewidth=3, width=0.3)
    plt.title("Models")
    plt.ylabel("Scores") # MAE -- Mean Absolute Error
    #sns.xlabel("Models")
    plt.savefig('pictures/scores_models.png')
    plt.savefig('pictures/scores_importance_models.pdf')
    plt.show()

    feature_names =list(X.columns)

    # feature importance
    for name, model in models.items():

        if(name == 'LinearR'):
            continue

        list_feat_importances = list(model.feature_importances_)
        print(list_feat_importances)

        dict_feat_importances = {}

        print('features selected:')
        mask = pipe.named_steps['fs'].get_support()

        new_features = [] # The list of your K best features

        for bool, feature in zip(mask, feature_names):
            if(bool and (feature != 'p_esc_final')):
                new_features.append(feature)

        print(f'the K best features selected to the model ({name}): {new_features}')

        i=0

        print('######################################################################')
        print(f'model: {name}')

        # list of feature importances
        for ilist in new_features:

            if(name=='CatBoost'):
                dict_feat_importances[ilist] = list_feat_importances[i] # porcentagem %
                print(f"{ilist}.......: {round(dict_feat_importances[ilist], 2)} %")
                i=i+1
            else:
                dict_feat_importances[ilist] = list_feat_importances[i]*100 # porcentagem %
                print(f"{ilist}.......: {round(dict_feat_importances[ilist], 2)} %")
                i=i+1

        x_axis = list(dict_feat_importances.values())
        y_axis = list(dict_feat_importances.keys())

        sns.barplot(x_axis, y_axis)

        plt.ylabel('features', fontsize=12)
        plt.xlabel('Feature Importance')
        plt.title(f"Model - {name}")
        plt.savefig(f'figures/feature_importance_model_{name}.png')
        plt.savefig(f'figures/feature_importance_model_{name}.pdf')
        # Show graphic
        plt.show()


        print('######################################################################')

# time of execution in minutes
time_exec_min = round( (time.time() - start_time)/60, 4)

print(f'time of execution (preprocessing): {time_exec_min} minutes')
print("the preprocessing is done.")
print("The next step is to do the modeling.")

# datetime object containing current date and time
now = datetime.now()

# dd/mm/YY H:M:S
dt_string = now.strftime("%d/%m/%Y %H:%M:%S")
print(">>> date: ", dt_string)

print("All Done. :)")