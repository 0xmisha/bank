from flask import Blueprint

manager_app = Blueprint('manager_app', __name__, template_folder='templates')

from . import routes
