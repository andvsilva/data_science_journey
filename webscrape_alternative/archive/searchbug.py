import pandas as pd

df = pd.read_csv('RelatorioRGFDividaConsolidadaLiquida_5.csv')

find_string = '% DA DCL SOBRE A RCL (III/VI)'
#find_string = '% DA DCL SOBRE A RCL (III/RCL)'

row_index = df.index[df['Textbox38'] == f'{find_string}'].tolist()
print(df.iloc[row_index])

print(df.columns)