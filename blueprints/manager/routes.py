import flask

from . import manager_app
from .views import (ManagerView, CreateReportNewCustomersView, ReportNewCustomersView, ReportLostCustomersView,
                    ReportRequestsView)
from .models import (ManagerHandle, CreateReportNewSustomerHandle, CreateReportLostCustomerHandle,
                     CreateReportRequestsHandle, ViewReportNewCustomersHandle, ViewReportLostCustomersHandle,
                     ViewReportRequestsHandle)
from blueprints.auth_decorators import role_required, login_required


@manager_app.route('/')
@login_required
@role_required
def manager_handler():
    model = ManagerHandle()
    model_res = model.execute()
    view = ManagerView('manager.html')
    return view.render_post(model_res)


@manager_app.route('/create_report')
@login_required
@role_required
def report_create_handler():
    view = ManagerView('report_create_menu.html')
    return view.render_get()


@manager_app.route('/create_report/new_customers', methods=['GET'])
@login_required
@role_required
def report_create_new_customers_handler():
    view = ManagerView('report_create_new_customers.html')
    return view.render_get()


@manager_app.route('/create_report/new_customers', methods=['POST'])
@login_required
@role_required
def report_create_new_customers_handler_post():
    model = CreateReportNewSustomerHandle()
    model_res = model.execute(topic=flask.request.form['report_title'], date_from=flask.request.form['date_from'],
                              date_to=flask.request.form['date_to'], age_from=flask.request.form['age_from'],
                              age_to=flask.request.form['age_to'])
    view = CreateReportNewCustomersView('report_create_new_customers.html')
    return view.render_post(model_res)


@manager_app.route('/create_report/lost_customers', methods=['GET'])
@login_required
@role_required
def report_create_lost_customers_handler():
    view = ManagerView('report_create_lost_customers.html')
    return view.render_get()


@manager_app.route('/create_report/lost_customers', methods=['POST'])
@login_required
@role_required
def report_create_lost_customers_handler_post():
    model = CreateReportLostCustomerHandle()
    model_res = model.execute(topic=flask.request.form['report_title'], date_from=flask.request.form['date_from'],
                              date_to=flask.request.form['date_to'], age_from=flask.request.form['age_from'],
                              age_to=flask.request.form['age_to'])
    view = CreateReportNewCustomersView('report_create_lost_customers.html')
    return view.render_post(model_res)


@manager_app.route('/create_report/requests', methods=['GET'])
@login_required
@role_required
def report_create_requests_handler():
    view = ManagerView('report_create_requests.html')
    return view.render_get()


@manager_app.route('/create_report/requests', methods=['POST'])
@login_required
@role_required
def report_create_requests_handler_post():
    model = CreateReportRequestsHandle()
    model_res = model.execute(topic=flask.request.form['report_title'], date_from=flask.request.form['date_from'],
                              date_to=flask.request.form['date_to'])
    view = CreateReportNewCustomersView('report_create_requests.html')
    return view.render_post(model_res)


@manager_app.route('/view_report')
@login_required
@role_required
def report_view_handler():
    view = ManagerView('report_view_menu.html')
    return view.render_get()


@manager_app.route('/view_report/new_customers', methods=['GET'])
@login_required
@role_required
def report_view_new_customers_handler():
    model = ViewReportNewCustomersHandle()
    model_res = model.execute()
    view = ReportNewCustomersView('report_view_new_customers.html')
    return view.render_post(model_res)


@manager_app.route('/view_report/lost_customers', methods=['GET'])
@login_required
@role_required
def report_view_lost_customers_handler():
    model = ViewReportLostCustomersHandle()
    model_res = model.execute()
    view = ReportLostCustomersView('report_view_lost_customers.html')
    return view.render_post(model_res)


@manager_app.route('/view_report/requests', methods=['GET'])
@login_required
@role_required
def report_view_requests_handler():
    model = ViewReportRequestsHandle()
    model_res = model.execute()
    view = ReportRequestsView('report_view_requests.html')
    return view.render_post(model_res)
