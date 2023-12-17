from flask import Blueprint

ceo_app = Blueprint('ceo_app', __name__, template_folder='templates')

from . import routes
