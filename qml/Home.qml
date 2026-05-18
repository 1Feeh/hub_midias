import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    id: windowRoot
    width: 1024
    height: 640
    minimumHeight: 500
    minimumWidth: 800
    visible: true
    title: "Vectra"

    // [ALTERAÇÃO 1] Apenas adicionada esta linha de controle para o Pop-up
    property bool showLogoutDialog: false

    Rectangle {
        id: homeRoot
        anchors.fill: parent
        color: "#1d2636"

        RowLayout {
            anchors.fill: parent
            spacing: 0

            // ==========================================
            // 1. SIDEBAR (ESQUERDA)
            // ==========================================
            Rectangle {
                id: sidebar
                Layout.preferredWidth: 260
                Layout.fillHeight: parent
                color: "#0c131d"

                property int activeTab: 0

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 15
                    spacing: 12

                    // Linha de botões do topo centralizada e interativa
                    RowLayout {
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignHCenter
                        spacing: 15

                        Item { Layout.fillWidth: true }

                        // Botão do Topo: Ícone do PC (Index 0)
                        Rectangle {
                            width: 45; height: 40; radius: 8
                            color: sidebar.activeTab === 0 ? "#468bf7" : "transparent"

                            Image {
                                source: "../assets/icons/desktop_windows_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                width: 24; height: 24
                                anchors.centerIn: parent
                                fillMode: Image.PreserveAspectFit
                            }

                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: sidebar.activeTab = 0
                            }
                        }

                        // Botão do Topo: Ícone group_add (Index 1)
                        Rectangle {
                            width: 45; height: 40; radius: 8
                            color: sidebar.activeTab === 1 ? "#468bf7" : "transparent"

                            Image {
                                source: "../assets/icons/group_add_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                width: 24
                                height: 24
                                anchors.centerIn: parent
                                fillMode: Image.PreserveAspectFit
                            }

                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: sidebar.activeTab = 1
                            }
                        }

                        // Botão do Topo: Ícone settings (Index 2)
                        Rectangle {
                            width: 45; height: 40; radius: 8
                            color: sidebar.activeTab === 2 ? "#468bf7" : "transparent"

                            Image {
                                source: "../assets/icons/settings_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                width: 24
                                height: 24
                                anchors.centerIn: parent
                                fillMode: Image.PreserveAspectFit
                            }

                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: sidebar.activeTab = 2
                            }
                        }

                        Item { Layout.fillWidth: true }
                    }

                    Item { Layout.fillWidth: true; height: 1 }
                    Text { text: "Connected"; color: "#a0aec0"; font.pixelSize: 14; font.bold: true }
                    Rectangle { Layout.fillWidth: true; height: 1; color: "#2d3748" }

                    // Card: Fulaninho 1
                    Rectangle {
                        Layout.fillWidth: true; height: 75; radius: 10; color: "#468bf7"
                        RowLayout {
                            anchors.fill: parent; anchors.margins: 10; spacing: 10
                            Image {
                                source: "../assets/icons/desktop_windows_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                Layout.preferredWidth: 24; Layout.preferredHeight: 24
                                fillMode: Image.PreserveAspectFit
                            }
                            ColumnLayout {
                                spacing: 2
                                Text { text: "Fulaninho"; color: "white"; font.bold: true; font.pixelSize: 14 }
                                Text { text: "ID: 123456789"; color: "#e2e8f0"; font.pixelSize: 11 }
                                Text { text: "Mobile: Samsung"; color: "white"; font.pixelSize: 12; Layout.topMargin: 4 }
                            }

                            Item { Layout.fillWidth: true }

                            RowLayout {
                                spacing: 8

                                Rectangle {
                                    Layout.preferredWidth: 24; Layout.preferredHeight: 24
                                    color: "transparent"

                                    Image {
                                        source: "../assets/icons/correto.png"
                                        anchors.fill: parent
                                        fillMode: Image.PreserveAspectFit
                                    }

                                    MouseArea {
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        onClicked: console.log("Aceito")
                                    }
                                }

                                Rectangle {
                                    Layout.preferredWidth: 24; Layout.preferredHeight: 24
                                    color: "transparent"

                                    Image {
                                        source: "../assets/icons/Xvermelho.png"
                                        anchors.fill: parent
                                        fillMode: Image.PreserveAspectFit
                                    }

                                    MouseArea {
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        onClicked: console.log("Recusado")
                                    }
                                }
                            }
                        }
                    }

                    // Card: Fulaninho 2
                    Rectangle {
                        Layout.fillWidth: true; height: 75; radius: 10; color: "#468bf7"
                        RowLayout {
                            anchors.fill: parent; anchors.margins: 10; spacing: 10
                            Image {
                                source: "../assets/icons/desktop_windows_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                Layout.preferredWidth: 24; Layout.preferredHeight: 24
                                fillMode: Image.PreserveAspectFit
                            }
                            ColumnLayout {
                                spacing: 2
                                Text { text: "Fulaninho 2"; color: "white"; font.bold: true; font.pixelSize: 14 }
                                Text { text: "ID: 123456789"; color: "#e2e8f0"; font.pixelSize: 11 }
                                Text { text: "Desktop: PcFulaninho"; color: "white"; font.pixelSize: 12; Layout.topMargin: 4 }
                            }

                            Item { Layout.fillWidth: true }

                            RowLayout {
                                spacing: 12

                                // [ALTERAÇÃO 2] Envolvido o Logout em um Rectangle/MouseArea para clique individual
                                Rectangle {
                                    Layout.preferredWidth: 20; Layout.preferredHeight: 20
                                    color: "transparent"

                                    Image {
                                        source: "../assets/icons/Logout.png"
                                        anchors.fill: parent
                                        fillMode: Image.PreserveAspectFit
                                    }

                                    MouseArea {
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        onClicked: windowRoot.showLogoutDialog = true
                                    }
                                }

                                ColumnLayout {
                                    spacing: 3
                                    Layout.alignment: Qt.AlignVCenter

                                    Image {
                                        source: "../assets/icons/stadia_controller_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                        Layout.preferredWidth: 14; Layout.preferredHeight: 14
                                        fillMode: Image.PreserveAspectFit
                                    }
                                    Image {
                                        source: "../assets/icons/keyboard_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                        Layout.preferredWidth: 14; Layout.preferredHeight: 14
                                        fillMode: Image.PreserveAspectFit
                                    }
                                    Image {
                                        source: "../assets/icons/mouse_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                        Layout.preferredWidth: 14; Layout.preferredHeight: 14
                                        fillMode: Image.PreserveAspectFit
                                    }
                                }
                            }
                        }
                    }

                    Item { Layout.fillWidth: true; height: 5 }
                    Text { text: "Your Host"; color: "#a0aec0"; font.pixelSize: 14; font.bold: true }
                    Rectangle { Layout.fillWidth: true; height: 1; color: "#2d3748" }

                    // Card: You
                    Rectangle {
                        Layout.fillWidth: true; height: 75; radius: 10; color: "#151f2e"
                        RowLayout {
                            anchors.fill: parent; anchors.margins: 10; spacing: 10
                            Image {
                                source: "../assets/icons/desktop_windows_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                Layout.preferredWidth: 24; Layout.preferredHeight: 24
                                fillMode: Image.PreserveAspectFit
                            }
                            ColumnLayout {
                                spacing: 2
                                Text { text: "You"; color: "white"; font.bold: true; font.pixelSize: 14 }
                                Text { text: "ID: 000000000"; color: "#718096"; font.pixelSize: 11 }
                                Text { text: "Desktop: HomePc"; color: "#a0aec0"; font.pixelSize: 12; Layout.topMargin: 4 }
                            }
                        }
                    }

                    Item { Layout.fillWidth: true; height: 5 }
                    Text { text: "Online Friends"; color: "#a0aec0"; font.pixelSize: 14; font.bold: true }
                    Rectangle { Layout.fillWidth: true; height: 1; color: "#2d3748" }

                    // Card: Fulaninho 3
                    Rectangle {
                        Layout.fillWidth: true; height: 75; radius: 10; color: "#151f2e"
                        RowLayout {
                            anchors.fill: parent; anchors.margins: 10; spacing: 10
                            Image {
                                source: "../assets/icons/desktop_windows_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                Layout.preferredWidth: 24; Layout.preferredHeight: 24
                                fillMode: Image.PreserveAspectFit
                            }
                            ColumnLayout {
                                spacing: 2
                                Text { text: "Fulaninho 3"; color: "white"; font.bold: true; font.pixelSize: 14 }
                                Text { text: "ID: 123456789"; color: "#718096"; font.pixelSize: 11 }
                                Text { text: "Desktop: Pcfulano1"; color: "#a0aec0"; font.pixelSize: 12; Layout.topMargin: 4 }
                            }
                        }
                    }

                    Item { Layout.fillHeight: true }
                }
            }

            // ==========================================
            // 2. ÁREA DO CONTEÚDO PRINCIPAL (DIREITA)
            // ==========================================
            Rectangle {
                id: mainContent
                Layout.fillWidth: true
                Layout.fillHeight: parent
                color: "transparent"

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 25
                    spacing: 15

                    RowLayout {
                        Layout.fillWidth: true
                        Item { Layout.fillWidth: true }

                        Rectangle {
                            Layout.preferredWidth: 220
                            Layout.preferredHeight: 55
                            color: "#0c131d"
                            radius: 12

                            RowLayout {
                                anchors.fill: parent
                                anchors.margins: 10
                                spacing: 12

                                Rectangle {
                                    width: 35; height: 35; radius: 17.5
                                    color: "#2d3748"
                                    Image {
                                        source: "../assets/icons/person_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                        width: 20; height: 20
                                        anchors.centerIn: parent
                                        fillMode: Image.PreserveAspectFit
                                    }
                                }

                                ColumnLayout {
                                    spacing: 1
                                    Text { text: "Dick Vigarista"; color: "white"; font.bold: true; font.pixelSize: 14 }
                                    Text { text: "ID: 000000000"; color: "#718096"; font.pixelSize: 11 }
                                }
                            }
                        }
                    }

                    Rectangle {
                        id: videoWrapper
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#131a24"
                        radius: 12
                        clip: true

                        Rectangle {
                            id: videoCanvas
                            width: parent.width
                            height: parent.width * (9 / 16)
                            anchors.centerIn: parent
                            color: "#000000"

                            Component.onCompleted: {
                                if (height > parent.height) {
                                    height = parent.height
                                    width = height * (16 / 9)
                                }
                            }

                            /*Text {
                                text: "V"
                                font.pixelSize: parent.height * 0.4
                                font.bold: true
                                color: "#1d2d44"
                                anchors.centerIn: parent
                            }

                            Text {
                                text: "KVG"
                                font.pixelSize: 20
                                font.bold: true
                                color: "white"
                                opacity: 0.25
                                anchors.right: parent.right
                                anchors.bottom: parent.bottom
                                anchors.rightMargin: 15
                                anchors.bottomMargin: 15
                            }*/
                        }
                    }
                }
            }
        }

        // ==========================================
        // 3. [ALTERAÇÃO 3] POP-UP DE DESCONEXÃO (DIALOG)
        // Adicionado no final de forma isolada, sem alterar nada acima.
        // ==========================================
        Rectangle {
            id: logoutDialogOverlay
            anchors.fill: parent
            color: "#CC000000"
            visible: windowRoot.showLogoutDialog
            z: 100

            MouseArea { anchors.fill: parent; preventStealing: true }

            Rectangle {
                width: 320; height: 160; color: "#1d2636"
                border.color: "#468bf7"; border.width: 1; radius: 15
                anchors.centerIn: parent

                ColumnLayout {
                    anchors.fill: parent; anchors.margins: 20; spacing: 20

                    Text {
                        text: "Deseja desconectar?"
                        color: "white"; font.bold: true; font.pixelSize: 18
                        Layout.alignment: Qt.AlignHCenter
                    }

                    RowLayout {
                        spacing: 20; Layout.alignment: Qt.AlignHCenter

                        Rectangle {
                            width: 100; height: 40; radius: 8; color: "#e53e3e"
                            Text { text: "Sim"; color: "white"; anchors.centerIn: parent; font.bold: true }
                            MouseArea {
                                anchors.fill: parent; cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    console.log("Usuário desconectado!")
                                    windowRoot.showLogoutDialog = false
                                }
                            }
                        }

                        Rectangle {
                            width: 100; height: 40; radius: 8; color: "#4a5568"
                            Text { text: "Não"; color: "white"; anchors.centerIn: parent; font.bold: true }
                            MouseArea {
                                anchors.fill: parent; cursorShape: Qt.PointingHandCursor
                                onClicked: windowRoot.showLogoutDialog = false
                            }
                        }
                    }
                }
            }
        }
    }
}