# Python Project 2: Building Database Apps With PostgreSQL & Python

## Lecture: Creating a database
### Creating a database:

```
CREATE DATABASE sample;
```

Deleting a database:

```
drop database sample;
```

Lecture: Creating a table
Creating a table:

```
CREATE TABLE students(id serial primary key,name text,address text,age int,number text);
```

Lecture: Inserting data into database
Inserting a record into database table:

```
INSERT INTO students (name,address,age,number) VALUES ('John','LA',34,'999999');
```

Insert another record in this table:

```
INSERT INTO students (name,address,age,number) VALUES ('ROB','NY',23,'888888');
```

Lecture: Reading data from database
Read all values from database.

```
SELECT * FROM students
```

Get data for John

```
SELECT * FROM students where name ="John"
```

Let’s say you want to search where age of a person is something

```
SELECT * FROM students where age>18
```

Let’s suppose you want to get all people from NY who are greater than 25

```
SELECT * FROM students where age>18 AND address ="NY" 
```

Lecture: Updating & deleting data
Change John’s number

update students set number='777' where name ='John';
Change on the basis of id.

update students set name='Jake' where id=1;
Deleting a row

```
delete from students where name='ROB';
```

Lecture: Installing pscycopg2
Installing the psycopg2 package:

```
pip install psycopg2-binary
```

Lecture: Connecting to database
Establishing a connection to the database

```
import psycopg2
 
#code to establish a connection to database.
conn = psycopg2.connect(dbname="studentdb",user="postgres",password="admin123",host="localhost",port="5433")
print("connection successful")
```

### Lecture: Creating a database table with Python

```
import psycopg2
 
#code to establish a connection to database.
conn = psycopg2.connect(dbname="studentdb",user="postgres",password="admin123",host="localhost",port="5433")
cur = conn.cursor()
cur.execute("""CREATE TABLE students(student_id serial primary key,name text,address text,age int,number text);""")
print("student table created")
conn.commit()
conn.close()
```

### Lecture: Inserting data into database

```
import psycopg2
 
def create_table():
#code to establish a connection to database.
    conn = psycopg2.connect(dbname="studentdb",user="postgres",password="admin123",host="localhost",port="5433")
    cur = conn.cursor()
    cur.execute("""CREATE TABLE students(student_id serial primary key,name text,address text,age int,number text);""")
    print("student table created")
    conn.commit()
    conn.close()
 
def insert_data():
    conn = psycopg2.connect(dbname="studentdb",user="postgres",password="admin123",host="localhost",port="5433")
    cur = conn.cursor()
    cur.execute("""INSERT INTO students(name,address,age,number) VALUES ('John','NY',100,99999)""")
    print("student table created")
    conn.commit()
    conn.close()
 
insert_data()
```

Accepting values from the user and then adding them to database:

```
import psycopg2
 
def create_table():
#code to establish a connection to database.
    conn = psycopg2.connect(dbname="studentdb",user="postgres",password="admin123",host="localhost",port="5433")
    cur = conn.cursor()
    cur.execute("""CREATE TABLE students(student_id serial primary key,name text,address text,age int,number text);""")
    print("student table created")
    conn.commit()
    conn.close()
 
def insert_data():
    name = input("Enter name: ")
    address = input("Enter address: ")
    age = input("Enter age: ")
    number = input("Enter phone number: ")
    conn = psycopg2.connect(dbname="studentdb",user="postgres",password="admin123",host="localhost",port="5433")
    cur = conn.cursor()
    cur.execute("""INSERT INTO students(name,address,age,number) VALUES (%s,%s,%s,%s)""",(name,address,age,number))
    print("student table created")
    conn.commit()
    conn.close()
 
insert_data()
```

Lecture: Updating data

