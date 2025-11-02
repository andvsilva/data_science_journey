from selenium import webdriver
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.firefox.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time

# Caminhos
TOR_FIREFOX_BIN = "/usr/local/share/tor-browser/Browser/firefox"  # executável do Firefox do Tor
GECKODRIVER_PATH = "/usr/local/bin/geckodriver"

# Configurações do Firefox
options = Options()
options.binary_location = TOR_FIREFOX_BIN
options.set_preference("network.proxy.type", 1)
options.set_preference("network.proxy.socks", "127.0.0.1")
options.set_preference("network.proxy.socks_port", 9050)  # ou 9150
options.set_preference("network.proxy.socks_remote_dns", True)

# Cria o driver usando Service
service = Service(GECKODRIVER_PATH)
driver = webdriver.Firefox(service=service, options=options)

driver.get("https://andrevsilva.com")

time.sleep(5)

# Abre uma nova aba
driver.execute_script("window.open('');")

# Muda para a nova aba
driver.switch_to.window(driver.window_handles[1])

# Abre um site na nova aba
driver.get("https://andrevsilva.com/freedomsblog/")