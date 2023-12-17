import abc
import flask

class AbstractView(abc.ABC):
    def __init__(self, html):
        self.html = html

    @abc.abstractmethod
    def render_post(self, model_data):
        pass

    def render_get(self):
        return flask.render_template(self.html)