```
import psycopg2
 
def create_table():
#code to establish a connection to database.
    conn = psycopg2.connect(dbname="studentdb",user="postgres",password="admin123",host="localhost",port="5433")
    cur = conn.cursor()
    cur.execute("""CREATE TABLE students(student_id serial primary key,name text,address text,age int,number text);""")
    print("student table created")
    conn.commit()
    conn.close()
 
def insert_data():
    name = input("Enter name: ")
    address = input("Enter address: ")
    age = input("Enter age: ")
    number = input("Enter phone number: ")
    conn = psycopg2.connect(dbname="studentdb",user="postgres",password="admin123",host="localhost",port="5433")
    cur = conn.cursor()
    cur.execute("""INSERT INTO students(name,address,age,number) VALUES (%s,%s,%s,%s)""",(name,address,age,number))
    print("student table created")
    conn.commit()
    conn.close()
    
def update_data():
    student_id = input("Enter id of the student to be updated")
    name = input("Enter name to be updated")
    address = input("Enter address to be updated")
    age = input("Enter age to be updated")
    number = input("Enter number to be updated")
    
    conn = psycopg2.connect(dbname="studentdb",user="postgres",password="admin123",host="localhost",port="5433")
    cur = conn.cursor()
    cur.execute("""UPDATE students SET name = %s, address = %s, age = %s, number = %s WHERE student_id = %s""",
                (name, address, age, number, student_id))
    print("student updated")
    conn.commit()
    conn.close()
    
 
update_data()
```

Lecture: Updating single field
Update user selected entry

```
import psycopg2
 
def create_table():
#code to establish a connection to database.
    conn = psycopg2.connect(dbname="studentdb",user="postgres",password="admin123",host="localhost",port="5433")
    cur = conn.cursor()
    cur.execute("""CREATE TABLE students(student_id serial primary key,name text,address text,age int,number text);""")
    print("student table created")
    conn.commit()
    conn.close()
 
def insert_data():
    name = input("Enter name: ")
    address = input("Enter address: ")
    age = input("Enter age: ")
    number = input("Enter phone number: ")
    conn = psycopg2.connect(dbname="studentdb",user="postgres",password="admin123",host="localhost",port="5433")
    cur = conn.cursor()
    cur.execute("""INSERT INTO students(name,address,age,number) VALUES (%s,%s,%s,%s)""",(name,address,age,number))
    print("student table created")
    conn.commit()
    conn.close()
    
def update_data():
    student_id = input("Enter the ID of the student to be updated: ")
    
    # Connect to the database
    conn = psycopg2.connect(dbname="studentdb", user="postgres", password="admin123", host="localhost", port="5433")
    cur = conn.cursor()
    
    # Available fields to update
		#Field name and prompt
    fields = {
        "1": ("name", "Enter the new name: "),
        "2": ("address", "Enter the new address: "),
        "3": ("age", "Enter the new age: "),
        "4": ("number", "Enter the new phone number: ")
    }
    
    print("Which field would you like to update?")
		#Loop through all the fields
    for key in fields:
				# Print the field name
        print(f"{key}: {fields[key][0]}")
		#Accept the choice from user
    field_choice = input("Enter the number of the field you want to update: ")
    
		#If the choice is present, then get the field name i.e name age to be updated
		# on the basis of above choice
    if field_choice in fields:
        field_name, prompt = fields[field_choice]
				# prompt. the user to enter the new value for field
        new_value = input(prompt)
        
        # Constructing and executing the SQL update statement
        sql = f"UPDATE students SET {field_name} = %s WHERE student_id = %s"
        cur.execute(sql, (new_value, student_id))
        
        print(f"{field_name} updated successfully.")
    else:
        print("Invalid choice.")
    
    # Commit changes and close the connection
    conn.commit()
    conn.close()
 
    
 
update_data()
```

Lecture: Deleting data
Delete user selected entry

