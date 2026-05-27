import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: accountScreen
    anchors.fill: parent
    color: "#15273d"

    // VARIÁVEIS DE ESTADO
    property int topTab: 2     // 2 = Engrenagem selecionada
    property int currentTab: 4 // 4 = Account selecionado

    RowLayout {
        anchors.fill: parent
        spacing: 0

        // ==========================================
        // PAINEL LATERAL ESQUERDO (ATUALIZADO)
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

                // --- ÍCONES DO TOPO ---
                RowLayout {
                    Layout.alignment: Qt.AlignHCenter
                    Layout.bottomMargin: 10
                    spacing: 25

                    Button {
                        implicitWidth: 38; implicitHeight: 38
                        onClicked: mainStack.replace("Home.qml")
                        background: Rectangle { color: topTab === 0 ? "#64a1fb" : "transparent"; radius: 8 }
                        contentItem: Image {
                            source: "assets/Icons/desktop_windows_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                            sourceSize: Qt.size(24, 24); fillMode: Image.PreserveAspectFit; mipmap: true; anchors.centerIn: parent
                        }
                    }
                    Button {
                        implicitWidth: 38; implicitHeight: 38
                        onClicked: mainStack.replace("Homeaddfriends.qml")
                        background: Rectangle { color: topTab === 1 ? "#64a1fb" : "transparent"; radius: 8 }
                        contentItem: Image {
                            source: "assets/Icons/group_add_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                            sourceSize: Qt.size(24, 24); fillMode: Image.PreserveAspectFit; mipmap: true; anchors.centerIn: parent
                        }
                    }
                    Button {
                        implicitWidth: 38; implicitHeight: 38
                        onClicked: mainStack.replace("HomeConfigVideo.qml")
                        background: Rectangle { color: topTab === 2 ? "#64a1fb" : "transparent"; radius: 8 }
                        contentItem: Image {
                            source: "assets/Icons/settings_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                            sourceSize: Qt.size(20, 20); fillMode: Image.PreserveAspectFit; mipmap: true; anchors.centerIn: parent
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
        // ÁREA CENTRAL (CONTEÚDO DA CONTA)
        // ==========================================
        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            // CARTÃO CENTRAL DE PERFIL
            Rectangle {
                id: profileCard
                anchors.centerIn: parent
                width: 580; height: 230
                color: "#111821"
                radius: 15
                border.color: "#1e2c3a"

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 25
                    spacing: 25

                    // ÍCONE DE PERFIL GRANDE
                    Image {
                        Layout.preferredWidth: 110
                        Layout.preferredHeight: 110
                        Layout.alignment: Qt.AlignVCenter
                        source: "assets/Icons/person_30dp_EFEFEF_FILL0_wght400_GRAD0_opsz24.svg"
                        sourceSize: Qt.size(110, 110)
                        fillMode: Image.PreserveAspectFit
                        mipmap: true
                    }

                    // INFORMAÇÕES TEXTUAIS + BOTÕES
                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 6
                        Layout.alignment: Qt.AlignVCenter

                        Text { text: "Username: Dick Vigarista"; color: "white"; font.pixelSize: 20; font.bold: true }
                        Text { text: "ID: 000000000"; color: "#a0aab5"; font.pixelSize: 15 }
                        Text { text: "Gmail: example@email.com"; color: "#a0aab5"; font.pixelSize: 15 }

                        Item { Layout.preferredHeight: 15 }

                        // LINHA DOS BOTÕES
                        RowLayout {
                            Layout.fillWidth: true
                            spacing: 12

                            Button {
                                Layout.preferredHeight: 35
                                Layout.preferredWidth: 180
                                background: Rectangle { color: "#64a1fb"; radius: 8 }
                                contentItem: Text { text: "Reset your password"; color: "white"; font.pixelSize: 13; font.bold: true; horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter }
                            }

                            Button {
                                Layout.preferredHeight: 35
                                Layout.preferredWidth: 90
                                background: Rectangle { color: "#ef4444"; radius: 8 }
                                contentItem: Text { text: "Exit"; color: "white"; font.pixelSize: 13; font.bold: true; horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter }
                            }

                            Item { Layout.fillWidth: true }
                        }
                    }
                }
            }

            // LOGO "V" NO CANTO INFERIOR DIREITO
            Image {
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                anchors.margins: 25
                width: 75; height: 75
                source: "assets/Icons/Vector.png"
                sourceSize: Qt.size(75, 75)
                fillMode: Image.PreserveAspectFit
                mipmap: true
            }
        }
    }
}
