from abstract.view import AbstractView
import flask



class ManagerView(AbstractView):
    def __init__(self, html):
        super().__init__(html)

    def render_post(self, model_data):
        return flask.render_template(self.html, name=model_data['login'][:-5])


class CreateReportNewCustomersView(AbstractView):
    def __init__(self, html):
        super().__init__(html)

    def render_post(self, model_data):
        if model_data['status'] == 'success':
            return flask.render_template(self.html, msg=model_data['success_message'])
        else:
            return flask.render_template(self.html, err_msg=model_data['error_message'])


class ReportNewCustomersView(AbstractView):
    def __init__(self, html):
        super().__init__(html)

    def render_post(self, model_data):
        if model_data['status'] == 'success':
            return flask.render_template(self.html, reports=model_data['reports'], new_customers=model_data['new_customers'])
        else:
            return flask.render_template(self.html, err_msg=model_data['error_message'])


class ReportLostCustomersView(AbstractView):
    def __init__(self, html):
        super().__init__(html)

    def render_post(self, model_data):
        if model_data['status'] == 'success':
            return flask.render_template(self.html, reports=model_data['reports'], lost_customers=model_data['lost_customers'])
        else:
            return flask.render_template(self.html, err_msg=model_data['error_message'])


class ReportRequestsView(AbstractView):
    def __init__(self, html):
        super().__init__(html)

    def render_post(self, model_data):
        if model_data['status'] == 'success':
            return flask.render_template(self.html, reports=model_data['reports'], requests=model_data['requests'])
        else:
            return flask.render_template(self.html, err_msg=model_data['error_message'])