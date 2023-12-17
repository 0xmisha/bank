from flask import Blueprint

customer_app = Blueprint('customer_app', __name__, template_folder='templates')

from . import routes
