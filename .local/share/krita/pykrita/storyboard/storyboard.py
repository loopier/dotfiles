from PyQt5.QtWidgets import *
from krita import *

class ShootingboardDocker(DockWidget):

    def __init__(self):
        super().__init__()
        self.setWindowTitle("Shootingboard")
        mainWidget = QWidget(self)
        self.setWidget(mainWidget)
        buttonExportDocument = QPushButton("Export Document", mainWidget)

    def canvasChanged(self, canvas):
        pass

Krita.instance().addDockWidgetFactory(DockWidgetFactory("ShootingboardDocker", DockWidgetFactoryBase.DockRight, ShootingboardDocker))
