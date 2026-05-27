import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: addFriendsScreen
    anchors.fill: parent
    color: "#111b27"

    property int activeTab: 1
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

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 15
                spacing: 12

                // --- Linha de Botões do Topo (Navegação) ---
                                RowLayout {
                                    Layout.fillWidth: true
                                    Layout.alignment: Qt.AlignHCenter
                                    spacing: 15

                                    Item { Layout.fillWidth: true }

                                    // Botão Home
                                    Rectangle {
                                        width: 50; height: 45; radius: 10
                                        color: "transparent"
                                        Image {
                                            source: "assets/Icons/desktop_windows_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                            width: 28; height: 28; anchors.centerIn: parent; fillMode: Image.PreserveAspectFit
                                        }
                                        MouseArea {
                                            anchors.fill: parent; cursorShape: Qt.PointingHandCursor
                                            onClicked: {
                                                addFriendsScreen.StackView.view.replace("Home.qml")
                                            }
                                        }
                                    }

                                    // Botão Adicionar Amigos (SEMPRE AZUL AQUI - Tela Atual)
                                    Rectangle {
                                        width: 50; height: 45; radius: 10
                                        color: "#468bf7"
                                        Image {
                                            source: "assets/Icons/group_add_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                            width: 28; height: 28; anchors.centerIn: parent; fillMode: Image.PreserveAspectFit
                                        }
                                        // Sem MouseArea, pois já estamos nesta tela
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
                                                addFriendsScreen.StackView.view.replace("HomeConfigVideo.qml")
                                            }
                                        }
                                    }

                                    Item { Layout.fillWidth: true }
                                }

                // --- Seção: Pedidos Pendentes ---
                Item { Layout.fillWidth: true; height: 10 }
                Rectangle { Layout.fillWidth: true; height: 1; color: "#2d3748" }
                Text { text: "Pedidos Pendentes"; color: "#ffffff"; font.pixelSize: 16; font.bold: true; Layout.alignment: Qt.AlignHCenter }
                Rectangle { Layout.fillWidth: true; height: 1; color: "#2d3748" }

                // --- CARD 1: SOLICITAÇÃO RECEBIDA (AZUL ATIVO) ---
                Rectangle {
                    Layout.fillWidth: true
                    height: 85
                    radius: 12
                    color: "#64a1fb"
                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 12
                        spacing: 12

                        Rectangle {
                            width: 32; height: 32; radius: 16; color: "#ffffff"; opacity: 0.2
                            Image {
                                source: "assets/Icons/person_30dp_EFEFEF_FILL0_wght400_GRAD0_opsz24.svg"
                                width: 20; height: 20; anchors.centerIn: parent; fillMode: Image.PreserveAspectFit
                            }
                        }

                        ColumnLayout {
                            spacing: 2
                            Text { text: "Novo Amigo?"; color: "white"; font.bold: true; font.pixelSize: 16 }
                            Text { text: "ID: 987654321"; color: "#e2e8f0"; font.pixelSize: 12 }
                        }
                        Item { Layout.fillWidth: true }

                        RowLayout {
                            spacing: 10
                            Image {
                                source: "assets/Icons/correto.png"
                                Layout.preferredWidth: 26; Layout.preferredHeight: 26; fillMode: Image.PreserveAspectFit
                                MouseArea { anchors.fill: parent; cursorShape: Qt.PointingHandCursor; onClicked: console.log("Aceitou amigo") }
                            }
                            Image {
                                source: "assets/Icons/Xvermelho.png"
                                Layout.preferredWidth: 26; Layout.preferredHeight: 26; fillMode: Image.PreserveAspectFit
                                MouseArea { anchors.fill: parent; cursorShape: Qt.PointingHandCursor; onClicked: console.log("Recusou amigo") }
                            }
                        }
                    }
                }

                Item { Layout.fillHeight: true }
            }
        }

        // ==========================================
        // 2. CONTEÚDO PRINCIPAL (ÁREA DE BUSCA)
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

                // --- HEADER DA DIREITA ---
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

                // --- ÁREA DE CONTEÚDO CENTRAL ---
                Rectangle {
                    id: contentWrapper
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: "#0b1016"
                    radius: 12
                    border.color: "#1e2c3a"
                    anchors.margins: 20

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 30
                        spacing: 20

                        Text {
                            text: "Adicionar Novo Amigo"
                            color: "white"
                            font.pixelSize: 24
                            font.bold: true
                            Layout.alignment: Qt.AlignHCenter
                        }

                        // --- Barra de Pesquisa ---
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 55
                            color: "#1a2636"
                            radius: 10
                            border.color: "#3d4e63"

                            RowLayout {
                                anchors.fill: parent
                                anchors.margins: 15

                                Image {
                                    source: "assets/Icons/search_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                    Layout.preferredWidth: 24; Layout.preferredHeight: 24
                                    fillMode: Image.PreserveAspectFit
                                    opacity: 0.5
                                }

                                TextField {
                                    id: searchInput
                                    Layout.fillWidth: true
                                    placeholderText: "Digite o ID do amigo (ex: 123456789)"
                                    placeholderTextColor: "#4a5568"
                                    color: "white"
                                    font.pixelSize: 16
                                    background: Item {}
                                }
                            }
                        }

                        // --- Botão de Enviar Pedido ---
                        Rectangle {
                            id: sendRequestButton
                            Layout.preferredWidth: 200
                            Layout.preferredHeight: 50
                            Layout.alignment: Qt.AlignHCenter
                            Layout.topMargin: 20
                            color: searchInput.text.length > 5 ? "#468bf7" : "#1e2c3a"
                            radius: 10

                            Text {
                                text: "Enviar Pedido"
                                color: "white"
                                font.bold: true
                                font.pixelSize: 16
                                anchors.centerIn: parent
                            }

                            MouseArea {
                                anchors.fill: parent
                                cursorShape: searchInput.text.length > 5 ? Qt.PointingHandCursor : Qt.ArrowCursor
                                enabled: searchInput.text.length > 5
                                onClicked: console.log("Pedido de amizade enviado para: " + searchInput.text)
                            }
                        }

                        Item { Layout.fillHeight: true }
                    }
                }
            }
        }
    }
}
