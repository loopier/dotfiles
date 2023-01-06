from krita import *
from PyQt5.QtWidgets import QMessageBox
import os


class SaveJpg(Extension):

    def __init__(self, parent):
        super().__init__(parent)

    def setup(self):
        # box = QMessageBox()
        # box.exec()
        pass

    def exportDocument(self):
        doc = Krita.instance().activeDocument()
        if doc is not None:
            # change .kra extension to .jpg
            filename = ".".join(doc.fileName().split(".")[:-1]) + ".jpg"
            # box = QMessageBox()
            # box.setText("Saved:\n'{}'".format(filename))
            # box.exec()
            doc.saveAs(filename)


    def createActions(self, window):
        action = window.createAction("saveJpg", "Save as JPG", "File")
        action.triggered.connect(self.exportDocument)

# doc = Krita.instance().activeDocument()
# name = doc.fileName()

# print(name)

Krita.instance().addExtension(SaveJpg(Krita.instance()))
