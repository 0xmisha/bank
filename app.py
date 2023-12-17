import flask
from flask import Flask

from blueprints.auth import auth_app
from blueprints.customer import customer_app
from blueprints.manager import manager_app
from blueprints.ceo import ceo_app
from blueprints.support import support_app


import json

app = Flask(__name__)
app.config['MYSQL_DB_CONFIG'] = json.load(open('configs/db_config.json'))
app.register_blueprint(auth_app, url_prefix='/auth')
app.register_blueprint(customer_app, url_prefix='/customer')
app.register_blueprint(manager_app, url_prefix='/manager')
app.register_blueprint(ceo_app, url_prefix='/ceo')
app.register_blueprint(support_app, url_prefix='/support')
app.secret_key = 'imsecretkey'


@app.route('/')
def indexHandler():
    message = None
    if flask.request.args:
        message = flask.request.args.get('error')

    auth_message = flask.request.args.get('auth_message')

    login = flask.session['is_auth'] if flask.session else None
    role = flask.session['role'] if flask.session else None
    return flask.render_template('index.html', login=login, message=message, auth_message=auth_message, role=role)


if __name__ == '__main__':
    settings = {'host': '127.0.0.1', 'port': 5004}
    app.run(host=settings['host'], port=settings['port'], debug=True)
