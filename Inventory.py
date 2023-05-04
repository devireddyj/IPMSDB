import pymysql
# connecting to the Mysql database
db = pymysql.connect(host='localhost',    
                     user='root',         
                     password='Alto@800', 
                     database = 'test'
                     )        


#Customer subset data from Test database.
def report():
    c = db.cursor()
    CustomerTable_select = """SELECT * FROM test.customer"""
    c.execute(CustomerTable_select)
    CustomerTable_data = c.fetchall()
    for e in CustomerTable_data:
        print(e)
        continue
report()
db.close()