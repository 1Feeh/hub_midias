import QtQuick 2.15

Window{
    id:root
    width: 700
    height: 600
    minimumWidth: 700
    minimumHeight: 600
    visible: true
    title: "Vectra | beta"
    color: "black"

    flags: Qt.Window | Qt.WindowSystemMenuHint | Qt.WindowTitleHint | Qt.WindowMinMaxButtonsHint | Qt.WindowCloseButtonHint

    Shortcut {
        sequence: "F11"
        onActivated: {
            if (root.visibility === Window.FullScreen)
                root.visibility = Window.Windowed
            else
                root.visibility = Window.FullScreen
        }
    }

    Shortcut {
        sequence: "Escape"
        onActivated: {
            if (root.visibility === Window.FullScreen)
                root.visibility = Window.Windowed
        }
    }

    Loader{
        id: loader
        anchors.fill: parent
        source: "../qml/Login.qml"
    }
}
