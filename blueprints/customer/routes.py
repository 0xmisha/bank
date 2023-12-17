import flask
from blueprints.auth_decorators import role_required, login_required
from . import customer_app
from .models import (BaseHandle, TransferHandle, WelcomeFormHandle, AccountHistoryHandle, TransferHandleGet,
                     CreateReportHandle, HistoryReportHandle)
from .views import (BaseView, TransferView, TransactionHistoryView, WelcomeFormView, CreateRequestView,
                    RequestHistoryView)


@customer_app.route('/')
@login_required
@role_required
def base_handler():
    model = BaseHandle()
    model_res = model.execute()
    view = BaseView(html="customer.html")
    return view.render_post(model_res)


@customer_app.route('/welcome_form', methods=['GET'])
@login_required
@role_required
def welcome_form_handler_get():
    view = WelcomeFormView('welcome_form.html')
    return view.render_get()


@customer_app.route('/welcome_form', methods=['POST'])
@login_required
@role_required
def welcome_form_handler_post():
    model = WelcomeFormHandle()
    model_res = model.execute(surname=flask.request.form['surname'], birth=flask.request.form['birth'],
                              address=flask.request.form['address'], phone=flask.request.form['phone'])
    view = WelcomeFormView(html="welcome_form.html")
    return view.render_post(model_res)


@customer_app.route('/transfer', methods=['GET'])
@login_required
@role_required
def transfer_handler_get():
    model = TransferHandleGet()
    model_res = model.execute()
    view = TransferView('transfer.html',)
    return view.render(model_res)


@customer_app.route('/transfer', methods=['POST'])
@login_required
@role_required
def transfer_handler_post():
    model = TransferHandle()
    model_res = model.execute(receiver=flask.request.form['login'], amount=flask.request.form['transfer_amount'],
                              sender=flask.request.form['account_select'])
    view = TransferView(html='transfer.html')
    return view.render_post(model_res)


@customer_app.route('/account_history', methods=['GET'])
@login_required
@role_required
def account_history_handler_get():
    model = AccountHistoryHandle()
    model_res = model.execute()
    view = TransactionHistoryView('account_history.html')
    return view.render_post(model_res)


@customer_app.route('/request', methods=['GET'])
@login_required
@role_required
def request_handler_get():
    view = TransferView('request.html')
    return view.render_get()


@customer_app.route('/request/create', methods=['GET'])
@login_required
@role_required
def request_create_handler_get():
    view = TransferView('request_create.html')
    return view.render_get()


@customer_app.route('/request/create', methods=['POST'])
@login_required
@role_required
def request_create_handler_post():
    model = CreateReportHandle()
    model_res = model.execute(topic=flask.request.form['topic'], text=flask.request.form['text'])
    view = CreateRequestView('request_create.html')
    return view.render_post(model_res)


@customer_app.route('/request/history', methods=['GET'])
@login_required
@role_required
def request_history_handler_get():
    model = HistoryReportHandle()
    model_res = model.execute()
    view = RequestHistoryView('request_history.html')
    return view.render_post(model_res)


