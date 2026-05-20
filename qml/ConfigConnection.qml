import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window{
    id: windowRoot
    width: 800
    height: 640
    minimumWidth: 800
    minimumHeight: 640
    visible: true
    title: "Vectra"
    Rectangle {
        id: homeConfigConnectionScreen
        anchors.fill: parent
        color: "#15273d" // Fundo azul escuro principal

        // VARIÁVEIS DE ESTADO (Para controlar a seleção azul)
        property int topTab: 2     // 2 = Engrenagem (Selecionada por padrão no topo)
        property int currentTab: 1 // 1 = Connection (Selecionada por padrão nesta tela)

        RowLayout {
            anchors.fill: parent
            spacing: 0

            // ==========================================
            // PAINEL LATERAL ESQUERDO (ÍCONES ATUALIZADOS)
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

                    // ==============================================
                    // ÍCONES DO TOPO (Monitor, Amigos, Engrenagem)
                    // ==============================================
                    RowLayout {
                        Layout.alignment: Qt.AlignHCenter
                        Layout.bottomMargin: 10
                        spacing: 25

                        // Botão 0: Monitor
                        Button {
                            implicitWidth: 38; implicitHeight: 38
                            onClicked: topTab = 0
                            background: Rectangle { color: topTab === 0 ? "#64a1fb" : "transparent"; radius: 8 }
                            contentItem: Image {
                                source: "assets/Icons/desktop_windows_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                sourceSize: Qt.size(24, 24)
                                fillMode: Image.PreserveAspectFit; mipmap: true; anchors.centerIn: parent
                            }
                        }

                        // Botão 1: Amigos
                        Button {
                            implicitWidth: 38; implicitHeight: 38
                            onClicked: topTab = 1
                            background: Rectangle { color: topTab === 1 ? "#64a1fb" : "transparent"; radius: 8 }
                            contentItem: Image {
                                source: "assets/Icons/group_add_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                sourceSize: Qt.size(24, 24)
                                fillMode: Image.PreserveAspectFit; mipmap: true; anchors.centerIn: parent
                            }
                        }

                        // Botão 2: Engrenagem
                        Button {
                            implicitWidth: 38; implicitHeight: 38
                            onClicked: topTab = 2
                            background: Rectangle { color: topTab === 2 ? "#64a1fb" : "transparent"; radius: 8 }
                            contentItem: Image {
                                source: "assets/Icons/settings_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                sourceSize: Qt.size(20, 20)
                                fillMode: Image.PreserveAspectFit; mipmap: true; anchors.centerIn: parent
                            }
                        }
                    }

                    // ==========================================
                    // BOTÕES DO MENU LATERAL (PADRONIZADOS)
                    // ==========================================

                    // 0: VIDEO
                    Button {
                        Layout.fillWidth: true; Layout.preferredHeight: 55
                        onClicked: currentTab = 0
                        background: Rectangle { color: currentTab === 0 ? "#64a1fb" : "#111821"; radius: 12; border.color: currentTab === 0 ? "transparent" : "#1e2c3a"; border.width: 1 }
                        contentItem: Item { anchors.fill: parent
                            Row { spacing: 15; anchors.left: parent.left; anchors.leftMargin: 15; anchors.verticalCenter: parent.verticalCenter
                                Image { source: "assets/Icons/video_settings_30dp_EFEFEF_FILL0_wght400_GRAD0_opsz24.svg"; sourceSize: Qt.size(20, 20); fillMode: Image.PreserveAspectFit; mipmap: true; anchors.verticalCenter: parent.verticalCenter }
                                Text { text: "Video"; font.pixelSize: 15; font.bold: currentTab === 0; color: "white"; anchors.verticalCenter: parent.verticalCenter }
                            }
                        }
                    }

                    // 1: CONNECTION (ATIVO nesta tela)
                    Button {
                        Layout.fillWidth: true; Layout.preferredHeight: 55
                        onClicked: currentTab = 1
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
                        onClicked: currentTab = 2
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
                        onClicked: currentTab = 3
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
                        onClicked: currentTab = 4
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
            // ÁREA CENTRAL (CONTEÚDO DA CONEXÃO)
            // ==========================================
            ColumnLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.margins: 40
                Layout.alignment: Qt.AlignTop
                spacing: 20

                // Mostra o conteúdo se a aba for "Connection" (1)
                ColumnLayout {
                    visible: currentTab === 1
                    Layout.fillWidth: true
                    spacing: 20

                    // --- SEÇÃO HOST ---
                    Text { text: "Host"; color: "white"; font.pixelSize: 16; Layout.alignment: Qt.AlignHCenter }
                    Rectangle { Layout.fillWidth: true; height: 1; color: "#3d4e63" }

                    RowLayout {
                        Layout.fillWidth: true
                        Text { text: "Bandwidth Limit"; color: "white"; font.pixelSize: 14; Layout.fillWidth: true }
                        ComboBox {
                            id: cbHostBand
                            model: ["15 Mbps", "30 Mbps", "50 Mbps", "Unlimited"]
                            Layout.preferredWidth: 120; Layout.preferredHeight: 30
                            background: Rectangle { color: "#64a1fb"; radius: 15 }
                            contentItem: Text { text: cbHostBand.displayText; color: "white"; font.bold: true; verticalAlignment: Text.AlignVCenter; leftPadding: 15 }
                            indicator: Text { text: "⌄"; color: "white"; font.pixelSize: 16; font.bold: true; anchors.right: parent.right; anchors.rightMargin: 15; anchors.verticalCenter: parent.verticalCenter; anchors.verticalCenterOffset: -3 }
                        }
                    }

                    Item { Layout.preferredHeight: 40 } // Espaço maior entre Host e Client

                    // --- SEÇÃO CLIENT ---
                    Text { text: "Client"; color: "white"; font.pixelSize: 16; Layout.alignment: Qt.AlignHCenter }
                    Rectangle { Layout.fillWidth: true; height: 1; color: "#3d4e63" }

                    RowLayout {
                        Layout.fillWidth: true
                        Text { text: "Bandwidth Limit"; color: "white"; font.pixelSize: 14; Layout.fillWidth: true }
                        ComboBox {
                            id: cbClientBand
                            model: ["15 Mbps", "30 Mbps", "50 Mbps", "Unlimited"]
                            Layout.preferredWidth: 120; Layout.preferredHeight: 30
                            background: Rectangle { color: "#64a1fb"; radius: 15 }
                            contentItem: Text { text: cbClientBand.displayText; color: "white"; font.bold: true; verticalAlignment: Text.AlignVCenter; leftPadding: 15 }
                            indicator: Text { text: "⌄"; color: "white"; font.pixelSize: 16; font.bold: true; anchors.right: parent.right; anchors.rightMargin: 15; anchors.verticalCenter: parent.verticalCenter; anchors.verticalCenterOffset: -3 }
                        }
                    }
                }

                // Caso mude para outra aba, mostra um texto simples
                Text {
                    visible: currentTab !== 1
                    text: "Configurações de " + (currentTab === 0 ? "Vídeo" : currentTab === 2 ? "Gamepad" : currentTab === 3 ? "Macro" : "Conta")
                    color: "#a0aab5"
                    font.pixelSize: 18
                    Layout.alignment: Qt.AlignCenter
                }

                Item { Layout.fillHeight: true }
            }
        }
    }
}