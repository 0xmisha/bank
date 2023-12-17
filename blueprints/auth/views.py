from abstract.view import AbstractView
import flask


class AuthView(AbstractView):
    def __init__(self, html):
        super().__init__(html)

    def render_post(self, model_data):
        pass


class LoginView(AbstractView):
    def __init__(self, html):
        super().__init__(html)

    def render_post(self, model_data):
        if not model_data['is_auth']:
            return flask.render_template('login.html', message=model_data['message'])

        if model_data['role'] == 'customer':
            flask.session['customer_id'] = model_data.get('customer_id')
            return flask.redirect('/customer')
        elif model_data['role'] == 'manager':
            return flask.redirect('/manager')
        elif model_data['role'] == 'ceo':
            return flask.redirect('/ceo')
        elif model_data['role'] == 'support':
            return flask.redirect('/support')
        else:
            return flask.render_template(self.html)


class RegisterView(AbstractView):
    def __init__(self, html):
        super().__init__(html)

    def render_post(self, model_data):
        if model_data['status'] == 'success':
            return flask.redirect('/customer/welcome_form')
        elif model_data['status'] == 'error':
            if model_data['reason'] == 'mismatch':
                return flask.render_template('register.html', message="Пароли не совпадают")
            if model_data['reason'] == 'internal':
                return flask.render_template('register.html',
                                             message="Вид логина не предназначен для внешних пользователей.")
            if model_data['reason'] == 'exists':
                return flask.render_template('register.html',
                                             message="Пользователь с таким логином уже существует")


class LogoutView(AbstractView):
    def __init__(self, html):
        super().__init__(html)

    def render_post(self, model_data):
        if model_data['success']:
            return flask.redirect('/?auth_message=Вы успешно вышли из личного кабинета')
