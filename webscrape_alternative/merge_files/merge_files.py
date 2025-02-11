import pandas as pd
import glob

from icecream import ic


# Lista de arquivos CSV em um diretório
#files = glob.glob("*.csv")  # Ajuste o caminho conforme necessário
#files.sort()
#print(files)

#files = ['1.csv', '2.csv', '3.csv', '4.csv', '5.csv', '6.csv', '7.csv', '8.csv', '9.csv', '10.csv', '11.csv', '12.csv',
#         '13.csv', '14.csv', '15.csv', '16.csv', '17.csv','18.csv', '19.csv', '20.csv','21.csv', '22.csv', '23.csv']
#
## Ler e concatenar todos os arquivos
#df = pd.concat([pd.read_csv(f, index_col=0) for f in files], ignore_index=True)
#
#print(df.head())

#df.to_csv('DCL_2013_2020_merged.csv')

df = pd.read_csv('DCL_2013_2020_merged.csv', index_col=0)

#print(df.columns)
df['munícipios'] = df['munícipios'].astype(str)
                                   
name_columns = list(df.columns)
name_columns.remove('munícipios')

number_lines = len(df)

for line in range(number_lines):
    for name_column in name_columns:
        valueDCL = df[f'{name_column}'].iloc[line]

        if '- ' in valueDCL:
            valueDCL = valueDCL.replace('- ', '')
            valueDCL = valueDCL.replace(',', '.')
            valueDCL = (-1)*float(valueDCL)
            df.at[line, f'{name_column}' ] = valueDCL

        else:
            valueDCL = valueDCL.replace(',', '.')
            valueDCL = float(valueDCL)
            df.at[line, f'{name_column}' ] = valueDCL

df.to_csv('DCL_2013_2020.csv')