```
import psycopg2
 
def create_table():
#code to establish a connection to database.
    conn = psycopg2.connect(dbname="studentdb",user="postgres",password="admin123",host="localhost",port="5433")
    cur = conn.cursor()
    cur.execute("""CREATE TABLE students(student_id serial primary key,name text,address text,age int,number text);""")
    print("student table created")
    conn.commit()
    conn.close()
 
def insert_data():
    name = input("Enter name: ")
    address = input("Enter address: ")
    age = input("Enter age: ")
    number = input("Enter phone number: ")
    conn = psycopg2.connect(dbname="studentdb",user="postgres",password="admin123",host="localhost",port="5433")
    cur = conn.cursor()
    cur.execute("""INSERT INTO students(name,address,age,number) VALUES (%s,%s,%s,%s)""",(name,address,age,number))
    print("student table created")
    conn.commit()
    conn.close()
    
def update_data():
    student_id = input("Enter the ID of the student to be updated: ")
    
    # Connect to the database
    conn = psycopg2.connect(dbname="studentdb", user="postgres", password="admin123", host="localhost", port="5433")
    cur = conn.cursor()
    
    # Available fields to update
    fields = {
        "1": ("name", "Enter the new name: "),
        "2": ("address", "Enter the new address: "),
        "3": ("age", "Enter the new age: "),
        "4": ("number", "Enter the new phone number: ")
    }
    
    print("Which field would you like to update?")
    for key in fields:
        print(f"{key}: {fields[key][0]}")
    field_choice = input("Enter the number of the field you want to update: ")
    
    if field_choice in fields:
        field_name, prompt = fields[field_choice]
        new_value = input(prompt)
        
        # Constructing and executing the SQL update statement
        sql = f"UPDATE students SET {field_name} = %s WHERE student_id = %s"
        cur.execute(sql, (new_value, student_id))
        
        print(f"{field_name} updated successfully.")
    else:
        print("Invalid choice.")
    
    # Commit changes and close the connection
    conn.commit()
    conn.close()
 
def delete_data():
    # Prompt the user for the ID of the student to be deleted
    student_id = input("Enter the ID of the student to be deleted: ")
    
    # Connect to the database
    conn = psycopg2.connect(dbname="studentdb", user="postgres", password="admin123", host="localhost", port="5433")
    cur = conn.cursor()
    
    # Check if the student exists
    cur.execute("SELECT * FROM students WHERE student_id = %s", (student_id,))
    student = cur.fetchone()
    
    if student:
        # Show details of the student to be deleted
        print(f"Student to be deleted: ID: {student[0]}, Name: {student[1]}, Address: {student[2]}, Age: {student[3]}, Phone Number: {student[4]}")
        
        # Ask for confirmation
        confirmation = input("Are you sure you want to delete this student? (yes/no): ")
        if confirmation.lower() == 'yes':
            # Perform the deletion
            cur.execute("DELETE FROM students WHERE student_id = %s", (student_id,))
            print("Student record deleted.")
        else:
            print("Deletion cancelled.")
    else:
        print("Student not found.")
    
    # Commit changes and close the connection
    conn.commit()
    conn.close()
 
delete_data()
```

Lecture: Adding menu

