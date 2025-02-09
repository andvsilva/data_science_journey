from pathlib import Path
import time

data_exist = Path("~/repo/data_science_journey/webscrape_alternative/archive/RelatorioRGFDividaConsolidadaLiquida_5.csv")

file_exist = data_exist.is_file()

print(file_exist)

while not file_exist:
    print("Waiting for the file to exist...")
    print(file_exist)
    time.sleep(1)
    file_exist = data_exist.is_file()
