from abc import ABC
import flask

from abstract.model import AbstractModel
from database.sql_provider import SQLProvider
from database.operations import select_sql, execute_sql


class LoginHandle(AbstractModel, ABC):
    def __init__(self):
        self.sql_provider = SQLProvider('blueprints/auth/sql')
        self.db_config = flask.current_app.config['MYSQL_DB_CONFIG']

    def execute(self, login, password):
        user_type = 'internal' if login.endswith('_ceo') or login.endswith('_mngr') or login.endswith('_support')\
            else 'external'
        sql_statement_pass = self.sql_provider.get(f'check_{user_type}_pass.sql', {'login': login})
        sql_pass = select_sql(self.db_config, sql_statement_pass)

        if not sql_pass or sql_pass[0]['password'] != password:
            return {'is_auth': False, 'message': "Неверный логин или пароль"}

        sql_statement_role = self.sql_provider.get(f'get_{user_type}_role.sql',
                                                   {'login': login, 'password': password})
        sql_role = select_sql(self.db_config, sql_statement_role)

        user_data = {
            'is_auth': True,
            'role': sql_role[0]['role']
        }

        if user_data['role'] == 'customer':
            sql_statement_id = self.sql_provider.get('get_customer_id.sql', {'login': login})
            sql_id = select_sql(self.db_config, sql_statement_id)
            user_data['customer_id'] = sql_id[0]['id']
            flask.session['customer_id'] = sql_id[0]['id']

        if user_data['is_auth']:
            flask.session['is_auth'] = True
            flask.session['role'] = user_data['role']
            flask.session['login'] = login

        return user_data


class RegisterHandle(AbstractModel, ABC):
    def __init__(self):
        self.sql_provider = SQLProvider('blueprints/auth/sql')
        self.db_config = flask.current_app.config['MYSQL_DB_CONFIG']

    def execute(self, login, password, confirm_password):
        if password != confirm_password:
            return {'status': 'error', 'reason': 'mismatch'}

        if login.endswith('_ceo') or login.endswith('_mngr'):
            return {'status': 'error', 'reason': 'internal'}

        if select_sql(flask.current_app.config['MYSQL_DB_CONFIG'],
                      self.sql_provider.get('check_user.sql', {'login': login})):
            return {'status': 'error', 'reason': 'exists'}

        execute_sql(flask.current_app.config['MYSQL_DB_CONFIG'],
                    self.sql_provider.get('new_user.sql', {'login': login, 'password': password}))

        sql_statement_id = self.sql_provider.get('get_customer_id.sql', {'login': login})
        sql_id = select_sql(self.db_config, sql_statement_id)

        flask.session.update({'is_auth': True, 'role': 'customer', 'customer_id': sql_id[0]['id']})

        return {'status': 'success'}


class LogoutHandle(AbstractModel, ABC):
    def __init__(self):
        self.sql_provider = SQLProvider('blueprints/auth/sql')
        self.db_config = flask.current_app.config['MYSQL_DB_CONFIG']

    def execute(self):
        flask.session.clear()

        user_data = {
            'success': True,
        }

        return user_data
