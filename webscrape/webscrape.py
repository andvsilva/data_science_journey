# pip install webdriver-manager
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import Select
from selenium.webdriver.support.ui import WebDriverWait

import time

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

        time.sleep(2)

        wait = WebDriverWait(driver, 20)

        content = wait.until(EC.visibility_of_element_located((By.XPATH, "/html/body/form/div[3]/fieldset/span/div/table/tbody/tr[5]/td[3]/div/div[1]/div/table/tbody/tr/td/table/tbody/tr[2]/td/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr[5]/td[2]/table/tbody/tr[18]/td[5]/div"))).text
        
        print(f"{yearnumber} DCL: {content}")

        time.sleep(8)

        driver.close()

        driver.switch_to.window(driver.window_handles[0])

        time.sleep(8)

        yearnumber += 1


    imunicipio += 1

    time.sleep(2)

time.sleep(1000)

