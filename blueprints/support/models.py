from abc import ABC
import flask

from abstract.model import AbstractModel
from database.sql_provider import SQLProvider
from database.operations import select_sql, execute_sql


class SupportHandle(AbstractModel, ABC):
    def __init__(self):
        self.sql_provider = SQLProvider('blueprints/support/sql')
        self.db_config = flask.current_app.config['MYSQL_DB_CONFIG']

    def execute(self):
        return {'login': flask.session['login'][:-8]}


class NewRequestHandle(AbstractModel, ABC):
    def __init__(self):
        self.sql_provider = SQLProvider('blueprints/support/sql')
        self.db_config = flask.current_app.config['MYSQL_DB_CONFIG']

    def execute(self):
        sql_statement_new_requests = self.sql_provider.get('get_new_requests.sql', {})
        requests = select_sql(self.db_config, sql_statement_new_requests)
        if requests:
            return {'status': 'success', 'requests': requests}
        else:
            return {'status': 'error', 'error_type': 'Нет обращений'}


class NewRequestPostHandle(AbstractModel, ABC):
    def __init__(self):
        self.sql_provider = SQLProvider('blueprints/support/sql')
        self.db_config = flask.current_app.config['MYSQL_DB_CONFIG']

    def execute(self, id_request):
        sql_statement_upd_request = self.sql_provider.get('set_request_pending.sql',
                                                           {'request_id': id_request})
        result = execute_sql(self.db_config, sql_statement_upd_request)
        if result:
            return {'status': 'success', 'success_type': 'Обращение взято в работу'}
        else:
            return {'status': 'error', 'error_type': 'Нет обращений'}


class InProgressRequestHandle(AbstractModel, ABC):
    def __init__(self):
        self.sql_provider = SQLProvider('blueprints/support/sql')
        self.db_config = flask.current_app.config['MYSQL_DB_CONFIG']

    def execute(self):
        sql_statement_new_requests = self.sql_provider.get('get_pending_requests.sql', {})
        requests = select_sql(self.db_config, sql_statement_new_requests)
        if requests:
            return {'status': 'success', 'requests': requests}
        else:
            return {'status': 'error', 'error_type': 'Нет обращений'}


class InProgressRequestPostHandle(AbstractModel, ABC):
    def __init__(self):
        self.sql_provider = SQLProvider('blueprints/support/sql')
        self.db_config = flask.current_app.config['MYSQL_DB_CONFIG']

    def execute(self, id_request, response):
        sql_statement_set_answer = self.sql_provider.get('set_request_answer.sql',
                                                         {'request_id': id_request, 'response': response})
        result = execute_sql(self.db_config, sql_statement_set_answer)
        if result:
            return {'status': 'success', 'success_type': 'Ответ на обращение отправлен'}
        else:
            return {'status': 'error', 'error_type': 'Нет обращений'}


class ClosedRequestHandle(AbstractModel, ABC):
    def __init__(self):
        self.sql_provider = SQLProvider('blueprints/support/sql')
        self.db_config = flask.current_app.config['MYSQL_DB_CONFIG']

    def execute(self):
        sql_statement_new_requests = self.sql_provider.get('get_closed_requests.sql', {})
        requests = select_sql(self.db_config, sql_statement_new_requests)
        if requests:
            return {'status': 'success', 'requests': requests}
        else:
            return {'status': 'error', 'error_type': 'Нет обращений'}


class RequestIdQueryHandle(AbstractModel, ABC):
    def __init__(self):
        self.sql_provider = SQLProvider('blueprints/support/sql')
        self.db_config = flask.current_app.config['MYSQL_DB_CONFIG']

    def execute(self, request_id):
        sql_statement_request = self.sql_provider.get('get_request_by_id.sql', {'request_id': request_id})
        request = select_sql(self.db_config, sql_statement_request)
        if request:
            return {'status': 'success', 'requests': request}
        else:
            return {'status': 'error', 'error_type': 'Обращение не найдено'}


class RequestSurnameHandle(AbstractModel, ABC):
    def __init__(self):
        self.sql_provider = SQLProvider('blueprints/support/sql')
        self.db_config = flask.current_app.config['MYSQL_DB_CONFIG']

    def execute(self, surname):
        surname = surname.capitalize()
        sql_statement_request = self.sql_provider.get('get_request_by_surname.sql', {'surname': surname})
        request = select_sql(self.db_config, sql_statement_request)
        if request:
            return {'status': 'success', 'requests': request}
        else:
            return {'status': 'error', 'error_type': 'Обращений не найдено'}


class RequestCustomerIDHandle(AbstractModel, ABC):
    def __init__(self):
        self.sql_provider = SQLProvider('blueprints/support/sql')
        self.db_config = flask.current_app.config['MYSQL_DB_CONFIG']

    def execute(self, customer_id):
        sql_statement_request = self.sql_provider.get('get_request_by_customer_id.sql', {'customer_id': customer_id})
        request = select_sql(self.db_config, sql_statement_request)
        if request:
            return {'status': 'success', 'requests': request}
        else:
            return {'status': 'error', 'error_type': 'Обращений не найдено'}


class QueryTransactionsHandle(AbstractModel, ABC):
    def __init__(self):
        self.sql_provider = SQLProvider('blueprints/support/sql')
        self.db_config = flask.current_app.config['MYSQL_DB_CONFIG']

    def execute(self, customer_id):
        sql_statement_tx_count = self.sql_provider.get('get_transactions_count.sql',
                                                       {'id_client': customer_id})
        tx_count = select_sql(self.db_config, sql_statement_tx_count)

        sql_statement_txs = self.sql_provider.get('get_transactions.sql',
                                                  {'id_client': customer_id})

        txs = select_sql(self.db_config, sql_statement_txs)
        if txs:
            return {'status': 'success', 'tx_count': tx_count[0]['COUNT(*)'], 'transactions': txs}
        else:
            return {'status': 'error', 'error_type': 'По данному номеру клиента не найдено переводов'}


class QueryAccountsHandle(AbstractModel, ABC):
    def __init__(self):
        self.sql_provider = SQLProvider('blueprints/support/sql')
        self.db_config = flask.current_app.config['MYSQL_DB_CONFIG']

    def execute(self, customer_id):
        sql_statement_accounts = self.sql_provider.get('get_accounts.sql',
                                                       {'id_client': customer_id})
        accounts = select_sql(self.db_config, sql_statement_accounts)
        if accounts:
            return {'status': 'success', 'accounts': accounts}
        else:
            return {'status': 'error', 'error_type': 'По данному номеру клиента не найдено счетов'}