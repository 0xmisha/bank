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


def send_transaction(db_config, sql_statements):
    with DBContextManager(db_config) as cursor:
        if not cursor:
            raise ValueError('Курсор не создан')

        for sql in sql_statements:
            cursor.execute(sql)

        return True