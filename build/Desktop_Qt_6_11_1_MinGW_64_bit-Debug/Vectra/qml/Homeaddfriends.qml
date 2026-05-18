import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    id: windowRoot
    width: 1024
    height: 640
    visible: true
    title: "KVG - Home Add Friends"

    // CORES DO SISTEMA
    readonly property color cadus_blue: "#15273D"

    // Linha de controle para o Pop-up de Desconexão
    property bool showLogoutDialog: false

    // ESTADOS DE CONTROLE: Convites Recebidos / Amigos (Fulaninho 1)
    property bool fulaninhoAceito: false
    property bool fulaninhoRecusado: false

    // ESTADOS DE CONTROLE: Amigo Fixo (Fulaninho 2)
    property bool fulaninho2Removido: false

    // ESTADOS DE CONTROLE: Convites Enviados por VOCÊ (Pesquisa)
    property bool conviteEnviado: false

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

                property int activeTab: 1
                property int activeCard: 1

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 15
                    spacing: 12

                    // Linha de botões do topo (Abas principais)
                    RowLayout {
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignHCenter
                        spacing: 15
                        Item { Layout.fillWidth: true }

                        Rectangle {
                            width: 45; height: 40; radius: 8
                            color: sidebar.activeTab === 0 ? "#468bf7" : "transparent"
                            Image {
                                source: "../assets/icons/desktop_windows_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                width: 24; height: 24; anchors.centerIn: parent; fillMode: Image.PreserveAspectFit
                            }
                            MouseArea { anchors.fill: parent; cursorShape: Qt.PointingHandCursor; onClicked: sidebar.activeTab = 0 }
                        }

                        Rectangle {
                            width: 45; height: 40; radius: 8
                            color: sidebar.activeTab === 1 ? "#468bf7" : "transparent"
                            Image {
                                source: "../assets/icons/group_add_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                width: 24; height: 24; anchors.centerIn: parent; fillMode: Image.PreserveAspectFit
                            }
                            MouseArea { anchors.fill: parent; cursorShape: Qt.PointingHandCursor; onClicked: sidebar.activeTab = 1 }
                        }

                        Rectangle {
                            width: 45; height: 40; radius: 8
                            color: sidebar.activeTab === 2 ? "#468bf7" : "transparent"
                            Image {
                                source: "../assets/icons/settings_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                width: 24; height: 24; anchors.centerIn: parent; fillMode: Image.PreserveAspectFit
                            }
                            MouseArea { anchors.fill: parent; cursorShape: Qt.PointingHandCursor; onClicked: sidebar.activeTab = 2 }
                        }
                        Item { Layout.fillWidth: true }
                    }

                    Item { Layout.fillWidth: true; height: 5 }

                    // ------------------------------------------
                    // SEÇÃO 1: CONVITES RECEBIDOS (Friend Requests)
                    // ------------------------------------------
                    Text {
                        text: "Friend Requests"
                        color: "#a0aec0"
                        font.pixelSize: 13
                        font.bold: true
                        visible: !windowRoot.fulaninhoAceito && !windowRoot.fulaninhoRecusado
                    }
                    Rectangle {
                        Layout.fillWidth: true; height: 1; color: "#2d3748"
                        visible: !windowRoot.fulaninhoAceito && !windowRoot.fulaninhoRecusado
                    }

                    // Card do convite que chegou para você
                    Rectangle {
                        id: cardConviteRecebido
                        Layout.fillWidth: true; height: 65; radius: 10
                        color: sidebar.activeCard === 1 ? "#468bf7" : "#151f2e"
                        visible: !windowRoot.fulaninhoAceito && !windowRoot.fulaninhoRecusado

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
                                Text { text: "ID: 123456789"; color: sidebar.activeCard === 1 ? "#e2e8f0" : "#718096"; font.pixelSize: 11 }
                            }

                            Item { Layout.fillWidth: true }

                            RowLayout {
                                spacing: 8

                                // Botão Aceitar (Círculo Verde)
                                Rectangle {
                                    width: 26; height: 26; radius: 13; color: "#22c55e"
                                    Image {
                                        source: "../assets/icons/check_circle_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                        anchors.centerIn: parent; width: 18; height: 18; fillMode: Image.PreserveAspectFit
                                    }
                                    MouseArea {
                                        anchors.fill: parent; cursorShape: Qt.PointingHandCursor
                                        onClicked: windowRoot.fulaninhoAceito = true
                                    }
                                }

                                // Botão Recusar Convite Recebido (X Vermelho)
                                Image {
                                    source: "../assets/icons/Xvermelho.png"
                                    Layout.preferredWidth: 22; Layout.preferredHeight: 22; fillMode: Image.PreserveAspectFit
                                    MouseArea {
                                        anchors.fill: parent; cursorShape: Qt.PointingHandCursor
                                        onClicked: windowRoot.fulaninhoRecusado = true
                                    }
                                }
                            }
                        }
                        MouseArea { anchors.fill: parent; z: -1; cursorShape: Qt.PointingHandCursor; onClicked: sidebar.activeCard = 1 }
                    }

                    // ------------------------------------------
                    // SEÇÃO 2: CONVITES ENVIADOS POR VOCÊ (Sent Requests)
                    // ------------------------------------------
                    Text {
                        text: "Sent Requests"
                        color: "#a0aec0"
                        font.pixelSize: 13
                        font.bold: true
                        visible: windowRoot.conviteEnviado
                    }
                    Rectangle {
                        Layout.fillWidth: true; height: 1; color: "#2d3748"
                        visible: windowRoot.conviteEnviado
                    }

                    // Card de convite enviado (Com o status curto "Enviado...")
                    Rectangle {
                        id: cardConviteEnviado
                        Layout.fillWidth: true; height: 65; radius: 10
                        color: sidebar.activeCard === 4 ? "#468bf7" : "#151f2e"
                        visible: windowRoot.conviteEnviado

                        RowLayout {
                            anchors.fill: parent; anchors.margins: 10; spacing: 10

                            Image {
                                source: "../assets/icons/desktop_windows_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                Layout.preferredWidth: 24; Layout.preferredHeight: 24
                                fillMode: Image.PreserveAspectFit
                            }

                            ColumnLayout {
                                spacing: 2
                                Text { text: "Clone Encontrado"; color: "white"; font.bold: true; font.pixelSize: 14 }

                                // Linha com ID + Status modificado para apenas "Enviado..."
                                RowLayout {
                                    spacing: 8
                                    Text { text: "ID: " + searchInput.text; color: sidebar.activeCard === 4 ? "#e2e8f0" : "#718096"; font.pixelSize: 11 }
                                    Text { text: "• Enviado..."; color: "#eab308"; font.pixelSize: 11; font.italic: true }
                                }
                            }

                            Item { Layout.fillWidth: true }

                            // Botão Cancelar Envio (X Vermelho)
                            Image {
                                source: "../assets/icons/Xvermelho.png"
                                Layout.preferredWidth: 22; Layout.preferredHeight: 22; fillMode: Image.PreserveAspectFit
                                MouseArea {
                                    anchors.fill: parent; cursorShape: Qt.PointingHandCursor
                                    onClicked: windowRoot.conviteEnviado = false
                                }
                            }
                        }
                        MouseArea { anchors.fill: parent; z: -1; cursorShape: Qt.PointingHandCursor; onClicked: sidebar.activeCard = 4 }
                    }

                    Item { Layout.fillWidth: true; height: 5 }

                    // ------------------------------------------
                    // SEÇÃO 3: SEUS AMIGOS (Your Friends)
                    // ------------------------------------------
                    Text {
                        text: "Your Friends"
                        color: "#a0aec0"
                        font.pixelSize: 13
                        font.bold: true
                        visible: windowRoot.fulaninhoAceito || !windowRoot.fulaninho2Removido
                    }
                    Rectangle {
                        Layout.fillWidth: true; height: 1; color: "#2d3748"
                        visible: windowRoot.fulaninhoAceito || !windowRoot.fulaninho2Removido
                    }

                    // Fulaninho promovido a amigo
                    Rectangle {
                        id: cardFulaninhoAceito
                        Layout.fillWidth: true; height: 65; radius: 10
                        color: sidebar.activeCard === 3 ? "#468bf7" : "#151f2e"
                        visible: windowRoot.fulaninhoAceito

                        RowLayout {
                            anchors.fill: parent; anchors.margins: 10; spacing: 10
                            Image {
                                source: "../assets/icons/desktop_windows_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                Layout.preferredWidth: 24; Layout.preferredHeight: 24; fillMode: Image.PreserveAspectFit
                            }
                            ColumnLayout {
                                spacing: 2
                                Text { text: "Fulaninho"; color: "white"; font.bold: true; font.pixelSize: 14 }
                                Text { text: "ID: 123456789"; color: sidebar.activeCard === 3 ? "#e2e8f0" : "#718096"; font.pixelSize: 11 }
                            }
                            Item { Layout.fillWidth: true }

                            Image {
                                source: "../assets/icons/Recusaramizade.png"
                                Layout.preferredWidth: 22; Layout.preferredHeight: 22; fillMode: Image.PreserveAspectFit
                                MouseArea {
                                    anchors.fill: parent; cursorShape: Qt.PointingHandCursor
                                    onClicked: { windowRoot.fulaninhoAceito = false; windowRoot.fulaninhoRecusado = true }
                                }
                            }
                        }
                        MouseArea { anchors.fill: parent; z: -1; cursorShape: Qt.PointingHandCursor; onClicked: sidebar.activeCard = 3 }
                    }

                    // Amigo Fixo - Fulaninho 2
                    Rectangle {
                        id: cardAmigoFixo
                        Layout.fillWidth: true; height: 65; radius: 10
                        color: sidebar.activeCard === 2 ? "#468bf7" : "#151f2e"
                        visible: !windowRoot.fulaninho2Removido

                        RowLayout {
                            anchors.fill: parent; anchors.margins: 10; spacing: 10
                            Image {
                                source: "../assets/icons/desktop_windows_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                Layout.preferredWidth: 24; Layout.preferredHeight: 24; fillMode: Image.PreserveAspectFit
                            }
                            ColumnLayout {
                                spacing: 2
                                Text { text: "Fulaninho 2"; color: "white"; font.bold: true; font.pixelSize: 14 }
                                Text { text: "ID: 123456789"; color: sidebar.activeCard === 2 ? "#e2e8f0" : "#718096"; font.pixelSize: 11 }
                            }
                            Item { Layout.fillWidth: true }

                            Image {
                                source: "../assets/icons/Recusaramizade.png"
                                Layout.preferredWidth: 22; Layout.preferredHeight: 22; fillMode: Image.PreserveAspectFit
                                MouseArea {
                                    anchors.fill: parent; cursorShape: Qt.PointingHandCursor;
                                    onClicked: windowRoot.fulaninho2Removido = true
                                }
                            }
                        }
                        MouseArea { anchors.fill: parent; z: -1; cursorShape: Qt.PointingHandCursor; onClicked: sidebar.activeCard = 2 }
                    }

                    Item { Layout.fillHeight: true }
                }
            }

            // ==========================================
            // 2. ÁREA DE BUSCA DINÂMICA (DIREITA)
            // ==========================================
            Rectangle {
                id: mainContent
                Layout.fillWidth: true
                Layout.fillHeight: parent
                color: windowRoot.cadus_blue

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 40
                    spacing: 30

                    // CAMPO DE BUSCA (Search Bar)
                    Rectangle {
                        Layout.fillWidth: true
                        height: 50
                        color: "#161f2e"
                        radius: 10
                        border.color: "#2d3748"
                        border.width: 1

                        RowLayout {
                            anchors.fill: parent
                            anchors.margins: 15

                            TextInput {
                                id: searchInput
                                Layout.fillWidth: true
                                text: "123456789"
                                color: "white"
                                font.pixelSize: 16
                                verticalAlignment: Text.AlignVCenter
                                clip: true

                                Text {
                                    text: "Digite o ID do amigo..."
                                    color: "#4a5568"
                                    font.pixelSize: 16
                                    visible: parent.text === ""
                                    anchors.fill: parent
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }

                            Image {
                                source: "../assets/icons/search_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                Layout.preferredWidth: 24; Layout.preferredHeight: 24; fillMode: Image.PreserveAspectFit
                            }
                        }
                    }

                    // RESULTADO DA BUSCA
                    Rectangle {
                        id: searchResultCard
                        Layout.fillWidth: true
                        height: 80
                        color: "transparent"
                        visible: searchInput.text !== "" && !windowRoot.conviteEnviado

                        RowLayout {
                            anchors.fill: parent
                            anchors.margins: 10
                            spacing: 15

                            ColumnLayout {
                                spacing: 2
                                Text { text: "Clone Encontrado"; color: "white"; font.bold: true; font.pixelSize: 18 }
                                Text { text: "ID: " + searchInput.text; color: "#9ca3af"; font.pixelSize: 14 }
                            }

                            Item { Layout.fillWidth: true }

                            // Botão de Enviar Solicitação
                            Rectangle {
                                width: 40; height: 40; radius: 20; color: "#2d3748"
                                Image {
                                    source: "../assets/icons/group_add_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                    anchors.centerIn: parent; width: 22; height: 22
                                }
                                MouseArea {
                                    anchors.fill: parent; cursorShape: Qt.PointingHandCursor
                                    onClicked: {
                                        console.log("Você enviou uma solicitação!")
                                        windowRoot.conviteEnviado = true
                                    }
                                }
                            }
                        }
                    }

                    Item { Layout.fillHeight: true }
                }
            }
        }

        // ==========================================
        // 3. POP-UP DE DESCONEXÃO (DIALOG)
        // ==========================================
        Rectangle {
            id: logoutDialogOverlay
            anchors.fill: parent; color: "#CC000000"; visible: windowRoot.showLogoutDialog; z: 100
            MouseArea { anchors.fill: parent; preventStealing: true }
            Rectangle {
                width: 320; height: 160; color: "#1d2636"; border.color: "#468bf7"; border.width: 1; radius: 15; anchors.centerIn: parent
                ColumnLayout {
                    anchors.fill: parent; anchors.margins: 20; spacing: 20
                    Text { text: "Deseja desconectar?"; color: "white"; font.bold: true; font.pixelSize: 18; Layout.alignment: Qt.AlignHCenter }
                    RowLayout {
                        spacing: 20; Layout.alignment: Qt.AlignHCenter
                        Rectangle { width: 100; height: 40; radius: 8; color: "#e53e3e"; Text { text: "Sim"; color: "white"; anchors.centerIn: parent; font.bold: true } MouseArea { anchors.fill: parent; cursorShape: Qt.PointingHandCursor; onClicked: windowRoot.showLogoutDialog = false } }
                        Rectangle { width: 100; height: 40; radius: 8; color: "#4a5568"; Text { text: "Não"; color: "white"; anchors.centerIn: parent; font.bold: true } MouseArea { anchors.fill: parent; cursorShape: Qt.PointingHandCursor; onClicked: windowRoot.showLogoutDialog = false } }
                    }
                }
            }
        }
    }
}