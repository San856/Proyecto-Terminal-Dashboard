import time 
import psycopg2
#from config import config

class sql(object):

    def __init__(self,cliente,valor):
        self.cliente=cliente
        self.valor=valor
    
    def mostrar(self):
        print(self.valor)

    def connect(self):
        # Ejecutamos una sentencia SQL que crea una tabla nueva
        sentenciaSQL = """INSERT INTO "regTemperaturaSensor1"(cliente, ffechaunix, fmedicion) VALUES (%s, now(), %s);"""
        data_registro = (self.cliente,self.valor)
        conn = None
        try:
            # Leemos los parámetros de conexión

            # Conectamos con el servidor PostgreSQL
            print('Conectando con PostgreSQL...')
            conn = psycopg2.connect(host= "172.30.1.101", 
                                        database="iotwsn-pt", 
                                        user="iotwsn-pt", 
                                        password="iot$2022UaM")

            # creamos un cursor
            cur = conn.cursor()

            # Ejecutamos una sentencia SQL
            #print('La version de PostgreSQL es la:')
            cur.execute(sentenciaSQL,data_registro)
            conn.commit()

            # Mostramos la versión de PostgreSQL que hemos solicitado con la sentencia anterior
            #db_version = cur.fetchone()
            #print(db_version)
        

            # Cerramos la comunicación con PostgreSQL
            cur.close()
        except (Exception, psycopg2.DatabaseError) as error:
            print(error)
        finally:
            if conn is not None:
                conn.close()
                print('Database connection closed.')