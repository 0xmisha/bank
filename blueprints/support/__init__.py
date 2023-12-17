from flask import Blueprint

support_app = Blueprint('support', __name__, template_folder='templates')

from . import routes
