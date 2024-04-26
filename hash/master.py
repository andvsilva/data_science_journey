import os
import time 
print('generate public and privaty keys...')
os.system('python3 genrsa.py')

print('Starting the server now, please!')
os.system('python3 server.py &')

while True:
    os.system('python3 client.py')
    time.sleep(5)
    print('...')