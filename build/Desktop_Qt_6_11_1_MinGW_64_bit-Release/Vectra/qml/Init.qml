import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

Window {
    width: 800
    height: 640
    minimumWidth: 800
    minimumHeight: 640
    //maximumWidth: 800
    //maximumHeight: 640
    visible: true
    title: "Vectra"
    color: Colors.cadus_blue

    StackView {
        id: stackview
        anchors.fill: parent
        initialItem: Login {stackView: stackview}  // ← direto pelo nome do componente
    }
}
