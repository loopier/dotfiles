from krita import *
from PyQt5.QtWidgets import QMessageBox
import os

class BlendModes(Extension):

    def __init__(self, parent):
        super().__init__(parent)
        self.toggleMode()
        # print("set mode to:", Krita.instance().activeDocument().activeNode().blendingMode())

    def setup(self):
        # box = QMessageBox()
        # box.exec()
        pass

    def createActions(self, window):
        action = window.createAction("blendmodes", "Blend Modes", "tools/scripts")
        action.triggered.connect(self.toggleMode)

    def toggleMode(self):
        if Krita.instance().activeDocument().activeNode().blendingMode() == "normal":
            Krita.instance().activeDocument().activeNode().setBlendingMode("multiply")
        else:
            Krita.instance().activeDocument().activeNode().setBlendingMode("normal")

Krita.instance().addExtension(BlendModes(Krita.instance()))

