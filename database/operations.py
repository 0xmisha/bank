from database.connection import DBContextManager
import pymysql


def select_sql(db_config, _sql):
    with DBContextManager(db_config) as cursor:
        if cursor:
            cursor.execute(_sql)
            schema = [column[0] for column in cursor.description]
            result = [dict(zip(schema, row)) for row in cursor.fetchall()]
            return result
        else:
            raise ValueError("ERROR. CURSOR NOT CREATED!")


def execute_sql(db_config, _sql):
    with DBContextManager(db_config) as cursor:
        if cursor:
            cursor.execute(_sql)
            return True


def call_stored_procedure(db_config, procedure_name, params):
    with DBContextManager(db_config) as cursor:
        if cursor:
            cursor.callproc(procedure_name, params)
            result = cursor.fetchall()
            return result
        else:
            raise ValueError("ERROR. CURSOR NOT CREATED!")


def execute_transaction(db_config, amount, sender, receiver):
    with DBContextManager(db_config) as cursor:
        if cursor:
            with open('blueprints/customer/sql/send_transaction.sql', 'r') as file:
                queries = file.read().split(';')
            for query in queries:
                if query.strip() != "":
                    query = query.replace('$amount', str(amount))
                    query = query.replace('$sender', str(sender))
                    query = query.replace('$receiver', str(receiver))

                    cursor.execute(query)
        else:
            raise ValueError("ERROR. CURSOR NOT CREATED!")
