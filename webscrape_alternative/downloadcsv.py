# pip install webdriver-manager
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import Select
from selenium.webdriver.support.ui import WebDriverWait
from bs4 import BeautifulSoup, SoupStrainer
from selenium.common.exceptions import UnexpectedAlertPresentException, NoAlertPresentException
from selenium.common.exceptions import TimeoutException

import os
import time
import re
import substring
import re
from icecream import ic
import pandas as pd
import glob
from pathlib import Path
import random

s=Service('/usr/bin/chromedriver')
driver = webdriver.Chrome(service=s)
driver.maximize_window()
driver.get('https://servicos.tce.pr.gov.br/TCEPR/Municipal/SIMAM/Paginas/Rel_LRF.aspx?relTipo=1')

time.sleep(1)

with open('listmunicipios.txt') as f:
    municipios = [municipio.rstrip('\n') for municipio in f]

irow = 0

columns = ['munícipios',
               '% DCL-2013', 
               '% DCL-2014',
               '% DCL-2015',
               '% DCL-2016',
               '% DCL-2017',
               '% DCL-2018',
               '% DCL-2019',
               '% DCL-2020'
         ]

data_2013_2020 = pd.DataFrame(columns=columns)
data_2013_2020['munícipios'] = municipios

for nameMunicipio in municipios:
    start_time = time.time()

    slowtime = random.uniform(1, 1.5)
    longtime = random.randint(2, 3)

    imunicipio = municipios.index(f'{nameMunicipio}')+2
    
    # Select type Municipio
    type = driver.find_element(By.XPATH, '//*[@id="ContentPlaceHolder1_ddlTipo"]/option[2]') 
    type.click()

    time.sleep(slowtime)

    if nameMunicipio == "PÉROLA D'OESTE":
        ic(nameMunicipio)
        selectMunicipio = driver.find_element(By.XPATH, '//*[@id="ContentPlaceHolder1_ddlMunicipio"]/option[266]') 
        selectMunicipio.click()
    else:
        if nameMunicipio == "SANTO ANTONIO DO CAIUÁ":
            nameMunicipio = "SANTO ANTÔNIO DO CAIUÁ"
        
        if nameMunicipio == "SÃO JORGE D'OESTE":
            nameMunicipio = "SAO JORGE D'OESTE"  

        selectMunicipio = Select(driver.find_element(By.XPATH, '//*[@id="ContentPlaceHolder1_ddlMunicipio"]')) 
        selectMunicipio.select_by_visible_text(f"{nameMunicipio}")
    
    time.sleep(slowtime)

    if nameMunicipio == "ITAPEJARA D'OESTE":
        nameMunicipio = "ITAPEJARA D OESTE"

    if nameMunicipio == "JESUÍTAS":
        nameMunicipio = "JESUITAS"
    
    if nameMunicipio == "NOSSA SENHORA DAS GRAÇAS":
        nameMunicipio = "NOSSA SENHORA DAS GRACAS"


    if nameMunicipio == "LAPA":
        select = Select(driver.find_element(By.XPATH, '//*[@id="ContentPlaceHolder1_ddlEntidade"]'))        
        select.select_by_visible_text(f"MUNICÍPIO DA {nameMunicipio}")

    if nameMunicipio == "NOSSA SENHORA DAS GRACAS":
        select = Select(driver.find_element(By.XPATH, '//*[@id="ContentPlaceHolder1_ddlEntidade"]'))        
        select.select_by_visible_text(f"MUNICIPIO DE {nameMunicipio}")
        nameMunicipio = "NOSSA SENHORA DAS GRAÇAS" 

    if nameMunicipio == "PÉROLA D'OESTE":
        selectMunicipio = driver.find_element(By.XPATH, '//*[@id="ContentPlaceHolder1_ddlEntidade"]/option[4]')
        selectMunicipio.click()
    else:
        if nameMunicipio == "ALTÔNIA":
            nameMunicipio = 'ALTONIA'

        if nameMunicipio == "ANTÔNIO OLINTO":
            nameMunicipio = 'ANTONIO OLINTO'

        if nameMunicipio == "PIÊN":
            nameMunicipio = 'PIEN'

        if nameMunicipio == "SANTO ANTÔNIO DA PLATINA":
            nameMunicipio = 'SANTO ANTONIO DA PLATINA'

        if nameMunicipio == "SANTO ANTÔNIO DO CAIUÁ":
            nameMunicipio = 'SANTO ANTONIO DO CAIUÁ'
        
        if nameMunicipio == "SANTO ANTÔNIO DO PARAÍSO":
            nameMunicipio = 'SANTO ANTONIO DO PARAÍSO'
        
        if nameMunicipio == "SANTO ANTÔNIO DO SUDOESTE":
            nameMunicipio = 'SANTO ANTONIO DO SUDOESTE'

        if nameMunicipio == "SAO JORGE D'OESTE":
            nameMunicipio = 'SÃO JORGE D OESTE'
        
        if nameMunicipio == "GOIOERE":
            nameMunicipio = 'GOIOERÊ'

        if nameMunicipio != "LAPA":
            if nameMunicipio != "NOSSA SENHORA DAS GRAÇAS":
                select = Select(driver.find_element(By.XPATH, '//*[@id="ContentPlaceHolder1_ddlEntidade"]'))
                select.select_by_visible_text(f"MUNICÍPIO DE {nameMunicipio}")

    

    time.sleep(slowtime)
    relatorio = driver.find_element(By.XPATH, '//*[@id="ContentPlaceHolder1_ddlRelatorio"]/option[5]')                            
    relatorio.click()

    yearnumber = 2013
    icolumn = 1


    for iano in range(14, 6, -1):

        print(f'{imunicipio}  - {nameMunicipio}  - {yearnumber}')

        time.sleep(slowtime)
        ano = driver.find_element(By.XPATH, f'//*[@id="ContentPlaceHolder1_ddlAno"]/option[{iano}]')
        ano.click()
        
        time.sleep(slowtime)
        periodo = driver.find_element(By.XPATH, '//*[@id="ContentPlaceHolder1_ddlPeriodo"]/option[3]')
        periodo.click()

        time.sleep(slowtime)

        buttonConsulta = driver.find_element(By.XPATH, '//*[@id="ContentPlaceHolder1_btnConsulta"]')
        time.sleep(slowtime)
        buttonConsulta.click()

        driver.switch_to.window(driver.window_handles[1])

        time.sleep(longtime)

        downloadCSV = driver.find_element(By.XPATH, '//*[@id="rdlLRF_ctl05_ctl04_ctl00_Menu"]/div[7]/a')
        time.sleep(longtime)
        driver.execute_script("arguments[0].click();", downloadCSV)

        time.sleep(longtime)

        folder_path = '/home/andvsilva/Downloads/'

        FlagOut = True

        while FlagOut: 
        
            # List all files in the folder
            file_name = os.listdir(folder_path)
            
            time.sleep(slowtime)

            if file_name == []:
                print('path to file is empty, try again please!')
                time.sleep(longtime)

                downloadCSV = driver.find_element(By.XPATH, '//*[@id="rdlLRF_ctl05_ctl04_ctl00_Menu"]/div[7]/a')
                driver.execute_script("arguments[0].click();", downloadCSV)
    
                time.sleep(longtime)
                file_name = os.listdir(folder_path)

            else:
                file_name = file_name[0]
                FlagOut = False



        nameMunicipio = nameMunicipio.replace(' ', '_')
        time.sleep(slowtime)

        name_municipioYear = nameMunicipio + '_' + str(yearnumber) + '.csv'

        

        

        time.sleep(slowtime)
        os.system(f'mv /home/andvsilva/Downloads/{file_name} /home/andvsilva/repo/data_science_journey/webscrape_alternative/csv/{name_municipioYear}')
        time.sleep(slowtime)

        driver.close()

        time.sleep(slowtime)

        driver.switch_to.window(driver.window_handles[0])

        time.sleep(slowtime)

        yearnumber += 1
    
    
    end_time = time.time()
    execution_time = end_time - start_time
    execution_time = execution_time/60 # minutes
    print(f"Tempo de execução: {execution_time:.5f} minutes")

    irow += 1

    time.sleep(longtime)
