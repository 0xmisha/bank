from datetime import datetime
from abc import ABC
import flask
from datetime import datetime, timedelta, date

from abstract.model import AbstractModel
from database.sql_provider import SQLProvider
from database.operations import select_sql


def calculate_birth_date(age):
    return datetime.now() - timedelta(days=int(age) * 365.25)


def list_to_dict_by_topic(data):
    result_dict = {}
    for item in data:
        topic = item['topic']
        item.pop('topic', None)
        if topic not in result_dict:
            result_dict[topic] = []
        result_dict[topic].append(item)
    return result_dict


def list_to_dict_by_request_topic(data):
    result_dict = {}
    for item in data:
        topic = item['request_topic']
        item.pop('request_topic', None)
        if topic not in result_dict:
            result_dict[topic] = []
        result_dict[topic].append(item)
    return result_dict


def calculate_age_and_dates(reports):
    current_year = datetime.now().year

    for report_title, report_data in reports.items():
        for data in report_data:
            data['min_age'] = current_year - data['birthday_to'].year
            data['max_age'] = current_year - data['birthday_from'].year

            data['formatted_date_from'] = data['date_from'].strftime("%Y-%m-%d")
            data['formatted_date_to'] = data['date_to'].strftime("%Y-%m-%d")

    return reports


def translate_request_status(requests_list):
    status_translations = {
        'pending': 'В работе',
        'closed': 'Закрыто',
        'open': 'Новый'
    }

    for request in requests_list:
        if request['request_status'] in status_translations:
            request['request_status'] = status_translations[request['request_status']]

    return requests_list


def calculate_days_without_response(data):
    today = datetime.now()
    for key in data:
        for item in data[key]:
            item['days'] = (today - item['last_updated']).days
    return data


class CeoHandle(AbstractModel, ABC):
    def __init__(self):
        self.sql_provider = SQLProvider('blueprints/ceo/sql')
        self.db_config = flask.current_app.config['MYSQL_DB_CONFIG']

    def execute(self):
        return {'login': flask.session['login']}


class ViewReportNewCustomersHandle(AbstractModel, ABC):
    def __init__(self):
        self.sql_provider = SQLProvider('blueprints/manager/sql')
        self.db_config = flask.current_app.config['MYSQL_DB_CONFIG']

    def execute(self):
        sql_statement_reports = self.sql_provider.get('get_reports_new_customers.sql', {})
        reports = select_sql(self.db_config, sql_statement_reports)
        reports = list_to_dict_by_topic(reports)
        reports = calculate_age_and_dates(reports)

        sql_statement_new_customers = self.sql_provider.get('get_new_customers.sql', {})
        new_customers = select_sql(self.db_config, sql_statement_new_customers)
        if reports:
            return {'status': 'success', 'reports': reports, 'new_customers': new_customers}
        else:
            return {'status': 'error', 'error_message': 'Нет отчетов'}


class ViewReportLostCustomersHandle(AbstractModel, ABC):
    def __init__(self):
        self.sql_provider = SQLProvider('blueprints/manager/sql')
        self.db_config = flask.current_app.config['MYSQL_DB_CONFIG']

    def execute(self):
        sql_statement_reports = self.sql_provider.get('get_reports_lost_customers.sql', {})
        reports = select_sql(self.db_config, sql_statement_reports)
        reports = list_to_dict_by_topic(reports)
        reports = calculate_age_and_dates(reports)
        print(reports)

        sql_statement_lost_customers = self.sql_provider.get('get_lost_customers.sql', {})
        lost_customers = select_sql(self.db_config, sql_statement_lost_customers)
        if reports:
            return {'status': 'success', 'reports': reports, 'lost_customers': lost_customers}
        else:
            return {'status': 'error', 'error_message': 'Нет отчетов'}


class ViewReportRequestsHandle(AbstractModel, ABC):
    def __init__(self):
        self.sql_provider = SQLProvider('blueprints/manager/sql')
        self.db_config = flask.current_app.config['MYSQL_DB_CONFIG']

    def execute(self):
        sql_statement_reports = self.sql_provider.get('get_reports_requests.sql', {})
        reports = select_sql(self.db_config, sql_statement_reports)
        reports = list_to_dict_by_request_topic(reports)
        reports = calculate_days_without_response(reports)

        sql_statement_requests = self.sql_provider.get('get_requests.sql', {})
        requests = select_sql(self.db_config, sql_statement_requests)
        requests = translate_request_status(requests)
        if reports:
            return {'status': 'success', 'reports': reports, 'requests': requests}
        else:
            return {'status': 'error', 'error_message': 'Нет отчетов'}