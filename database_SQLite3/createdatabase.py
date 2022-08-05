# This script will be able to generate
# fake data using a python package called
# 'Faker' and store into database SQL.

# Author: @andvsilva 2022-08-04

import sqlite3
from faker import Faker
import random

# create database.
db = sqlite3.connect("dataset/database.sqlite")

# faker object.
fake = Faker()

# create tables 
db.execute("CREATE TABLE IF NOT EXISTS clients (id_client, name_client, phone, email, age, country, job, company, address, date_register)")
db.execute("CREATE TABLE IF NOT EXISTS orders (id_order,id_client, date_order, product, credit_card, credit_card_number, price_product)")

# generate fake data.
for id in range(1,100000):
    # client info.
    id_client = id
    name_client = fake.name()
    phone_number = fake.phone_number()
    email = name_client + '@' + fake.email()
    age = random.randint(18, 80)
    country_name = fake.country()
    country = country_name.replace("'", "")
    job_name = fake.job()
    job = job_name.replace("'", "")
    company_name = fake.company()
    company = company_name.replace("'", "")
    
    address = fake.address()
    date_register = fake.date_between(start_date='-3y', end_date='today')
    
    # insert data into the table clients.
    db.execute(f"INSERT INTO clients VALUES({id_client}, '{name_client}', '{phone_number}', '{email}', {age}, '{country}', '{job}', '{company}', '{address}', '{date_register}')")
    
    # client order.
    id_order = random.randint(1, 10000)
    date_order = fake.date_between(start_date='-90d', end_date='today') # 3 months ago!
    product = fake.file_extension()
    credit_card = fake.credit_card_provider()
    credit_card_number = fake.credit_card_number()
    price_product = fake.pricetag()

    # insert data into the table orders.
    db.execute(f"INSERT INTO orders VALUES({id_order}, {id_client}, '{date_order}', '{product}', '{credit_card}', {credit_card_number}, '{price_product}')")
    print(f'#{id}...')    

cursor = db.cursor()
cursor.execute("SELECT * FROM clients")
cursor.execute("SELECT * FROM orders")

cursor.close()
db.commit()
db.close()