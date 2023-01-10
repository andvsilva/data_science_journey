## A Good Way To Start With SQLite3 using Python

##### I will shed light on SQLite and explain the basics to work with database!

To begin, the natural question is, What is SQLite? According to the documentation:

```
SQLite is a C-language library that implements a small, fast, self-contained, high-reliability
full-featured, SQL database engine. SQLite is the most used database engine in the world. SQLite 
is built into all mobile phones and most computers and comes bundled inside countless other 
applications that people use every day.
```

To start, I will describe line-by-line the script in python that I wrote to do this task.

Setting the libraries used for this script are:

```
import sqlite3
from faker import Faker
import random
```

- **Faker**: Faker is a Python package that generates fake data ([HERE](https://andsilvadrcc.medium.com/how-to-generate-fake-data-using-the-faker-python-package-b6734b944cb2) I wrote a tutorial of How to use this library)
- **random**: This module implements pseudo-random number generators for various distributions

Next thing to do is to create a new database and open a database connection to permit ```sqlite3``` to work:

```
# create and open the database.
db = sqlite3.connect("dataset/database.sqlite")
```

Now, we need to create and initialize the faker generator, which to generate the data.

```
# faker object.
fake = Faker()
```

Using the database created above ```db```, I will execute the command ```CREATE TABLE``` in SQL to create the tables: **clients** and **orders**:


```
# create tables 
db.execute('''CREATE TABLE IF NOT EXISTS clients (id_client, name_client, phone,
              email, age, country, job, company, address, date_register)''')

db.execute('''CREATE TABLE IF NOT EXISTS orders (id_order,id_client, date_order, 
              product, credit_card, credit_card_number, price_product)''')
```

I also add one condition(```IF NOT EXISTS```) to the command ```CREATE TABLE``` this will pervent to create table if already exist, for the tables clientes and orders.

For the table clients, the columns created were:

- id client
- name Client
- phone
- email
- age
- country
- job
- company
- address
- date register

and for the table orders, the columns created were:

- id order
- id client
- date order
- product
- credit card
- credit card number
- price product

As we already know SQLite is a relational database management system (RDBMS), so we can see that the tables are related through of the column ```id client```.

For this tutorial, I will generate fake data to workaround with SQLite3, ***the fake data will be used for study purposes only.***