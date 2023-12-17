import abc


class AbstractModel(abc.ABC):
    @abc.abstractmethod
    def execute(self):
        pass
