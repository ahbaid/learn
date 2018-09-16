if __name__ == '__main__':

   import cx_Oracle

   dsn=cx_Oracle.makedsn('test.db.server.com','7700','test')

   print "CONNECTION STRING::",dsn,"\n"

   db=cx_Oracle.connect('scott','tiger',dsn)

   cursor=db.cursor()

   sql="""
      select table_name, tablespace_name 
      from dba_tables 
      where owner = 'SCOTT' 
      order by 1
   """

   print sql,"\n"

   cursor.execute(sql)

   for tname, tspc in cursor.fetchall():
      print tname," -> ",tspc

   db.close()
