from functools import wraps

import flask
import json


def login_required(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        user_session = flask.session
        if user_session.get('is_auth'):
            return func(*args, **kwargs)
        return flask.redirect('/?auth_message=Вы не вошли в аккаунт')
    return wrapper


def role_required(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        accesses = json.load(open('configs/permissions.json'))

        role = flask.session.get('role')
        endpoint = flask.request.endpoint

        if endpoint.split('.')[-1] in accesses[role]:
            return func(*args, **kwargs)

        return flask.redirect('/')
    return wrapper
