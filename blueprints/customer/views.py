from abstract.view import AbstractView
import flask
from flask import redirect, url_for


class BaseView(AbstractView):
    def __init__(self, html):
        super().__init__(html)

    def render_post(self, model_data):
        return flask.render_template(self.html, name=model_data['login'], balance=model_data['balance'])


class WelcomeFormView(AbstractView):
    def __init__(self, html):
        super().__init__(html)

    def render_post(self, model_data):
        if model_data['success']:
            return flask.redirect('/customer')


class TransferView(AbstractView):
    def __init__(self, html):
        super().__init__(html)

    def render_post(self, model_data):
        return redirect(url_for('customer_app.transfer_handler_get'))

    def render(self, model_data):
        msg = flask.session.pop('transfer_status', None)
        context = {'accounts': model_data['accounts']}

        if msg:
            context['msg' if msg == 'Перевод успешно выполнен.' else 'err_msg'] = msg

        return flask.render_template(self.html, **context)


class TransactionHistoryView(AbstractView):
    def __init__(self, html):
        super().__init__(html)

    def render_post(self, model_data):
        return flask.render_template(self.html, model=model_data)


class CreateRequestView(AbstractView):
    def __init__(self, html):
        super().__init__(html)

    def render_post(self, model_data):
        if model_data['status'] == 'success':
            return flask.render_template(self.html, model=model_data, msg=model_data['success_type'])
        else:
            return flask.render_template(self.html, err_msg=model_data['error_type'])


class RequestHistoryView(AbstractView):
    def __init__(self, html):
        super().__init__(html)

    def render_post(self, model_data):
        if model_data['status'] == 'success':
            print(model_data['data'])
            return flask.render_template(self.html, requests=model_data['data'])
        else:
            return flask.render_template(self.html, err_msg=model_data['error_type'])