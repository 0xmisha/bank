from abstract.view import AbstractView
import flask


class SupportView(AbstractView):
    def __init__(self, html):
        super().__init__(html)

    def render_post(self, model_data):
        return flask.render_template(self.html, name=model_data['login'])


class NewRequestView(AbstractView):
    def __init__(self, html):
        super().__init__(html)

    def render(self, model_data):
        if model_data['status'] == 'success':
            print(model_data['requests'])
            return flask.render_template(self.html, requests=model_data['requests'])
        else:
            return flask.render_template(self.html, message=model_data['error_type'])


    def render_post(self, model_data):
        if model_data['status'] == 'success':
            return flask.render_template(self.html, message=model_data['success_type'])
        else:
            return flask.render_template(self.html, message=model_data['error_type'])


class NewRequestPostView(AbstractView):
    def __init__(self, html):
        super().__init__(html)

    def render_post(self, model_data):
        if model_data['status'] == 'success':
            return flask.render_template(self.html, message=model_data['success_type'])
        else:
            return flask.render_template(self.html, message=model_data['error_type'])


class ClosedRequestView(AbstractView):
    def __init__(self, html):
        super().__init__(html)

    def render_post(self, model_data):
        if model_data['status'] == 'success':
            return flask.render_template(self.html, requests=model_data['requests'])
        else:
            return flask.render_template(self.html, message=model_data['error_type'])


class QueryTransactionsView(AbstractView):
    def __init__(self, html):
        super().__init__(html)

    def render_post(self, model_data):
        if model_data['status'] == 'success':
            return flask.render_template(self.html, tx_count=model_data['tx_count'], transactions=model_data['transactions'])
        else:
            return flask.render_template(self.html, message=model_data['error_type'])


class QueryAccountsView(AbstractView):
    def __init__(self, html):
        super().__init__(html)

    def render_post(self, model_data):
        if model_data['status'] == 'success':
            return flask.render_template(self.html, accounts=model_data['accounts'])
        else:
            return flask.render_template(self.html, message=model_data['error_type'])