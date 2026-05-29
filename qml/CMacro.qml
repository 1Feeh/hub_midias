import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ScrollView {
    anchors.fill: parent
    contentWidth: parent.width
    ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

    ColumnLayout {
        width: parent.width
        spacing: 15
        anchors.margins: 20
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        // ==========================================
        // ITEM 1: Desconectar
        // ==========================================
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: row1.implicitHeight + 20
            color: Colors.medium_blue
            border.color: Colors.dark_blue
            border.width: 1
            radius: 8

            RowLayout {
                id: row1
                anchors.fill: parent
                anchors.margins: 10
                spacing: 20

                Text {
                    text: "Desconectar"
                    color: "white"
                    font.pixelSize: 14
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true
                }
                TextField {
                    placeholderText: "Digite aqui..."
                    Layout.preferredWidth: 200
                    color: "black"
                    background: Rectangle {
                        color: "white"
                        border.color: "#cccccc"
                        radius: 2
                    }
                }
            }
        }

        // ==========================================
        // ITEM 2: Menu
        // ==========================================
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: row2.implicitHeight + 20
            color: Colors.medium_blue
            border.color: Colors.dark_blue
            border.width: 1
            radius: 8

            RowLayout {
                id: row2
                anchors.fill: parent
                anchors.margins: 10
                spacing: 20

                Text {
                    text: "Menu"
                    color: "white"
                    font.pixelSize: 14
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true
                }
                TextField {
                    placeholderText: "Digite aqui..."
                    Layout.preferredWidth: 200
                    color: "black"
                    background: Rectangle {
                        color: "white"
                        border.color: "#cccccc"
                        radius: 2
                    }
                }
            }
        }

        // ==========================================
        // ITEM 3: Chat
        // ==========================================
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: row3.implicitHeight + 20
            color: Colors.medium_blue
            border.color: Colors.dark_blue
            border.width: 1
            radius: 8

            RowLayout {
                id: row3
                anchors.fill: parent
                anchors.margins: 10
                spacing: 20

                Text {
                    text: "Chat"
                    color: "white"
                    font.pixelSize: 14
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true
                }
                TextField {
                    placeholderText: "Digite aqui..."
                    Layout.preferredWidth: 200
                    color: "black"
                    background: Rectangle {
                        color: "white"
                        border.color: "#cccccc"
                        radius: 2
                    }
                }
            }
        }

        // ==========================================
        // ITEM 4: Alternação,exibição
        // ==========================================
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: row4.implicitHeight + 20
            color: Colors.medium_blue
            border.color: Colors.dark_blue
            border.width: 1
            radius: 8

            RowLayout {
                id: row4
                anchors.fill: parent
                anchors.margins: 10
                spacing: 20

                Text {
                    text: "Alternação,exibição"
                    color: "white"
                    font.pixelSize: 14
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true
                }
                TextField {
                    placeholderText: "Digite aqui..."
                    Layout.preferredWidth: 200
                    color: "black"
                    background: Rectangle {
                        color: "white"
                        border.color: "#cccccc"
                        radius: 2
                    }
                }
            }
        }

        // ==========================================
        // ITEM 5: Enviar
        // ==========================================
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: row5.implicitHeight + 20
            color: Colors.medium_blue
            border.color: Colors.dark_blue
            border.width: 1
            radius: 8

            RowLayout {
                id: row5
                anchors.fill: parent
                anchors.margins: 10
                spacing: 20

                Text {
                    text: "Enviar"
                    color: "white"
                    font.pixelSize: 14
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true
                }
                TextField {
                    placeholderText: "Digite aqui..."
                    Layout.preferredWidth: 200
                    color: "black"
                    background: Rectangle {
                        color: "white"
                        border.color: "#cccccc"
                        radius: 2
                    }
                }
            }
        }

        // ==========================================
        // ITEM 6: Modo janela
        // ==========================================
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: row6.implicitHeight + 20
            color: Colors.medium_blue
            border.color: Colors.dark_blue
            border.width: 1
            radius: 8

            RowLayout {
                id: row6
                anchors.fill: parent
                anchors.margins: 10
                spacing: 20

                Text {
                    text: "Modo janela"
                    color: "white"
                    font.pixelSize: 14
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true
                }
                TextField {
                    placeholderText: "Digite aqui..."
                    Layout.preferredWidth: 200
                    color: "black"
                    background: Rectangle {
                        color: "white"
                        border.color: "#cccccc"
                        radius: 2
                    }
                }
            }
        }
    }
}