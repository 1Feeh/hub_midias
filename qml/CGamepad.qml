import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ScrollView {
    anchors.fill: parent
    contentWidth: 1200 // Fixa a área rolável em 1200
    ScrollBar.horizontal.policy: ScrollBar.AsNeeded

    // Container principal para colocar o Menu em cima e o resto embaixo
    ColumnLayout {
        anchors.centerIn: parent.Center
        width: 1200
        spacing: 20

        // ==========================================
        // MENU SUPERIOR
        // ==========================================
        Rectangle {
            id: menu_superior
            Layout.fillWidth: true
            Layout.margins: 10
            Layout.preferredHeight: 80
            color: "white"
            opacity: 0.5
            radius: 10

            Row {
                anchors.centerIn: parent
                spacing: 20

                Column {
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 5
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: qsTr("Entrada")
                        color: "black"
                        font.pixelSize: 12
                    }
                    ComboBox {
                        model: ["Teclado", "X-input", "HID"]
                        onActivated: console.log(currentText)
                    }
                }

                Column {
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 5
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: qsTr("Perfis")
                        color: "black"
                        font.pixelSize: 12
                    }
                    ComboBox {
                        model: ["Perfil 1", "Perfil 2", "Perfil 3"]
                        onActivated: console.log(currentText)
                    }
                }

                Column {
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 5
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: qsTr("Ação")
                        color: "black"
                        font.pixelSize: 12
                    }
                    Button {
                        text: qsTr("Salvar")
                        onClicked: console.log("salvar")
                    }
                }
            }
        }

        // ==========================================
        // ÁREA DOS CONTROLES (Esquerda, Centro, Direita)
        // ==========================================
        RowLayout {
            Layout.fillWidth: true
            Layout.margins: 10
            spacing: 20

            // ------------------------------------------
            // 1. COLUNA ESQUERDA (Joystick Esq + D-pad)
            // ------------------------------------------
            ColumnLayout {
                Layout.alignment: Qt.AlignTop
                spacing: 20

                Item {
                    id: joystick
                    Layout.preferredWidth: 200
                    Layout.preferredHeight: 200

                    Rectangle {
                        width: parent.width - 20
                        height: childrenRect.height + 20
                        color: Colors.medium_blue
                        radius: 10
                        anchors.horizontalCenter: parent.horizontalCenter

                        Column {
                            width: parent.width
                            spacing: 8
                            anchors.top: parent.top
                            anchors.topMargin: 10

                            Text {
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: qsTr("Joystick esquerdo")
                                color: "white"
                                font.pixelSize: 14
                                font.bold: true
                            }
                            RowLayout {
                                width: parent.width
                                Text { Layout.fillWidth: true; Layout.leftMargin: 15; text: qsTr("Cima"); color: "white"; font.pixelSize: 14 }
                                TextField { readOnly: true; placeholderText: "..."; Layout.preferredWidth: 80; Layout.rightMargin: 10 }
                            }
                            RowLayout {
                                width: parent.width
                                Text { Layout.fillWidth: true; Layout.leftMargin: 15; text: qsTr("Esquerda"); color: "white"; font.pixelSize: 14 }
                                TextField { readOnly: true; placeholderText: "..."; Layout.preferredWidth: 80; Layout.rightMargin: 10 }
                            }
                            RowLayout {
                                width: parent.width
                                Text { Layout.fillWidth: true; Layout.leftMargin: 15; text: qsTr("Direita"); color: "white"; font.pixelSize: 14 }
                                TextField { readOnly: true; placeholderText: "..."; Layout.preferredWidth: 80; Layout.rightMargin: 10 }
                            }
                            RowLayout {
                                width: parent.width
                                Text { Layout.fillWidth: true; Layout.leftMargin: 15; text: qsTr("Baixo"); color: "white"; font.pixelSize: 14 }
                                TextField { readOnly: true; placeholderText: "..."; Layout.preferredWidth: 80; Layout.rightMargin: 10 }
                            }
                        }
                    }
                }

                Item {
                    id: dpad
                    Layout.preferredWidth: 200
                    Layout.preferredHeight: 200

                    Rectangle {
                        width: parent.width - 20
                        height: childrenRect.height + 20
                        color: Colors.medium_blue
                        radius: 10
                        anchors.horizontalCenter: parent.horizontalCenter

                        Column {
                            width: parent.width
                            spacing: 8
                            anchors.top: parent.top
                            anchors.topMargin: 10

                            Text {
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: qsTr("D-pad")
                                color: "white"
                                font.pixelSize: 14
                                font.bold: true
                            }
                            RowLayout {
                                width: parent.width
                                Text { Layout.fillWidth: true; Layout.leftMargin: 15; text: qsTr("Cima"); color: "white"; font.pixelSize: 14 }
                                TextField { readOnly: true; placeholderText: "..."; Layout.preferredWidth: 80; Layout.rightMargin: 10 }
                            }
                            RowLayout {
                                width: parent.width
                                Text { Layout.fillWidth: true; Layout.leftMargin: 15; text: qsTr("Esquerda"); color: "white"; font.pixelSize: 14 }
                                TextField { readOnly: true; placeholderText: "..."; Layout.preferredWidth: 80; Layout.rightMargin: 10 }
                            }
                            RowLayout {
                                width: parent.width
                                Text { Layout.fillWidth: true; Layout.leftMargin: 15; text: qsTr("Direita"); color: "white"; font.pixelSize: 14 }
                                TextField { readOnly: true; placeholderText: "..."; Layout.preferredWidth: 80; Layout.rightMargin: 10 }
                            }
                            RowLayout {
                                width: parent.width
                                Text { Layout.fillWidth: true; Layout.leftMargin: 15; text: qsTr("Baixo"); color: "white"; font.pixelSize: 14 }
                                TextField { readOnly: true; placeholderText: "..."; Layout.preferredWidth: 80; Layout.rightMargin: 10 }
                            }
                        }
                    }
                }
            }

            // ------------------------------------------
            // 2. COLUNA CENTRAL (Triggers + Imagem + Action)
            // ------------------------------------------
            ColumnLayout {
                Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
                Layout.fillWidth: true
                spacing: 20

                // Botões centrais cima
                Rectangle {
                    id: triggers
                    Layout.fillWidth: true
                    Layout.maximumWidth: 800  // Evita que estique demais em telas ultrawide
                    Layout.preferredHeight: 80
                    Layout.alignment: Qt.AlignHCenter
                    radius: 10
                    color: Colors.medium_blue

                    Row {
                        anchors.centerIn: parent
                        spacing: 20

                        Column {
                            anchors.verticalCenter: parent.verticalCenter; spacing: 5
                            Text { anchors.horizontalCenter: parent.horizontalCenter; text: qsTr("LB"); color: "white"; font.pixelSize: 12 }
                            TextField { readOnly: true; placeholderText: "..."; width: 80 }
                        }
                        Column {
                            anchors.verticalCenter: parent.verticalCenter; spacing: 5
                            Text { anchors.horizontalCenter: parent.horizontalCenter; text: qsTr("LT"); color: "white"; font.pixelSize: 12 }
                            TextField { readOnly: true; placeholderText: "..."; width: 80 }
                        }
                        Column {
                            anchors.verticalCenter: parent.verticalCenter; spacing: 5
                            Text { anchors.horizontalCenter: parent.horizontalCenter; text: qsTr("LS"); color: "white"; font.pixelSize: 12 }
                            TextField { readOnly: true; placeholderText: "..."; width: 80 }
                        }
                        Column {
                            anchors.verticalCenter: parent.verticalCenter; spacing: 5
                            Text { anchors.horizontalCenter: parent.horizontalCenter; text: qsTr("RS"); color: "white"; font.pixelSize: 12 }
                            TextField { readOnly: true; placeholderText: "..."; width: 80 }
                        }
                        Column {
                            anchors.verticalCenter: parent.verticalCenter; spacing: 5
                            Text { anchors.horizontalCenter: parent.horizontalCenter; text: qsTr("RT"); color: "white"; font.pixelSize: 12 }
                            TextField { readOnly: true; placeholderText: "..."; width: 80 }
                        }
                        Column {
                            anchors.verticalCenter: parent.verticalCenter; spacing: 5
                            Text { anchors.horizontalCenter: parent.horizontalCenter; text: qsTr("RB"); color: "white"; font.pixelSize: 12 }
                            TextField { readOnly: true; placeholderText: "..."; width: 80 }
                        }
                    }
                }

                // Imagem controle
                Image {
                    id: controler
                    Layout.alignment: Qt.AlignHCenter
                    Layout.preferredWidth: 300
                    Layout.preferredHeight: 200
                    sourceSize.width: 300
                    sourceSize.height: 200
                    source: "../assets/icons/control_map.png"
                }

                // Botões inferiores
                Rectangle {
                    id: action
                    Layout.alignment: Qt.AlignHCenter
                    Layout.preferredWidth: 300
                    Layout.preferredHeight: 80
                    radius: 10
                    color: Colors.medium_blue

                    Row {
                        anchors.centerIn: parent
                        spacing: 20

                        Column {
                            anchors.verticalCenter: parent.verticalCenter; spacing: 5
                            Text { anchors.horizontalCenter: parent.horizontalCenter; text: qsTr("Select"); color: "white"; font.pixelSize: 12 }
                            TextField { readOnly: true; placeholderText: "..."; width: 80 }
                        }
                        Column {
                            anchors.verticalCenter: parent.verticalCenter; spacing: 5
                            Text { anchors.horizontalCenter: parent.horizontalCenter; text: qsTr("Start"); color: "white"; font.pixelSize: 12 }
                            TextField { readOnly: true; placeholderText: "..."; width: 80 }
                        }
                    }
                }
            }

            // ------------------------------------------
            // 3. COLUNA DIREITA (Joystick Dir + ABXY)
            // ------------------------------------------
            ColumnLayout {
                Layout.alignment: Qt.AlignTop
                spacing: 20

                Item {
                    id: joystick_right
                    Layout.preferredWidth: 200
                    Layout.preferredHeight: 200

                    Rectangle {
                        width: parent.width - 20
                        height: childrenRect.height + 20
                        color: Colors.medium_blue
                        radius: 10
                        anchors.horizontalCenter: parent.horizontalCenter

                        Column {
                            width: parent.width
                            spacing: 8
                            anchors.top: parent.top
                            anchors.topMargin: 10

                            Text {
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: qsTr("Joystick direito")
                                color: "white"
                                font.pixelSize: 14
                                font.bold: true
                            }
                            RowLayout {
                                width: parent.width
                                Text { Layout.fillWidth: true; Layout.leftMargin: 15; text: qsTr("Cima"); color: "white"; font.pixelSize: 14 }
                                TextField { readOnly: true; placeholderText: "..."; Layout.preferredWidth: 80; Layout.rightMargin: 10 }
                            }
                            RowLayout {
                                width: parent.width
                                Text { Layout.fillWidth: true; Layout.leftMargin: 15; text: qsTr("Esquerda"); color: "white"; font.pixelSize: 14 }
                                TextField { readOnly: true; placeholderText: "..."; Layout.preferredWidth: 80; Layout.rightMargin: 10 }
                            }
                            RowLayout {
                                width: parent.width
                                Text { Layout.fillWidth: true; Layout.leftMargin: 15; text: qsTr("Direita"); color: "white"; font.pixelSize: 14 }
                                TextField { readOnly: true; placeholderText: "..."; Layout.preferredWidth: 80; Layout.rightMargin: 10 }
                            }
                            RowLayout {
                                width: parent.width
                                Text { Layout.fillWidth: true; Layout.leftMargin: 15; text: qsTr("Baixo"); color: "white"; font.pixelSize: 14 }
                                TextField { readOnly: true; placeholderText: "..."; Layout.preferredWidth: 80; Layout.rightMargin: 10 }
                            }
                        }
                    }
                }

                Item {
                    id: abyx
                    Layout.preferredWidth: 200
                    Layout.preferredHeight: 200

                    Rectangle {
                        width: parent.width - 20
                        height: childrenRect.height + 20
                        color: Colors.medium_blue
                        radius: 10
                        anchors.horizontalCenter: parent.horizontalCenter

                        Column {
                            width: parent.width
                            spacing: 8
                            anchors.top: parent.top
                            anchors.topMargin: 10

                            Text {
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: qsTr("A B X Y")
                                color: "white"
                                font.pixelSize: 14
                                font.bold: true
                            }
                            RowLayout {
                                width: parent.width
                                Text { Layout.fillWidth: true; Layout.leftMargin: 15; text: qsTr("A"); color: "white"; font.pixelSize: 14 }
                                TextField { readOnly: true; placeholderText: "..."; Layout.preferredWidth: 80; Layout.rightMargin: 10 }
                            }
                            RowLayout {
                                width: parent.width
                                Text { Layout.fillWidth: true; Layout.leftMargin: 15; text: qsTr("B"); color: "white"; font.pixelSize: 14 }
                                TextField { readOnly: true; placeholderText: "..."; Layout.preferredWidth: 80; Layout.rightMargin: 10 }
                            }
                            RowLayout {
                                width: parent.width
                                Text { Layout.fillWidth: true; Layout.leftMargin: 15; text: qsTr("X"); color: "white"; font.pixelSize: 14 }
                                TextField { readOnly: true; placeholderText: "..."; Layout.preferredWidth: 80; Layout.rightMargin: 10 }
                            }
                            RowLayout {
                                width: parent.width
                                Text { Layout.fillWidth: true; Layout.leftMargin: 15; text: qsTr("Y"); color: "white"; font.pixelSize: 14 }
                                TextField { readOnly: true; placeholderText: "..."; Layout.preferredWidth: 80; Layout.rightMargin: 10 }
                            }
                        }
                    }
                }
            }
        }
    }
}