```
import psycopg2
 
def create_table():
    conn = psycopg2.connect(dbname="studentdb", user="postgres", password="admin123", host="localhost", port="5433")
    cur = conn.cursor()
    cur.execute("""CREATE TABLE IF NOT EXISTS students(student_id SERIAL PRIMARY KEY, name TEXT, address TEXT, age INT, number TEXT);""")
    print("Student table created.")
    conn.commit()
    conn.close()
 
def insert_data():
    name = input("Enter name: ")
    address = input("Enter address: ")
    age = int(input("Enter age: "))  # Ensure age is an integer
    number = input("Enter phone number: ")
    conn = psycopg2.connect(dbname="studentdb", user="postgres", password="admin123", host="localhost", port="5433")
    cur = conn.cursor()
    cur.execute("""INSERT INTO students(name, address, age, number) VALUES (%s, %s, %s, %s)""", (name, address, age, number))
    print("Data inserted into student table.")
    conn.commit()
    conn.close()
 
def read_data():
    conn = psycopg2.connect(dbname="studentdb", user="postgres", password="admin123", host="localhost", port="5433")
    cur = conn.cursor()
    cur.execute("SELECT * FROM students;")
    students = cur.fetchall()
    print("Displaying all student records:")
    for student in students:
        print(f"ID: {student[0]}, Name: {student[1]}, Address: {student[2]}, Age: {student[3]}, Phone Number: {student[4]}")
    conn.close()
 
def update_data():
    student_id = input("Enter the ID of the student to be updated: ")
    field = input("Enter the field to update (name, address, age, number): ")
    new_value = input(f"Enter the new value for {field}: ")
    sql = f"UPDATE students SET {field} = %s WHERE student_id = %s"
    
    conn = psycopg2.connect(dbname="studentdb", user="postgres", password="admin123", host="localhost", port="5433")
    cur = conn.cursor()
    cur.execute(sql, (new_value, student_id))
    print(f"{field} updated successfully.")
    
    conn.commit()
    conn.close()
 
def delete_data():
    student_id = input("Enter the ID of the student to be deleted: ")
    
    conn = psycopg2.connect(dbname="studentdb", user="postgres", password="admin123", host="localhost", port="5433")
    cur = conn.cursor()
    cur.execute("DELETE FROM students WHERE student_id = %s", (student_id,))
    print("Student record deleted.")
    
    conn.commit()
    conn.close()
 
while True:
    print("\\nWelcome to the Student Management System")
    print("1. Create Table")
    print("2. Insert Data")
    print("3. Read Data")
    print("4. Update Data")
    print("5. Delete Data")
    print("6. Exit")
    choice = input("Enter your choice (1-6): ")
 
    if choice == '1':
        create_table()
    elif choice == '2':
        insert_data()
    elif choice == '3':
        read_data()
    elif choice == '4':
        update_data()
    elif choice == '5':
        delete_data()
    elif choice == '6':
        print("Exiting the program.")
        break
    else:
        print("Invalid choice. Please enter a number between 1 and 6.")

```

Lecture: Creating Tkinter window

```
from tkinter import *
 
root = Tk()
root.title("Student Management System")
#create a frame
frame = LabelFrame(root,text="Student Data")
frame.grid(row=0,column=0,padx=10,pady=10,sticky="ew")
 
#Create label and entry for accepting name and add it to the label
Label(frame,text="Name:").grid(row=0,column=0,padx=2,sticky="w")
name_entry= Entry(frame)
name_entry.grid(row=0,column=1,pady=2,sticky="ew")
 
Label(frame,text="Address:").grid(row=1,column=0,padx=2,sticky="w")
address_entry= Entry(frame)
address_entry.grid(row=1,column=1,pady=2,sticky="ew")
 
Label(frame,text="Age:").grid(row=2,column=0,padx=2,sticky="w")
age_entry= Entry(frame)
age_entry.grid(row=2,column=1,pady=2,sticky="ew")
 
Label(frame,text="Phone Number:").grid(row=3,column=0,padx=2,sticky="w")
number_entry= Entry(frame)
number_entry.grid(row=3,column=1,pady=2,sticky="ew")
 
Button(button_frame,text="Create Table")
 
root.mainloop()
```

### Lecture: Adding buttons

```
from tkinter import *
 
root = Tk()
root.title("Student Management System")
#create a frame
frame = LabelFrame(root,text="Student Data")
frame.grid(row=0,column=0,padx=10,pady=10,sticky="ew")
 
#Create label and entry for accepting name and add it to the label
Label(frame,text="Name:").grid(row=0,column=0,padx=2,sticky="w")
name_entry= Entry(frame)
name_entry.grid(row=0,column=1,pady=2,sticky="ew")
 
Label(frame,text="Address:").grid(row=1,column=0,padx=2,sticky="w")
address_entry= Entry(frame)
address_entry.grid(row=1,column=1,pady=2,sticky="ew")
 
Label(frame,text="Age:").grid(row=2,column=0,padx=2,sticky="w")
age_entry= Entry(frame)
age_entry.grid(row=2,column=1,pady=2,sticky="ew")
 
Label(frame,text="Phone Number:").grid(row=3,column=0,padx=2,sticky="w")
number_entry= Entry(frame)
number_entry.grid(row=3,column=1,pady=2,sticky="ew")
 
#Create buttons for operations
button_frame = Frame(root)
button_frame.grid(row=1,column=0,pady=5,sticky="ew")
 
# New code added....................................................
Button(button_frame,text="Create Table").grid(row=0,column=0,padx=5)
Button(button_frame,text="Insert Data").grid(row=0,column=1,padx=5)
Button(button_frame,text="Update Data").grid(row=0,column=2,padx=5)
Button(button_frame,text="Delete Data").grid(row=0,column=3,padx=5)
# New code added....................................................
root.mainloop()
```


