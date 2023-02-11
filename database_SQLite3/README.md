## A Good Way To Start With SQLite3 using Python

##### I will shed light on SQLite and explain the basics to work with database!

To begin, the natural question is, What is SQLite? According to the documentation:

```bash
SQLite is a C-language library that implements a small, fast, self-contained, high-reliability
full-featured, SQL database engine. SQLite is the most used database engine in the world. SQLite 
is built into all mobile phones and most computers and comes bundled inside countless other 
applications that people use every day.
```

To start, I will describe line-by-line the script in python that I wrote to do this task.

To do this tutorial, you will to install ```sqlite3``` and ```Faker``` python packages by the following command:

#### Install SQLite3 package:
```bash
python -m pip install pysqlite3
```

#### Install Faker package:

```bash
python -m pip install Faker
```

Setting the libraries used for this script are:

```bash
import sqlite3
from faker import Faker
import random
```

- **Faker**: Faker is a Python package that generates fake data ([HERE](https://andsilvadrcc.medium.com/how-to-generate-fake-data-using-the-faker-python-package-b6734b944cb2) I wrote a tutorial of How to use this library)
- **random**: This module implements pseudo-random number generators for various distributions

**NOTE**: For this tutorial, If you want to learn by doing yourself, you will need to use the visual studio code (```vscode```) (In this nice introduction - [HERE](https://medium.com/@viki.risteska/the-ultimate-investment-how-a-healthy-lifestyle-can-pay-off-in-the-long-run-ad55698bb291) - you can learn how to use vscode).

Next thing to do is to create a new database and open a database connection to permit ```sqlite3``` to work:

```bash
# create and open the database.
db = sqlite3.connect("dataset/database.sqlite")
```

Now, we need to create and initialize the faker generator, which to generate the data.

```bash
# faker object.
fake = Faker()
```

Using the database created above ```db```, I will execute the command ```CREATE TABLE``` in SQL to create the tables: **clients** and **orders**:


```bash
# create tables 
db.execute('''CREATE TABLE IF NOT EXISTS clients (id_client, name_client, phone,
              email, age, country, job, company, address, date_register)''')

db.execute('''CREATE TABLE IF NOT EXISTS orders (id_order,id_client, date_order, 
              product, credit_card, credit_card_number, price_product)''')
```

I also add one condition(```IF NOT EXISTS```) to the command ```CREATE TABLE``` this will pervent to create table if already exists, for the tables **clients** and **orders**.

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

The next step is to create line-by-line the data for each column in tables clients and orders.

```bash
# generate fake data.

# here I will create only 9 lines of data.
# You can change 'range' according what you want.
for id in range(1,10):

    # client information.
    id_client = id
    name_client = fake.name()
    phone_number = fake.phone_number()
    email = fake.email()
    country_name = fake.country()
    country = country_name.replace("'", "") #remove character (') when passed to SQL command.
    age = random.randint(18, 80)
    job_name = fake.job()
    job = job_name.replace("'", "") 
    company_name = fake.company()
    company = company_name.replace("'", "")
    address = fake.address()
    date_register = fake.date_between(start_date='-3y', end_date='today')
    
    # insert data into the table clients.
    db.execute(f'''INSERT INTO clients VALUES({id_client}, '{name_client}', 
                                             '{phone_number}', '{email}', {age}, 
                                             '{country}', '{job}', '{company}', 
                                             '{address}', '{date_register}')''')
    
    # client order.
    id_order = random.randint(1, 10000)
    date_order = fake.date_between(start_date='-90d', end_date='today') # 3 months ago!
    product = fake.file_extension()
    credit_card = fake.credit_card_provider()
    credit_card_number = fake.credit_card_number()
    price_product = fake.pricetag()

    # insert data into the table orders.
    db.execute(f'''INSERT INTO orders VALUES({id_order}, {id_client}, 
                                            '{date_order}', '{product}', 
                                            '{credit_card}', {credit_card_number}, 
                                            '{price_product}')''')
```

As you can see above, In the loop ```for``` the python library ```Faker()``` does the creation of the data that are inserted into the database(```db```) for clients and orders tables.

To execute SQL statements and to get SQL queries, We need to create a database cursor to used, as shown below: 

```bash
# create a Cursor object and call its execute() 
# method to perform SQL commands:
cursor = db.cursor()
```

Now with the ```cursor``` that query for clients and orders can be executed by calling the command:

```bash
# print the tables

# clients
for row in cursor.execute('SELECT * FROM clients'):
    print(list(row))

# orders
for row in cursor.execute('SELECT * FROM orders'):
    print(list(row))
```

In the end after the database has been written, we can call ```close()``` to close the connection to the database:

```bash
$ cursor.close()
```

And to finish, the commit any pending execution to the database

```bash
# save (commit) the changes
$ db.commit()
```

Close and done:

```bash
# we can also close the connection if we are done with it.
# Just be sure any changes have been committed or they will be lost.
$ db.close()
```

The folder have the files:

![](/images/folder.png)

The file ```createdatabase.py``` is on my github repo - [HERE](https://github.com/andvsilva/data_science_journey/blob/master/database_SQLite3/createdatabase.py)

First, run the python script:

```bash
## folder: database_SQLite3

python createdatabase.py
```

This will create the database in the folder ```database``` called ```database.sqlite```

Now I will show the database on the visual studio code.

To do the next step, you will need to install an extension on visual sutdio code called SQLite as shown below:

![](images/extension_sqlite3.png)

To open the database on the visual studio code: **CRTL+SHIFT+P**:

![](/images/vscode_open_database.png)

Just click on ```SQLite Open Database``` after this command will ask to you which database you want to explore, and to explore the database, just go to the left side down to see the ```SQLITE EXPLORE``` as shown in the figure below:

![](/gifs/databasetables.gif)

and

![](/images/explore_database.png)

To see the content of each table, just click with right botton into the option ```show table``` this will execute the query, for clients and orders:

```bash
SELECT * FROM clients;
```

as shown below:

![](/images/showtableclients.png)

```bash
SELECT * FROM orders;
```

as shown below:
![](/images/showtableorders.png)

Another way to look into database is using the Command Line Interface (CLI) on the terminal:

![](/gifs/queries.gif)

```bash
## Terminal window:

$ sqlite3 dataset/database.sqlite
SQLite version 3.39.3 2022-09-05 11:02:23
Enter ".help" for usage hints.

sqlite> SELECT id_client,name_client,country FROM clients;
1|Brian Sandoval|Yemen
2|Mike Gray|Fiji
3|James Adams|Oman
4|Tony Alexander|Malta
5|Shawn Santana|Jordan
6|Courtney Mcdonald|Pitcairn Islands
7|Tammy Moran|French Guiana
8|Leonard Cox|Montserrat
9|Jennifer Abbott|Saint Barthelemy

sqlite> SELECT id_order,id_client,price_product FROM orders;
4231|1|$27.76
6605|2|$83,065.35
651|3|$58.40
7859|4|$190.47
7724|5|$623.11
8840|6|$3.93
3185|7|$9.24
2948|8|$610.21
8454|9|$4.16
```

if you want to go deep dive into SQL, you can see [LEARN SQL: SQL Tutorial for beginners - Programiz](https://www.programiz.com/sql). This is a great way to start in SQL! I learned a lot by doing the examples - **Hands on**.

That's it for now. I hope you enjoy! If you like it, follow me and comment or make a suggestions below. Thank you very much for read the article, I appreciate.

To know more about me, see my [webpage - andvsilva](https://andsilvadrcc.gitlab.io/my-web-page-andre-vieira/).
**Have a nice day :) see you**

```happy coding```