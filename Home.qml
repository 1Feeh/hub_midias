import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: windowRoot
    anchors.fill: parent
    color: "#111b27"

    property bool showLogoutDialog: false

    RowLayout {
        anchors.fill: parent
        spacing: 0

        // ==========================================
        // 1. SIDEBAR (ESQUERDA)
        // ==========================================
        Rectangle {
            id: sidebar
            Layout.preferredWidth: 280
            Layout.fillHeight: true
            color: "#0b1016"

            property int activeTab: 0

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 15
                spacing: 12

                // --- Linha de Botões do Topo ---
                                RowLayout {
                                    Layout.fillWidth: true
                                    Layout.alignment: Qt.AlignHCenter
                                    spacing: 15

                                    Item { Layout.fillWidth: true }

                                    // Botão Home (SEMPRE AZUL AQUI - Tela Atual)
                                    Rectangle {
                                        width: 50; height: 45; radius: 10
                                        color: "#468bf7"
                                        Image {
                                            source: "assets/Icons/desktop_windows_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                            width: 28; height: 28; anchors.centerIn: parent; fillMode: Image.PreserveAspectFit
                                        }
                                        // Sem MouseArea, pois já estamos nesta tela
                                    }

                                    // Botão Adicionar Amigos
                                    Rectangle {
                                        width: 50; height: 45; radius: 10
                                        color: "transparent"
                                        Image {
                                            source: "assets/Icons/group_add_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                            width: 28; height: 28; anchors.centerIn: parent; fillMode: Image.PreserveAspectFit
                                        }
                                        MouseArea {
                                            anchors.fill: parent; cursorShape: Qt.PointingHandCursor
                                            onClicked: {
                                                sidebar.activeTab = 1
                                                windowRoot.StackView.view.replace("Homeaddfriends.qml")
                                            }
                                        }
                                    }

                                    // Botão Configurações
                                    Rectangle {
                                        width: 50; height: 45; radius: 10
                                        color: "transparent"
                                        Image {
                                            source: "assets/Icons/settings_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                            width: 28; height: 28; anchors.centerIn: parent; fillMode: Image.PreserveAspectFit
                                        }
                                        MouseArea {
                                            anchors.fill: parent; cursorShape: Qt.PointingHandCursor
                                            onClicked: {
                                                sidebar.activeTab = 2
                                                windowRoot.StackView.view.replace("HomeConfigVideo.qml")
                                            }
                                        }
                                    }

                                    Item { Layout.fillWidth: true }
                                }

                // --- Seção: Connected ---
                Item { Layout.fillWidth: true; height: 10 }
                Rectangle { Layout.fillWidth: true; height: 1; color: "#2d3748" }
                Text { text: "Connected"; color: "#ffffff"; font.pixelSize: 16; font.bold: true; Layout.alignment: Qt.AlignHCenter }
                Rectangle { Layout.fillWidth: true; height: 1; color: "#2d3748" }

                // --- CARD 1: FULANINHO ---
                Rectangle {
                    Layout.fillWidth: true
                    height: 85
                    radius: 12
                    color: "#64a1fb"
                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 12
                        spacing: 12
                        Image {
                            source: "assets/Icons/desktop_windows_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                            Layout.preferredWidth: 32; Layout.preferredHeight: 32; fillMode: Image.PreserveAspectFit
                        }
                        ColumnLayout {
                            spacing: 4
                            Text { text: "Fulaninho"; color: "white"; font.bold: true; font.pixelSize: 16 }
                            Text { text: "ID: 123456789"; color: "#e2e8f0"; font.pixelSize: 12 }
                            Text { text: "Mobile: Samsung"; color: "white"; font.pixelSize: 14; Layout.topMargin: 2 }
                        }
                        Item { Layout.fillWidth: true }
                        RowLayout {
                            spacing: 10
                            Image {
                                source: "assets/Icons/correto.png"
                                Layout.preferredWidth: 26; Layout.preferredHeight: 26; fillMode: Image.PreserveAspectFit; layer.enabled: true
                            }
                            Image {
                                source: "assets/Icons/Xvermelho.png"
                                Layout.preferredWidth: 26; Layout.preferredHeight: 26; fillMode: Image.PreserveAspectFit; layer.enabled: true
                            }
                        }
                    }
                }

                // --- CARD 2: FULANINHO 2 ---
                Rectangle {
                    Layout.fillWidth: true
                    height: 85
                    radius: 12
                    color: "#64a1fb"
                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 10
                        spacing: 10
                        Image {
                            source: "assets/Icons/desktop_windows_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                            Layout.preferredWidth: 32; Layout.preferredHeight: 32; fillMode: Image.PreserveAspectFit
                        }
                        ColumnLayout {
                            spacing: 4
                            Text { text: "Fulaninho 2"; color: "white"; font.bold: true; font.pixelSize: 16 }
                            Text { text: "ID: 123456789"; color: "#e2e8f0"; font.pixelSize: 12 }
                            Text { text: "Desktop: PcFulaninho"; color: "white"; font.pixelSize: 14; Layout.topMargin: 2 }
                        }
                        Item { Layout.fillWidth: true }

                        RowLayout {
                            // CONTROLE 1: Aumente este número para empurrar TUDO (botão + ícones) mais para a ESQUERDA
                            Layout.rightMargin: 1
                            spacing: 0

                            Image {
                                source: "assets/Icons/Logout.png"
                                Layout.preferredWidth: 24; Layout.preferredHeight: 24; fillMode: Image.PreserveAspectFit; layer.enabled: true

                                // CONTROLE 2: Aumente este número se quiser afastar SÓ O BOTÃO AMARELO dos 3 ícones
                                Layout.rightMargin: 1

                                MouseArea { anchors.fill: parent; cursorShape: Qt.PointingHandCursor; onClicked: windowRoot.showLogoutDialog = true }
                            }
                            ColumnLayout {
                                spacing: 4
                                Layout.alignment: Qt.AlignVCenter
                                Image { source: "assets/Icons/stadia_controller_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"; Layout.preferredWidth: 16; Layout.preferredHeight: 16; fillMode: Image.PreserveAspectFit }
                                Image { source: "assets/Icons/keyboard_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"; Layout.preferredWidth: 16; Layout.preferredHeight: 16; fillMode: Image.PreserveAspectFit }
                                Image { source: "assets/Icons/mouse_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"; Layout.preferredWidth: 16; Layout.preferredHeight: 16; fillMode: Image.PreserveAspectFit }
                            }
                        }
                    }
                }

                // --- Seção: Your Host ---
                Item { Layout.fillWidth: true; height: 10 }
                Rectangle { Layout.fillWidth: true; height: 1; color: "#2d3748" }
                Text { text: "Your Host"; color: "#ffffff"; font.pixelSize: 16; font.bold: true; Layout.alignment: Qt.AlignHCenter }
                Rectangle { Layout.fillWidth: true; height: 1; color: "#2d3748" }

                // --- CARD 3: YOU ---
                Rectangle {
                    Layout.fillWidth: true
                    height: 85
                    radius: 12
                    color: "#151f2e"
                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 12
                        spacing: 12
                        Image {
                            source: "assets/Icons/desktop_windows_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                            Layout.preferredWidth: 32; Layout.preferredHeight: 32; fillMode: Image.PreserveAspectFit
                        }
                        ColumnLayout {
                            spacing: 4
                            Text { text: "You"; color: "white"; font.bold: true; font.pixelSize: 16 }
                            Text { text: "ID: 000000000"; color: "#718096"; font.pixelSize: 12 }
                            Text { text: "Desktop: HomePc"; color: "#a0aec0"; font.pixelSize: 14; Layout.topMargin: 2 }
                        }
                    }
                }

                Item { Layout.fillHeight: true }
            }
        }

        // ==========================================
        // 2. CONTEÚDO PRINCIPAL (ÁREA DE VÍDEO)
        // ==========================================
        Rectangle {
            id: mainContent
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#111b27"

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 25
                spacing: 20

                // --- HEADER DA DIREITA (Perfil de Usuário) ---
                RowLayout {
                    Layout.fillWidth: true
                    Item { Layout.fillWidth: true }

                    Rectangle {
                        Layout.preferredWidth: 240
                        Layout.preferredHeight: 65
                        color: "#0b1016"
                        radius: 15

                        RowLayout {
                            anchors.fill: parent
                            anchors.margins: 12
                            spacing: 15

                            Rectangle {
                                width: 40; height: 40; radius: 20; color: "#151f2e"
                                Image {
                                    source: "assets/Icons/person_30dp_EFEFEF_FILL0_wght400_GRAD0_opsz24.svg"
                                    width: 24; height: 24; anchors.centerIn: parent; fillMode: Image.PreserveAspectFit
                                }
                            }

                            ColumnLayout {
                                spacing: 2
                                Text { text: "Dick Vigarista"; color: "white"; font.bold: true; font.pixelSize: 16 }
                                Text { text: "ID: 000000000"; color: "#718096"; font.pixelSize: 13 }
                            }
                        }
                    }
                }

                // --- ÁREA DE VÍDEO (CANVAS) ---
                Rectangle {
                    id: videoWrapper
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: "#283b54"
                    radius: 12
                    clip: true

                    Rectangle {
                        id: gameplayPlaceholder
                        width: parent.width - 40
                        height: parent.height - 40
                        anchors.centerIn: parent
                        color: "#2e8b57"
                        radius: 8
                    }

                    Image {
                        source: "assets/Icons/chat_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                        width: 36; height: 36
                        anchors.top: gameplayPlaceholder.top
                        anchors.left: gameplayPlaceholder.left
                        anchors.margins: 15
                        fillMode: Image.PreserveAspectFit
                    }

                    Image {
                        source: "assets/Icons/fullscreen_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                        width: 36; height: 36
                        anchors.bottom: gameplayPlaceholder.bottom
                        anchors.left: gameplayPlaceholder.left
                        anchors.margins: 15
                        fillMode: Image.PreserveAspectFit
                    }

                    Text {
                        text: "KVG"
                        color: "white"
                        font.pixelSize: 32
                        font.bold: true
                        font.italic: true
                        opacity: 0.5
                        anchors.bottom: gameplayPlaceholder.bottom
                        anchors.right: gameplayPlaceholder.right
                        anchors.margins: 20
                    }
                }
            }
        }
    }
}
