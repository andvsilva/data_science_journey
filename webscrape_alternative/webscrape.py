# pip install webdriver-manager
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import Select
from selenium.webdriver.support.ui import WebDriverWait
from bs4 import BeautifulSoup, SoupStrainer


import os
import time
import re
import substring
import re
from icecream import ic
import pandas as pd
import glob
import pathlib



s=Service('/usr/bin/chromedriver')
driver = webdriver.Chrome(service=s)
driver.maximize_window()
driver.get('https://servicos.tce.pr.gov.br/TCEPR/Municipal/SIMAM/Paginas/Rel_LRF.aspx?relTipo=1')

time.sleep(1)

with open('listmunicipios.txt') as f:
    municipios = [municipio.rstrip('\n') for municipio in f]

imunicipio = 2

for nameMunicipio in municipios:
        
    # Select type Municipio
    type = driver.find_element(By.XPATH, '//*[@id="ContentPlaceHolder1_ddlTipo"]/option[2]') 
    type.click()

    time.sleep(2)

    selectMunicipio = driver.find_element(By.XPATH, f'//*[@id="ContentPlaceHolder1_ddlMunicipio"]/option[{imunicipio}]') #option[2] until 400
    selectMunicipio.click()

    time.sleep(1)

    select = Select(driver.find_element(By.XPATH, '//*[@id="ContentPlaceHolder1_ddlEntidade"]'))
    select.select_by_visible_text(f"MUNICÍPIO DE {nameMunicipio}")

    time.sleep(1)

    relatorio = driver.find_element(By.XPATH, '//*[@id="ContentPlaceHolder1_ddlRelatorio"]/option[5]')
    relatorio.click()

    time.sleep(1)

    yearnumber = 2013
    for iano in range(7, 6, -1):

        print(f'{imunicipio}  - {nameMunicipio}  - {yearnumber}')


        ano = driver.find_element(By.XPATH, f'//*[@id="ContentPlaceHolder1_ddlAno"]/option[{iano}]')
        ano.click()
        time.sleep(1)

        periodo = driver.find_element(By.XPATH, '//*[@id="ContentPlaceHolder1_ddlPeriodo"]/option[3]')
        periodo.click()

        time.sleep(1)

        

        buttonConsulta = driver.find_element(By.XPATH, '//*[@id="ContentPlaceHolder1_btnConsulta"]')
        buttonConsulta.click()

        driver.switch_to.window(driver.window_handles[1])

        time.sleep(2)

        diskDownload = driver.find_element(By.XPATH, '//*[@id="rdlLRF_ctl05_ctl04_ctl00_ButtonImg"]')
        diskDownload.click()

        time.sleep(3)

        downloadCSV=driver.find_element(By.XPATH, '//*[@id="rdlLRF_ctl05_ctl04_ctl00_Menu"]/div[7]/a') 
        time.sleep(3)
        driver.execute_script("arguments[0].click();", downloadCSV)

        time.sleep(1)

        iano = 2020

        find_string = '% DA DCL SOBRE A RCL (III/RCL)'
        if iano == 2020:
            find_string = '% DA DCL SOBRE A RCL (III/VI)'
            df = pd.read_csv('~/Downloads/RelatorioRGFDividaConsolidadaLiquida_5.csv')
            #ic(df)

            print(df.loc[[29]])
        else:
            os.system('mv ~/Downloads/*.csv ~/repo/data_science_journey/webscrape_alternative/csv/data.csv')
            df = pd.read_csv('~/repo/data_science_journey/webscrape_alternative/csv/data.csv')

            row_index = df.index[df['Textbox38'] == f'{find_string}'].tolist()
            print(df.iloc[row_index])
            
        
        time.sleep(1)

        

        

        if iano == 2020:
            os.system('rm ~/Downloads/RelatorioRGFDividaConsolidadaLiquida_5.csv')
        else:
            os.system('rm csv/data.csv')

        time.sleep(2)
        driver.close()

        driver.switch_to.window(driver.window_handles[0])

        time.sleep(1)

        yearnumber += 1


    imunicipio += 1

    time.sleep(1)

