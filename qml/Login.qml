import QtQuick 2.15

Item {
    anchors.fill: parent
    Rectangle{
        id: fundo
        anchors.fill: parent
        color: Colors.cadus_blue

        //menu central de login
        Rectangle{

            id: centro
            anchors.centerIn: fundo
            width: 300
            height: fundo.height
            color: Colors.dark_blue

            Column{

                id: coluna
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width

                Item {
                    width: parent.width
                    height: 30
                }

                Text {
                    id: qrcode
                    text: qsTr("Escaneie o QR code")
                    color: "white"
                    anchors.horizontalCenter: coluna.horizontalCenter
                }

                Item {
                    width: parent.width
                    height: 30
                }

                Image {
                    id: name
                    anchors.horizontalCenter: coluna.horizontalCenter
                    width: 100
                    height: 100
                    source: "../assets/icons/qrcode.png"
                }

                //botoes login - criar conta

                Item {
                    width: parent.width
                    height: 30
                }

                Rectangle {
                    width: 200
                    height: 40
                    radius: 8
                    color: Colors.vibrance_blue
                    anchors.horizontalCenter: parent.horizontalCenter

                    Text {
                        anchors.centerIn: parent
                        text: "Entrar"
                        color: "white"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            console.log("clicou")
                            loader.source = "../qml/Home.qml"
                        }
                        cursorShape: Qt.PointingHandCursor
                    }
                }

                Item {
                    width: parent.width
                    height: 10
                }

                Rectangle {
                    width: 200
                    height: 40
                    radius: 8
                    color: Colors.vibrance_blue
                    anchors.horizontalCenter: parent.horizontalCenter

                    Text {
                        anchors.centerIn: parent
                        text: "Criar conta"
                        color: "white"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            console.log("clicou")
                        }
                        cursorShape: Qt.PointingHandCursor
                    }
                }
            }
        }
    }
}
