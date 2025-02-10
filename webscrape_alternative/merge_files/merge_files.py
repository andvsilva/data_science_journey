import pandas as pd
import glob

# Lista de arquivos CSV em um diretório
#files = glob.glob("*.csv")  # Ajuste o caminho conforme necessário
#files.sort()
#print(files)

files = ['1.csv', '2.csv', '3.csv', '4.csv', '5.csv', '6.csv', '7.csv', '8.csv', '9.csv', '10.csv', '11.csv', '12.csv',
         '13.csv', '14.csv', '15.csv', '16.csv', '17.csv','18.csv', '19.csv']

# Ler e concatenar todos os arquivos
df = pd.concat([pd.read_csv(f, index_col=0) for f in files], ignore_index=True)

print(df.head())

df.to_csv('DCL_2013_2020_merged.csv')