### Lecture: Creating a treeview

```
from tkinter import *
# New code added...............................................
from tkinter import ttk
# New code added...............................................
root = Tk()
root.title("Student Management System")
#create a frame
frame = LabelFrame(root,text="Student Data")
frame.grid(row=0,column=0,padx=10,pady=10,sticky="ew")
 
#Create label and entry for accepting name and add it to the label
Label(frame,text="Name:").grid(row=0,column=0,padx=2,sticky="w")
name_entry= Entry(frame)
name_entry.grid(row=0,column=1,pady=2,sticky="ew")
 
Label(frame,text="Address:").grid(row=1,column=0,padx=2,sticky="w")
address_entry= Entry(frame)
address_entry.grid(row=1,column=1,pady=2,sticky="ew")
 
Label(frame,text="Age:").grid(row=2,column=0,padx=2,sticky="w")
age_entry= Entry(frame)
age_entry.grid(row=2,column=1,pady=2,sticky="ew")
 
Label(frame,text="Phone Number:").grid(row=3,column=0,padx=2,sticky="w")
number_entry= Entry(frame)
number_entry.grid(row=3,column=1,pady=2,sticky="ew")
 
#Create buttons for operations
button_frame = Frame(root)
button_frame.grid(row=1,column=0,pady=5,sticky="ew")
 
Button(button_frame,text="Create Table").grid(row=0,column=0,padx=5)
Button(button_frame,text="Insert Table").grid(row=0,column=1,padx=5)
Button(button_frame,text="Update Table").grid(row=0,column=2,padx=5)
Button(button_frame,text="Delete Table").grid(row=0,column=3,padx=5)
 
# New code added...............................................
#Create a frame for the treeview
tree_frame = Frame(root)
tree_frame.grid(row=2,column=0,padx=10,sticky="nsew")
 
#Create a scrollbar for the treeview and add it to the right
tree_scroll = Scrollbar(tree_frame)
tree_scroll.pack(side=RIGHT,fill=Y)
 
#Creating a treeview
tree = ttk.Treeview(tree_frame, yscrollcommand=tree_scroll.set, selectmode="browse")
tree.pack()
# New code added...............................................
tree_scroll.config(command=tree.yview)
root.mainloop()
```

Lecture: Configuring columns

```
from tkinter import *
from tkinter import ttk
root = Tk()
root.title("Student Management System")
#create a frame
frame = LabelFrame(root,text="Student Data")
frame.grid(row=0,column=0,padx=10,pady=10,sticky="ew")
 
#Create label and entry for accepting name and add it to the label
Label(frame,text="Name:").grid(row=0,column=0,padx=2,sticky="w")
name_entry= Entry(frame)
name_entry.grid(row=0,column=1,pady=2,sticky="ew")
 
Label(frame,text="Address:").grid(row=1,column=0,padx=2,sticky="w")
address_entry= Entry(frame)
address_entry.grid(row=1,column=1,pady=2,sticky="ew")
 
Label(frame,text="Age:").grid(row=2,column=0,padx=2,sticky="w")
age_entry= Entry(frame)
age_entry.grid(row=2,column=1,pady=2,sticky="ew")
 
Label(frame,text="Phone Number:").grid(row=3,column=0,padx=2,sticky="w")
number_entry= Entry(frame)
number_entry.grid(row=3,column=1,pady=2,sticky="ew")
 
#Create buttons for operations
button_frame = Frame(root)
button_frame.grid(row=1,column=0,pady=5,sticky="ew")
 
Button(button_frame,text="Create Table").grid(row=0,column=0,padx=5)
Button(button_frame,text="Insert Table").grid(row=0,column=1,padx=5)
Button(button_frame,text="Update Table").grid(row=0,column=2,padx=5)
Button(button_frame,text="Delete Table").grid(row=0,column=3,padx=5)
 
#Create a frame for the treeview
tree_frame = Frame(root)
tree_frame.grid(row=2,column=0,padx=10,sticky="nsew")
 
#Create a scrollbar for the treeview and add it to the right
tree_scroll = Scrollbar(tree_frame)
tree_scroll.pack(side=RIGHT,fill=Y)
 
#Creating a treeview
tree = ttk.Treeview(tree_frame, yscrollcommand=tree_scroll.set, selectmode="browse")
tree.pack()
 
tree_scroll.config(command=tree.yview)
 
tree['columns'] = ("student_id", "name", "address", "age", "number")
tree.column("#0", width=0, stretch=NO)
tree.column("student_id", anchor=CENTER, width=80)
tree.column("name", anchor=W, width=120)
tree.column("address", anchor=W, width=120)
tree.column("age", anchor=CENTER, width=50)
tree.column("number", anchor=W, width=120)
 
tree.heading("student_id", text="ID", anchor=CENTER)
tree.heading("name", text="Name", anchor=CENTER)
tree.heading("address", text="Address", anchor=CENTER)
tree.heading("age", text="Age", anchor=CENTER)
tree.heading("number", text="Phone Number", anchor=CENTER)
 
root.mainloop()
```

