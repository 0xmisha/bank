from abc import ABC
import flask
from flask import session
from abstract.model import AbstractModel
from database.sql_provider import SQLProvider
from database.operations import select_sql, execute_sql, execute_transaction
from datetime import datetime


class BaseHandle(AbstractModel, ABC):
    def __init__(self):
        self.sql_provider = SQLProvider('blueprints/customer/sql')
        self.db_config = flask.current_app.config['MYSQL_DB_CONFIG']

    def execute(self):
        sql_statement_name = self.sql_provider.get('get_login.sql',
                                                   {'customer_id': flask.session['customer_id']})
        sql_name = select_sql(self.db_config, sql_statement_name)

        sql_statement_balance = self.sql_provider.get('get_total_balance.sql',
                                                      {'customer_id': flask.session['customer_id']})
        sql_balance = select_sql(self.db_config, sql_statement_balance)
        balance = sql_balance[0]['total_balance'] if sql_balance[0]['total_balance'] is not None else 0

        return {'login': sql_name[0]['login'], 'balance': balance}


class WelcomeFormHandle(AbstractModel, ABC):
    def __init__(self):
        self.sql_provider = SQLProvider('blueprints/customer/sql')
        self.db_config = flask.current_app.config['MYSQL_DB_CONFIG']

    def execute(self, surname, birth, address, phone):
        current_date = datetime.now().strftime('%Y-%m-%d')
        sql_123 = self.sql_provider.get('create_account.sql',
                                        {'surname': surname, 'birth': birth, 'address': address,
                                         'phone': phone, 'open_date': current_date})
        execute_sql(self.db_config, sql_123)

        return {'success': True}


class TransferHandleGet(AbstractModel, ABC):
    def __init__(self):
        self.sql_provider = SQLProvider('blueprints/customer/sql')
        self.db_config = flask.current_app.config['MYSQL_DB_CONFIG']

    def execute(self):
        sql_transaction = self.sql_provider.get('get_accounts.sql',
                                                {'client': flask.session['customer_id']})
        sql_res = select_sql(self.db_config, sql_transaction)
        return {'success': True, 'accounts': sql_res}


class TransferHandle(AbstractModel, ABC):
    def __init__(self):
        self.sql_provider = SQLProvider('blueprints/customer/sql')
        self.db_config = flask.current_app.config['MYSQL_DB_CONFIG']

    def execute(self, receiver, amount, sender):
        if float(amount) <= 0:
            session['transfer_status'] = 'Неверное значение суммы перевода.'
            return {'status': 'error'}

        if receiver == sender:
            session['transfer_status'] = 'Запрещено совершать переводы в рамках одного счета.'
            return {'status': 'error'}

        sql_statement_acc_bal = self.sql_provider.get('account_balance.sql',
                                                      {'id_account': sender})
        acc_bal = select_sql(self.db_config, sql_statement_acc_bal)
        if float(amount) > acc_bal[0]['balance']:
            session['transfer_status'] = 'Недостаточно средств на счете.'
            return {'status': 'error'}

        sql_statement_acc_exists = self.sql_provider.get('accounts_exists.sql',
                                                         {'id_account': receiver})
        acc_exists = select_sql(self.db_config, sql_statement_acc_exists)
        if not acc_exists:
            session['transfer_status'] = 'Ошибка в номере счета получателя. Средства не были списаны.'
            return {'status': 'error'}

        execute_transaction(self.db_config, amount, sender, receiver)
        session['transfer_status'] = 'Перевод успешно выполнен.'
        return {'status': 'success'}


class AccountHistoryHandle(AbstractModel, ABC):
    def __init__(self):
        self.sql_provider = SQLProvider('blueprints/customer/sql')
        self.db_config = flask.current_app.config['MYSQL_DB_CONFIG']

    def execute(self):
        sql_statement_accounts = self.sql_provider.get('get_accounts.sql',
                                                       {'client': flask.session['customer_id']})
        accounts = select_sql(self.db_config, sql_statement_accounts)

        accounts_history = {}

        for account in accounts:
            sql_statement_acc_history = self.sql_provider.get('get_transaction_history.sql',
                                                              {'account': account['id_account']})
            acc_history = select_sql(self.db_config, sql_statement_acc_history)
            accounts_history[account['id_account']] = acc_history
        for account_id, transactions in accounts_history.items():
            for transaction in transactions:
                transaction['amount'] = round(transaction['amount'])
                transaction['transfer_date'] = transaction['transfer_date'].strftime('%dth %B %Y %H:%M:%S')

        return accounts_history


class CreateReportHandle(AbstractModel, ABC):
    def __init__(self):
        self.sql_provider = SQLProvider('blueprints/customer/sql')
        self.db_config = flask.current_app.config['MYSQL_DB_CONFIG']

    def execute(self, topic, text):
        sql_statement_request = self.sql_provider.get('create_request.sql',
                                                      {'customer': flask.session['customer_id'],
                                                       'description': text, 'topic': topic})
        request_res = execute_sql(self.db_config, sql_statement_request)
        if request_res:
            return {'status': 'success', 'success_type': 'Обращение успешно создано'}
        else:
            return {'status': 'error', 'error_type': 'Ошибка при создании обращения'}


class HistoryReportHandle(AbstractModel, ABC):
    def __init__(self):
        self.sql_provider = SQLProvider('blueprints/customer/sql')
        self.db_config = flask.current_app.config['MYSQL_DB_CONFIG']

    def execute(self):
        sql_statement_requests = self.sql_provider.get('get_requests.sql',
                                                       {'customer_id': flask.session['customer_id']})
        requests_res = select_sql(self.db_config, sql_statement_requests)
        if requests_res:
            return {'status': 'success', 'data': requests_res}
        else:
            return {'status': 'error', 'error_type': 'У вас пока нет обращений'}
