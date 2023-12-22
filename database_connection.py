import mysql.connector

def database_connection():
    db = mysql.connector.connect(
        host="localhost",
        user="", # Insert user
        password="", # Insert password
    )
    
    return db
