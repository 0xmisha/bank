import flask
from . import auth_app
from .views import AuthView, LoginView, RegisterView, LogoutView
from .models import LoginHandle, RegisterHandle, LogoutHandle


@auth_app.route('/')
def auth_handler():
    view = AuthView('base.html')
    return view.render_get()


@auth_app.route('/login', methods=['GET'])
def login_handler_get():
    view = LoginView(html='login.html')
    return view.render_get()


@auth_app.route('/login', methods=['POST'])
def login_handler_post():
    model = LoginHandle()
    model_res = model.execute(login=flask.request.form['login'], password=flask.request.form['password'])
    view = LoginView(html="login.html")
    return view.render_post(model_res)


@auth_app.route('/register', methods=['GET'])
def register_handler_get():
    view = RegisterView('register.html')
    return view.render_get()


@auth_app.route('/register', methods=['POST'])
def register_handler_post():
    model = RegisterHandle()
    model_res = model.execute(login=flask.request.form['login'], password=flask.request.form['password'],
                              confirm_password=flask.request.form['confirm-password'])
    view = RegisterView('register.html')
    return view.render_post(model_res)


@auth_app.route('/logout')
def logout_handler():
    model = LogoutHandle()
    model_res = model.execute()
    view = LogoutView('/')
    return view.render_post(model_res)
