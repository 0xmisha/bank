from . import support_app
import flask

from .views import SupportView, NewRequestView, NewRequestPostView, ClosedRequestView, QueryTransactionsView, QueryAccountsView
from .models import (SupportHandle, NewRequestHandle, ClosedRequestHandle, NewRequestPostHandle, InProgressRequestHandle,
                     InProgressRequestPostHandle, RequestIdQueryHandle, RequestSurnameHandle, RequestCustomerIDHandle,
                     QueryTransactionsHandle, QueryAccountsHandle)

from blueprints.auth_decorators import role_required, login_required


@support_app.route('/')
@login_required
@role_required
def manager_handler():
    model = SupportHandle()
    model_res = model.execute()
    view = SupportView('support.html')
    return view.render_post(model_res)


@support_app.route('/request', methods=['GET'])
@login_required
@role_required
def request_menu_handler():
    view = SupportView('request_menu.html')
    return view.render_get()


@support_app.route('/request/new', methods=['GET'])
@login_required
@role_required
def request_new_handler():
    model = NewRequestHandle()
    model_res = model.execute()
    view = NewRequestView('request_new.html')
    return view.render(model_res)


@support_app.route('/request/new', methods=['POST'])
@login_required
@role_required
def request_new_handler_post():
    model = NewRequestPostHandle()
    model_res = model.execute(id_request=flask.request.form['request_id'])
    view = NewRequestPostView('request_new.html')
    return view.render_post(model_res)


@support_app.route('/request/in_progress', methods=['GET'])
@login_required
@role_required
def request_in_progress_handler():
    model = InProgressRequestHandle()
    model_res = model.execute()
    view = NewRequestView('request_in_progress.html')
    return view.render(model_res)


@support_app.route('/request/in_progress', methods=['POST'])
@login_required
@role_required
def request_in_progress_handler_post():
    model = InProgressRequestPostHandle()
    model_res = model.execute(id_request=flask.request.form['request_id'], response=flask.request.form['text'])
    view = NewRequestView('request_in_progress.html')
    return view.render_post(model_res)


@support_app.route('/request/closed', methods=['GET'])
@login_required
@role_required
def request_closed_handler():
    model = ClosedRequestHandle()
    model_res = model.execute()
    view = ClosedRequestView('request_closed.html')
    return view.render_post(model_res)


@support_app.route('/queries', methods=['GET'])
@login_required
@role_required
def queries_menu_handler():
    view = SupportView('queries_menu.html')
    return view.render_get()


@support_app.route('/queries/request_id', methods=['GET'])
@login_required
@role_required
def request_id_query_handler():
    view = SupportView('query_by_request_id.html')
    return view.render_get()


@support_app.route('/queries/request_id', methods=['POST'])
@login_required
@role_required
def request_id_query_handler_post():
    model = RequestIdQueryHandle()
    model_res = model.execute(request_id=flask.request.form['request_id'])
    view = NewRequestView('query_by_request_id.html')
    return view.render(model_res)


@support_app.route('/queries/surname', methods=['GET'])
@login_required
@role_required
def query_surname_handler():
    view = SupportView('query_by_surname.html')
    return view.render_get()


@support_app.route('/queries/surname', methods=['POST'])
@login_required
@role_required
def query_surname_handler_post():
    model = RequestSurnameHandle()
    model_res = model.execute(surname=flask.request.form['request_id'])
    view = NewRequestView('query_by_surname.html')
    return view.render(model_res)


@support_app.route('/queries/customer_id', methods=['GET'])
@login_required
@role_required
def query_customer_id_handler():
    view = SupportView('query_by_customer_id.html')
    return view.render_get()


@support_app.route('/queries/customer_id', methods=['POST'])
@login_required
@role_required
def query_customer_id_handler_post():
    model = RequestCustomerIDHandle()
    model_res = model.execute(customer_id=flask.request.form['request_id'])
    view = NewRequestView('query_by_customer_id.html')
    return view.render(model_res)


@support_app.route('/queries/accounts', methods=['GET'])
@login_required
@role_required
def query_accounts_handler():
    view = SupportView('query_accounts.html')
    return view.render_get()


@support_app.route('/queries/accounts', methods=['POST'])
@login_required
@role_required
def query_accounts_handler_post():
    model = QueryAccountsHandle()
    model_res = model.execute(customer_id=flask.request.form['customer_id'])
    view = QueryAccountsView('query_accounts.html')
    return view.render_post(model_res)


@support_app.route('/queries/transactions', methods=['GET'])
@login_required
@role_required
def query_transactions_handler():
    view = SupportView('query_transactions.html')
    return view.render_get()


@support_app.route('/queries/transactions', methods=['POST'])
@login_required
@role_required
def query_transactions_handler_post():
    model = QueryTransactionsHandle()
    model_res = model.execute(customer_id=flask.request.form['customer_id'])
    view = QueryTransactionsView('query_transactions.html')
    return view.render_post(model_res)