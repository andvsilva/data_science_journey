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

s=Service('/usr/bin/chromedriver')
driver = webdriver.Chrome(service=s)
driver.maximize_window()
driver.get('https://servicos.tce.pr.gov.br/TCEPR/Municipal/SIMAM/Paginas/Rel_LRF.aspx?relTipo=1')

time.sleep(2)

with open('listmunicipios.txt') as f:
    municipios = [municipio.rstrip('\n') for municipio in f]

imunicipio = 2

for nameMunicipio in municipios:
        
    # Select type Municipio
    type = driver.find_element(By.XPATH, '//*[@id="ContentPlaceHolder1_ddlTipo"]/option[2]') 
    type.click()

    print(imunicipio)

    time.sleep(5)

    selectMunicipio = driver.find_element(By.XPATH, f'//*[@id="ContentPlaceHolder1_ddlMunicipio"]/option[{imunicipio}]') #option[2] until 400
    selectMunicipio.click()

    time.sleep(2)

    print(nameMunicipio)

    select = Select(driver.find_element(By.XPATH, '//*[@id="ContentPlaceHolder1_ddlEntidade"]'))
    select.select_by_visible_text(f"MUNICÍPIO DE {nameMunicipio}")

    time.sleep(2)

    relatorio = driver.find_element(By.XPATH, '//*[@id="ContentPlaceHolder1_ddlRelatorio"]/option[5]')
    relatorio.click()

    time.sleep(2)

    yearnumber = 2013
    for iano in range(14, 6, -1):

        ano = driver.find_element(By.XPATH, f'//*[@id="ContentPlaceHolder1_ddlAno"]/option[{iano}]')
        ano.click()
        time.sleep(1)

        periodo = driver.find_element(By.XPATH, '//*[@id="ContentPlaceHolder1_ddlPeriodo"]/option[3]')
        periodo.click()

        time.sleep(3)

        buttonConsulta = driver.find_element(By.XPATH, '//*[@id="ContentPlaceHolder1_btnConsulta"]')
        buttonConsulta.click()

        driver.switch_to.window(driver.window_handles[1])

        time.sleep(5)

        # Get the HTML source of the page
        html_source = driver.page_source

        # Parse the HTML
        soup = BeautifulSoup(html_source, 'html.parser')

        # Extract all text content

        # Split into lines
        lines = soup.get_text().splitlines()

        for line in lines:
            # Extract content after "name:" for each matching string
            name = line[0:9]
            if name == "MUNICÍPIO":
                line = str(line)

                # Find the positions of ':' characters
                start_pos = line.find("% DA DCL SOBRE A RCL (III/RCL) ") + 1
                end_pos = line.find("LIMITE DEFINIDO POR RESOLUÇÃO DO SENADO FEDERAL", start_pos)

                # Extract substring between the two ':' characters
                between = line[start_pos:end_pos]

                print(">>>", between)

        time.sleep(5)
        driver.close()

        driver.switch_to.window(driver.window_handles[0])

        time.sleep(8)

        yearnumber += 1


    imunicipio += 1

    time.sleep(2)

time.sleep(1000)

