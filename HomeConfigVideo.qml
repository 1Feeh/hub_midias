import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: homeConfigVideoScreen
    anchors.fill: parent
    color: "#15273d"

    property int topTab: 2     // 0 = Monitor, 1 = Amigos, 2 = Engrenagem (Padrão)
    property int currentTab: 0 // 0 = Video, 1 = Connection, 2 = Gamepad, etc.

    RowLayout {
        anchors.fill: parent
        spacing: 0

        // ==========================================
        // PAINEL LATERAL ESQUERDO
        // ==========================================
        Rectangle {
            Layout.preferredWidth: 280
            Layout.fillHeight: true
            color: "#0b1016"
            border.color: "#1e2c3a"

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 15
                spacing: 8

                // --- ÍCONES DO TOPO (PADRONIZADOS) ---
                                RowLayout {
                                    Layout.alignment: Qt.AlignHCenter
                                    Layout.bottomMargin: 10
                                    spacing: 25

                                    // Monitor / Windows (Home)
                                    Button {
                                        implicitWidth: 38; implicitHeight: 38
                                        onClicked: {
                                            mainStack.replace("Home.qml")
                                        }
                                        background: Rectangle { color: "transparent"; radius: 8 }
                                        contentItem: Image {
                                            source: "assets/Icons/desktop_windows_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                            sourceSize: Qt.size(24, 24)
                                            fillMode: Image.PreserveAspectFit; mipmap: true; anchors.centerIn: parent
                                        }
                                    }

                                    // Add Amigo / Group
                                    Button {
                                        implicitWidth: 38; implicitHeight: 38
                                        onClicked: {
                                            mainStack.replace("Homeaddfriends.qml")
                                        }
                                        background: Rectangle { color: "transparent"; radius: 8 }
                                        contentItem: Image {
                                            source: "assets/Icons/group_add_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                            sourceSize: Qt.size(24, 24)
                                            fillMode: Image.PreserveAspectFit; mipmap: true; anchors.centerIn: parent
                                        }
                                    }

                                    // Engrenagem / Settings (SEMPRE AZUL AQUI - Tela Atual)
                                    Button {
                                        implicitWidth: 38; implicitHeight: 38
                                        // Sem onClicked, já estamos nesta tela
                                        background: Rectangle { color: "#64a1fb"; radius: 8 }
                                        contentItem: Image {
                                            source: "assets/Icons/settings_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                            sourceSize: Qt.size(20, 20)
                                            fillMode: Image.PreserveAspectFit; mipmap: true; anchors.centerIn: parent
                                        }
                                    }
                                }
                // --- Seção: Config. ---
                Item { Layout.fillWidth: true; height: 10 }
                Rectangle { Layout.fillWidth: true; height: 1; color: "#2d3748" }
                Text { text: "Config."; color: "#ffffff"; font.pixelSize: 16; font.bold: true; Layout.alignment: Qt.AlignHCenter }
                Rectangle { Layout.fillWidth: true; height: 1; color: "#2d3748" }


                // ==========================================
                                // BOTÕES DO MENU LATERAL (Navegação Unificada)
                                // ==========================================

                                // 0: VIDEO
                                Button {
                                    Layout.fillWidth: true; Layout.preferredHeight: 55
                                    onClicked: {
                                        if (currentTab !== 0) mainStack.replace("HomeConfigVideo.qml")
                                    }
                                    background: Rectangle { color: currentTab === 0 ? "#64a1fb" : "#111821"; radius: 12; border.color: currentTab === 0 ? "transparent" : "#1e2c3a"; border.width: 1 }
                                    contentItem: Item { anchors.fill: parent
                                        Row { spacing: 15; anchors.left: parent.left; anchors.leftMargin: 15; anchors.verticalCenter: parent.verticalCenter
                                            Image { source: "assets/Icons/video_settings_30dp_EFEFEF_FILL0_wght400_GRAD0_opsz24.svg"; sourceSize: Qt.size(20, 20); fillMode: Image.PreserveAspectFit; mipmap: true; anchors.verticalCenter: parent.verticalCenter }
                                            Text { text: "Video"; font.pixelSize: 15; font.bold: currentTab === 0; color: "white"; anchors.verticalCenter: parent.verticalCenter }
                                        }
                                    }
                                }

                                // 1: CONNECTION
                                Button {
                                    Layout.fillWidth: true; Layout.preferredHeight: 55
                                    onClicked: {
                                        if (currentTab !== 1) mainStack.replace("HomeConfigConnection.qml")
                                    }
                                    background: Rectangle { color: currentTab === 1 ? "#64a1fb" : "#111821"; radius: 12; border.color: currentTab === 1 ? "transparent" : "#1e2c3a"; border.width: 1 }
                                    contentItem: Item { anchors.fill: parent
                                        Row { spacing: 15; anchors.left: parent.left; anchors.leftMargin: 15; anchors.verticalCenter: parent.verticalCenter
                                            Image { source: "assets/Icons/broadcast_on_home_30dp_EFEFEF_FILL0_wght400_GRAD0_opsz24.svg"; sourceSize: Qt.size(20, 20); fillMode: Image.PreserveAspectFit; mipmap: true; anchors.verticalCenter: parent.verticalCenter }
                                            Text { text: "Connection"; font.pixelSize: 15; font.bold: currentTab === 1; color: "white"; anchors.verticalCenter: parent.verticalCenter }
                                        }
                                    }
                                }

                                // 2: GAMEPAD
                                Button {
                                    Layout.fillWidth: true; Layout.preferredHeight: 55
                                    onClicked: {
                                        if (currentTab !== 2) mainStack.replace("HomeConfigGamepad.qml")
                                    }
                                    background: Rectangle { color: currentTab === 2 ? "#64a1fb" : "#111821"; radius: 12; border.color: currentTab === 2 ? "transparent" : "#1e2c3a"; border.width: 1 }
                                    contentItem: Item { anchors.fill: parent
                                        Row { spacing: 15; anchors.left: parent.left; anchors.leftMargin: 15; anchors.verticalCenter: parent.verticalCenter
                                            Image { source: "assets/Icons/videogame_asset_30dp_EFEFEF_FILL0_wght400_GRAD0_opsz24.svg"; sourceSize: Qt.size(20, 20); fillMode: Image.PreserveAspectFit; mipmap: true; anchors.verticalCenter: parent.verticalCenter }
                                            Text { text: "Gamepad"; font.pixelSize: 15; font.bold: currentTab === 2; color: "white"; anchors.verticalCenter: parent.verticalCenter }
                                        }
                                    }
                                }

                                // 3: MACRO
                                Button {
                                    Layout.fillWidth: true; Layout.preferredHeight: 55
                                    onClicked: {
                                        if (currentTab !== 3) mainStack.replace("HomeConfigMacro.qml")
                                    }
                                    background: Rectangle { color: currentTab === 3 ? "#64a1fb" : "#111821"; radius: 12; border.color: currentTab === 3 ? "transparent" : "#1e2c3a"; border.width: 1 }
                                    contentItem: Item { anchors.fill: parent
                                        Row { spacing: 15; anchors.left: parent.left; anchors.leftMargin: 15; anchors.verticalCenter: parent.verticalCenter
                                            Image { source: "assets/Icons/keyboard_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"; sourceSize: Qt.size(20, 20); fillMode: Image.PreserveAspectFit; mipmap: true; anchors.verticalCenter: parent.verticalCenter }
                                            Text { text: "Macro"; font.pixelSize: 15; font.bold: currentTab === 3; color: "white"; anchors.verticalCenter: parent.verticalCenter }
                                        }
                                    }
                                }

                                // 4: ACCOUNT
                                Button {
                                    Layout.fillWidth: true; Layout.preferredHeight: 55
                                    onClicked: {
                                        if (currentTab !== 4) mainStack.replace("HomeConfigAccount.qml")
                                    }
                                    background: Rectangle { color: currentTab === 4 ? "#64a1fb" : "#111821"; radius: 12; border.color: currentTab === 4 ? "transparent" : "#1e2c3a"; border.width: 1 }
                                    contentItem: Item { anchors.fill: parent
                                        Row { spacing: 15; anchors.left: parent.left; anchors.leftMargin: 15; anchors.verticalCenter: parent.verticalCenter
                                            Image { source: "assets/Icons/person_30dp_EFEFEF_FILL0_wght400_GRAD0_opsz24.svg"; sourceSize: Qt.size(20, 20); fillMode: Image.PreserveAspectFit; mipmap: true; anchors.verticalCenter: parent.verticalCenter }
                                            Text { text: "Account"; font.pixelSize: 15; font.bold: currentTab === 4; color: "white"; anchors.verticalCenter: parent.verticalCenter }
                                        }
                                    }
                                }

                Item { Layout.fillHeight: true }
            }
        }

        // ==========================================
        // ÁREA CENTRAL (Configurações)
        // ==========================================
        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: 40
            Layout.alignment: Qt.AlignTop
            spacing: 20

            ColumnLayout {
                visible: currentTab === 0
                Layout.fillWidth: true
                spacing: 20

                // --- SEÇÃO HOST ---
                Text { text: "Host"; color: "white"; font.pixelSize: 16; Layout.alignment: Qt.AlignHCenter }
                Rectangle { Layout.fillWidth: true; height: 1; color: "#3d4e63" }

                RowLayout {
                    Layout.fillWidth: true
                    Text { text: "Resolution"; color: "white"; font.pixelSize: 14; Layout.fillWidth: true }
                    ComboBox {
                        id: cbHost
                        model: ["1080p", "720p", "480p"]
                        Layout.preferredWidth: 105; Layout.preferredHeight: 30
                        background: Rectangle { color: "#64a1fb"; radius: 15 }
                        contentItem: Text { text: cbHost.displayText; color: "white"; font.bold: true; verticalAlignment: Text.AlignVCenter; leftPadding: 15 }
                        indicator: Text { text: "⌄"; color: "white"; font.pixelSize: 16; font.bold: true; anchors.right: parent.right; anchors.rightMargin: 15; anchors.verticalCenter: parent.verticalCenter; anchors.verticalCenterOffset: -3 }
                    }
                }

                RowLayout {
                    Layout.fillWidth: true
                    Text { text: "Vertical Sinc. (V-Sync)"; color: "white"; font.pixelSize: 14; Layout.fillWidth: true }
                    Switch {
                        id: swHost; checked: true
                        indicator: Rectangle {
                            implicitWidth: 46; implicitHeight: 26; radius: 13
                            color: swHost.checked ? "#64a1fb" : "transparent"
                            border.color: swHost.checked ? "transparent" : "#7d8b99"
                            border.width: swHost.checked ? 0 : 2
                            Rectangle {
                                x: swHost.checked ? 23 : 3; y: swHost.checked ? 3 : 2
                                width: swHost.checked ? 20 : 18; height: swHost.checked ? 20 : 18; radius: 10
                                color: swHost.checked ? "white" : "#7d8b99"
                                Behavior on x { NumberAnimation { duration: 150 } }
                            }
                        }
                    }
                }

                Item { Layout.preferredHeight: 30 }

                // --- SEÇÃO CLIENT ---
                Text { text: "Client"; color: "white"; font.pixelSize: 16; Layout.alignment: Qt.AlignHCenter }
                Rectangle { Layout.fillWidth: true; height: 1; color: "#3d4e63" }

                RowLayout {
                    Layout.fillWidth: true
                    Text { text: "Resolution"; color: "white"; font.pixelSize: 14; Layout.fillWidth: true }
                    ComboBox {
                        id: cbClient
                        model: ["1080p", "720p", "480p"]
                        Layout.preferredWidth: 105; Layout.preferredHeight: 30
                        background: Rectangle { color: "#64a1fb"; radius: 15 }
                        contentItem: Text { text: cbClient.displayText; color: "white"; font.bold: true; verticalAlignment: Text.AlignVCenter; leftPadding: 15 }
                        indicator: Text { text: "⌄"; color: "white"; font.pixelSize: 16; font.bold: true; anchors.right: parent.right; anchors.rightMargin: 15; anchors.verticalCenter: parent.verticalCenter; anchors.verticalCenterOffset: -3 }
                    }
                }

                RowLayout {
                    Layout.fillWidth: true
                    Text { text: "Vertical Sinc. (V-Sync)"; color: "white"; font.pixelSize: 14; Layout.fillWidth: true }
                    Switch {
                        id: swClient; checked: false
                        indicator: Rectangle {
                            implicitWidth: 46; implicitHeight: 26; radius: 13
                            color: swClient.checked ? "#64a1fb" : "transparent"
                            border.color: swClient.checked ? "transparent" : "#7d8b99"
                            border.width: swClient.checked ? 0 : 2
                            Rectangle {
                                x: swClient.checked ? 23 : 3; y: swClient.checked ? 3 : 2
                                width: swClient.checked ? 20 : 18; height: swClient.checked ? 20 : 18; radius: 10
                                color: swClient.checked ? "white" : "#7d8b99"
                                Behavior on x { NumberAnimation { duration: 150 } }
                            }
                        }
                    }
                }
            }

            Text {
                visible: currentTab !== 0
                text: "Configurações de " + (currentTab === 1 ? "Conexão" : currentTab === 2 ? "Gamepad" : currentTab === 3 ? "Macro" : "Conta")
                color: "#a0aab5"
                font.pixelSize: 18
                Layout.alignment: Qt.AlignCenter
            }

            Item { Layout.fillHeight: true }
        }
    }
}