Lecture: Execute query method

```
from tkinter import *
from tkinter import ttk
 
#new code added ..........................................
import psycopg2
#new code added ..........................................
 
#new code added ..........................................
def run_query(query, parameters=()):
    conn = psycopg2.connect(dbname="studentdb", user="postgres", password="admin123", host="localhost", port="5432")
    cur = conn.cursor()
    query_result = None
    try:
        cur.execute(query, parameters)
        if query.lower().startswith("select"):
            query_result = cur.fetchall()
        conn.commit()
    except psycopg2.Error as e:
        messagebox.showerror("Database Error", str(e))
    finally:
        cur.close()
        conn.close()
    return query_result
 
def refresh_treeview():
    # Clear the current items in the treeview
    for item in tree.get_children():
        tree.delete(item)
    # Re-fetch and display the updated data
    records = run_query("SELECT * FROM students;")
    for record in records:
        tree.insert('', END, values=record)
#new code added ..........................................
 
root = Tk()
root.title("Student Management System")
#create a frame
frame = LabelFrame(root,text="Student Data")
frame.grid(row=0,column=0,padx=10,pady=10,sticky="ew")
 
#Create label and entry for accepting name and add it to the label
Label(frame,text="Name:").grid(row=0,column=0,padx=2,sticky="w")
name_entry= Entry(frame)
name_entry.grid(row=0,column=1,pady=2,sticky="ew")
 
Label(frame,text="Address:").grid(row=1,column=0,padx=2,sticky="w")
address_entry= Entry(frame)
address_entry.grid(row=1,column=1,pady=2,sticky="ew")
 
Label(frame,text="Age:").grid(row=2,column=0,padx=2,sticky="w")
age_entry= Entry(frame)
age_entry.grid(row=2,column=1,pady=2,sticky="ew")
 
Label(frame,text="Phone Number:").grid(row=3,column=0,padx=2,sticky="w")
number_entry= Entry(frame)
number_entry.grid(row=3,column=1,pady=2,sticky="ew")
 
#Create buttons for operations
button_frame = Frame(root)
button_frame.grid(row=1,column=0,pady=5,sticky="ew")
 
Button(button_frame,text="Create Table").grid(row=0,column=0,padx=5)
Button(button_frame,text="Insert Table").grid(row=0,column=1,padx=5)
Button(button_frame,text="Update Table").grid(row=0,column=2,padx=5)
Button(button_frame,text="Delete Table").grid(row=0,column=3,padx=5)
 
#Create a frame for the treeview
tree_frame = Frame(root)
tree_frame.grid(row=2,column=0,padx=10,sticky="nsew")
 
#Create a scrollbar for the treeview and add it to the right
tree_scroll = Scrollbar(tree_frame)
tree_scroll.pack(side=RIGHT,fill=Y)
 
#Creating a treeview
tree = ttk.Treeview(tree_frame, yscrollcommand=tree_scroll.set, selectmode="browse")
tree.pack()
 
tree_scroll.config(command=tree.yview)
 
tree['columns'] = ("student_id", "name", "address", "age", "number")
tree.column("#0", width=0, stretch=NO)
tree.column("student_id", anchor=CENTER, width=80)
tree.column("name", anchor=W, width=120)
tree.column("address", anchor=W, width=120)
tree.column("age", anchor=CENTER, width=50)
tree.column("number", anchor=W, width=120)
 
tree.heading("student_id", text="ID", anchor=CENTER)
tree.heading("name", text="Name", anchor=CENTER)
tree.heading("address", text="Address", anchor=CENTER)
tree.heading("age", text="Age", anchor=CENTER)
tree.heading("number", text="Phone Number", anchor=CENTER)
 
# Initial refresh to display any existing records
 
#new code added ..........................................
refresh_treeview()
#new code added ..........................................
root.mainloop()
```

