import flask

from . import ceo_app
from .views import CeoView, ReportNewCustomersView, ReportLostCustomersView, ReportRequestsView
from .models import CeoHandle, ViewReportNewCustomersHandle, ViewReportLostCustomersHandle, ViewReportRequestsHandle
from blueprints.auth_decorators import role_required, login_required


@ceo_app.route('/')
@login_required
@role_required
def ceo_handler():
    model = CeoHandle()
    model_res = model.execute()
    view = CeoView('ceo.html')
    return view.render_post(model_res)


@ceo_app.route('/view_report')
@login_required
@role_required
def report_view_handler_ceo():
    view = CeoView('report_view_menu_ceo.html')
    return view.render_get()


@ceo_app.route('/view_report/new_customers', methods=['GET'])
@login_required
@role_required
def report_view_new_customers_handler_ceo():
    model = ViewReportNewCustomersHandle()
    model_res = model.execute()
    view = ReportNewCustomersView('report_view_new_customers_ceo.html')
    return view.render_post(model_res)


@ceo_app.route('/view_report/lost_customers', methods=['GET'])
@login_required
@role_required
def report_view_lost_customers_handler_ceo():
    model = ViewReportLostCustomersHandle()
    model_res = model.execute()
    view = ReportLostCustomersView('report_view_lost_customers_ceo.html')
    return view.render_post(model_res)


@ceo_app.route('/view_report/requests', methods=['GET'])
@login_required
@role_required
def report_view_requests_handler_ceo():
    model = ViewReportRequestsHandle()
    model_res = model.execute()
    view = ReportRequestsView('report_view_requests_ceo.html')
    return view.render_post(model_res)