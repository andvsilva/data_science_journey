# pip install webdriver-manager
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import Select

import time

s=Service('/usr/bin/chromedriver')
driver = webdriver.Chrome(service=s)
driver.maximize_window()
driver.get('https://servicos.tce.pr.gov.br/TCEPR/Municipal/SIMAM/Paginas/Rel_LRF.aspx?relTipo=1')

time.sleep(5)

#with open('listmunicipios.txt') as f:
#    municipios = [municipio.rstrip('\n') for municipio in f]

#for municipio in municipios:
#    print(municipio)

# Select type Municipio
type = driver.find_element(By.XPATH, '//*[@id="ContentPlaceHolder1_ddlTipo"]/option[2]') 
type.click()

time.sleep(2)

selectMunicipio = driver.find_element(By.XPATH, '//*[@id="ContentPlaceHolder1_ddlMunicipio"]/option[2]') #option[2] until 400
selectMunicipio.click()

time.sleep(2)

select = Select(driver.find_element(By.XPATH, '//*[@id="ContentPlaceHolder1_ddlEntidade"]'))
select.select_by_visible_text("MUNICÍPIO DE ABATIÁ")

time.sleep(1000)

