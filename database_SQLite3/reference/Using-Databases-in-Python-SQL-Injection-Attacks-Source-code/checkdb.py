import sqlite3

conn = sqlite3.connect("contacts.sqlite")

for row in conn.execute("SELECT * FROM sqlite_master"):
    print(row)

conn.close()