### Lecture: Refresh Treeview & Editing 

```
Completing other functions:
def create_table():
    query = "CREATE TABLE IF NOT EXISTS students(student_id SERIAL PRIMARY KEY, name TEXT, address TEXT, age INT, number TEXT);"
    run_query(query)
    messagebox.showinfo("Information", "Table created successfully.")
    refresh_treeview()
 
def insert_data():
    query = "INSERT INTO students(name, address, age, number) VALUES (%s, %s, %s, %s)"
    parameters = (name_entry.get(), address_entry.get(), age_entry.get(), number_entry.get())
    run_query(query, parameters)
    messagebox.showinfo("Information", "Data inserted successfully.")
    refresh_treeview()
 
def update_data():
    selected_item = tree.selection()[0]  # Get selected item
    student_id = tree.item(selected_item)['values'][0]
    query = "UPDATE students SET name = %s, address = %s, age = %s, number = %s WHERE student_id = %s"
    parameters = (name_entry.get(), address_entry.get(), age_entry.get(), number_entry.get(), student_id)
    run_query(query, parameters)
    messagebox.showinfo("Information", "Data updated successfully.")
    refresh_treeview()
 
def delete_data():
    selected_item = tree.selection()[0]  # Get selected item
    student_id = tree.item(selected_item)['values'][0]
    query = "DELETE FROM students WHERE student_id = %s"
    parameters = (student_id,)
    run_query(query, parameters)
    messagebox.showinfo("Information", "Data deleted successfully.")
    refresh_treeview()
 
Now add the function calls to command of the respective buttons:

Button(button_frame, text="Create Table", command=create_table).grid(row=0, column=0, padx=5)
Button(button_frame, text="Insert Data", command=insert_data).grid(row=0, column=1, padx=5)
Button(button_frame, text="Update Data", command=update_data).grid(row=0, column=2, padx=5)
Button(button_frame, text="Delete Data", command=delete_data).grid(row=0, column=3, padx=5)
 

Entire project code:

from tkinter import *
from tkinter import ttk
import psycopg2
 
def run_query(query, parameters=()):
    conn = psycopg2.connect(dbname="studentdb", user="postgres", password="admin123", host="localhost", port="5432")
    cur = conn.cursor()
    query_result = None
    try:
        cur.execute(query, parameters)
        if query.lower().startswith("select"):
            query_result = cur.fetchall()
        conn.commit()
    except psycopg2.Error as e:
        messagebox.showerror("Database Error", str(e))
    finally:
        cur.close()
        conn.close()
    return query_result
 
def refresh_treeview():
    # Clear the current items in the treeview
    for item in tree.get_children():
        tree.delete(item)
    # Re-fetch and display the updated data
    records = run_query("SELECT * FROM students;")
    for record in records:
        tree.insert('', END, values=record)
 
def create_table():
    query = "CREATE TABLE IF NOT EXISTS students(student_id SERIAL PRIMARY KEY, name TEXT, address TEXT, age INT, number TEXT);"
    run_query(query)
    messagebox.showinfo("Information", "Table created successfully.")
    refresh_treeview()
 
def insert_data():
    query = "INSERT INTO students(name, address, age, number) VALUES (%s, %s, %s, %s)"
    parameters = (name_entry.get(), address_entry.get(), age_entry.get(), number_entry.get())
    run_query(query, parameters)
    messagebox.showinfo("Information", "Data inserted successfully.")
    refresh_treeview()
 
def update_data():
    selected_item = tree.selection()[0]  # Get selected item
    student_id = tree.item(selected_item)['values'][0]
    query = "UPDATE students SET name = %s, address = %s, age = %s, number = %s WHERE student_id = %s"
    parameters = (name_entry.get(), address_entry.get(), age_entry.get(), number_entry.get(), student_id)
    run_query(query, parameters)
    messagebox.showinfo("Information", "Data updated successfully.")
    refresh_treeview()
 
def delete_data():
    selected_item = tree.selection()[0]  # Get selected item
    student_id = tree.item(selected_item)['values'][0]
    query = "DELETE FROM students WHERE student_id = %s"
    parameters = (student_id,)
    run_query(query, parameters)
    messagebox.showinfo("Information", "Data deleted successfully.")
    refresh_treeview()
 
# Setting up the main window
root = Tk()
root.title("Student Management System")
 
# Input fields and labels
frame = LabelFrame(root, text="Student Data")
frame.grid(row=0, column=0, padx=10, pady=10, sticky="ew")
 
Label(frame, text="Name:").grid(row=0, column=0, pady=2, sticky="w")
name_entry = Entry(frame)
name_entry.grid(row=0, column=1, pady=2, sticky="ew")
 
Label(frame, text="Address:").grid(row=1, column=0, pady=2, sticky="w")
address_entry = Entry(frame)
address_entry.grid(row=1, column=1, pady=2, sticky="ew")
 
Label(frame, text="Age:").grid(row=2, column=0, pady=2, sticky="w")
age_entry = Entry(frame)
age_entry.grid(row=2, column=1, pady=2, sticky="ew")
 
Label(frame, text="Phone Number:").grid(row=3, column=0, pady=2, sticky="w")
number_entry = Entry(frame)
number_entry.grid(row=3, column=1, pady=2, sticky="ew")
 
# Buttons for operations
button_frame = Frame(root)
button_frame.grid(row=1, column=0, pady=5, sticky="ew")
 
Button(button_frame, text="Create Table", command=create_table).grid(row=0, column=0, padx=5)
Button(button_frame, text="Insert Data", command=insert_data).grid(row=0, column=1, padx=5)
Button(button_frame, text="Update Data", command=update_data).grid(row=0, column=2, padx=5)
Button(button_frame, text="Delete Data", command=delete_data).grid(row=0, column=3, padx=5)
 
# Treeview for displaying the student records
tree_frame = Frame(root)
tree_frame.grid(row=2, column=0, pady=10, sticky="nsew")
 
tree_scroll = Scrollbar(tree_frame)
tree_scroll.pack(side=RIGHT, fill=Y)
 
tree = ttk.Treeview(tree_frame, yscrollcommand=tree_scroll.set, selectmode="browse")
tree.pack()
 
tree_scroll.config(command=tree.yview)
 
tree['columns'] = ("student_id", "name", "address", "age", "number")
tree.column("#0", width=0, stretch=NO)
tree.column("student_id", anchor=CENTER, width=80)
tree.column("name", anchor=W, width=120)
tree.column("address", anchor=W, width=120)
tree.column("age", anchor=CENTER, width=50)
tree.column("number", anchor=W, width=120)
 
tree.heading("student_id", text="ID", anchor=CENTER)
tree.heading("name", text="Name", anchor=CENTER)
tree.heading("address", text="Address", anchor=CENTER)
tree.heading("age", text="Age", anchor=CENTER)
tree.heading("number", text="Phone Number", anchor=CENTER)
 
# Initial refresh to display any existing records
refresh_treeview()
 
root.mainloop()
```