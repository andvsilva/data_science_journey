# pip install webdriver-manager
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
import time

s=Service('/usr/bin/chromedriver')
driver = webdriver.Chrome(service=s)
driver.maximize_window()
driver.get('https://servicos.tce.pr.gov.br/TCEPR/Municipal/SIMAM/Paginas/Rel_LRF.aspx?relTipo=1')

