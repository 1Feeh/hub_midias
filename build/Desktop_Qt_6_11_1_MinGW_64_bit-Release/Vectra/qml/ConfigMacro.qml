import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15


Item {
    anchors.fill: parent

    RowLayout {
        anchors.fill: parent
        spacing: 0
        Rectangle {
            id: homeConfigMacroScreen
            anchors.fill: parent
            color: "#15273d"

            property int topTab: 2
            property int currentTab: 3 // 3 = Macro selecionado

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
                                onClicked: mainWindow.tela = "../qml/Home.qml"
                                background: Rectangle { color: topTab === 0 ? "#64a1fb" : "transparent"; radius: 8 }
                                contentItem: Image {
                                    source: "../assets/icons/desktop_windows_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                    sourceSize: Qt.size(24, 24); fillMode: Image.PreserveAspectFit; mipmap: true; anchors.centerIn: parent
                                }
                            }
                            Button {
                                implicitWidth: 38; implicitHeight: 38
                                onClicked: mainWindow.tela = "../qml/Homeaddfriends.qml"
                                background: Rectangle { color: topTab === 1 ? "#64a1fb" : "transparent"; radius: 8 }
                                contentItem: Image {
                                    source: "../assets/icons/group_add_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                    sourceSize: Qt.size(24, 24); fillMode: Image.PreserveAspectFit; mipmap: true; anchors.centerIn: parent
                                }
                            }
                            Button {
                                implicitWidth: 38; implicitHeight: 38
                                onClicked: mainWindow.tela = "../qml/ConfigVideo.qml"
                                background: Rectangle { color: topTab === 2 ? "#64a1fb" : "transparent"; radius: 8 }
                                contentItem: Image {
                                    source: "../assets/icons/settings_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                    sourceSize: Qt.size(20, 20); fillMode: Image.PreserveAspectFit; mipmap: true; anchors.centerIn: parent
                                }
                            }
                        }

                        // --- BOTÕES DO MENU LATERAL ---

                        // 0: VIDEO
                        Button {
                            Layout.fillWidth: true; Layout.preferredHeight: 55
                            onClicked: mainWindow.tela = "../qml/ConfigVideo.qml"
                            background: Rectangle { color: currentTab === 0 ? "#64a1fb" : "#111821"; radius: 12; border.color: currentTab === 0 ? "transparent" : "#1e2c3a"; border.width: 1 }
                            contentItem: Item { anchors.fill: parent
                                Row { spacing: 15; anchors.left: parent.left; anchors.leftMargin: 15; anchors.verticalCenter: parent.verticalCenter
                                    Image { source: "../assets/icons/video_settings_30dp_EFEFEF_FILL0_wght400_GRAD0_opsz24.svg"; sourceSize: Qt.size(20, 20); fillMode: Image.PreserveAspectFit; mipmap: true; anchors.verticalCenter: parent.verticalCenter }
                                    Text { text: "Video"; font.pixelSize: 15; font.bold: currentTab === 0; color: "white"; anchors.verticalCenter: parent.verticalCenter }
                                }
                            }
                        }

                        // 1: CONNECTION
                        Button {
                            Layout.fillWidth: true; Layout.preferredHeight: 55
                            onClicked: mainWindow.tela = "../qml/ConfigConnection.qml"
                            background: Rectangle { color: currentTab === 1 ? "#64a1fb" : "#111821"; radius: 12; border.color: currentTab === 1 ? "transparent" : "#1e2c3a"; border.width: 1 }
                            contentItem: Item { anchors.fill: parent
                                Row { spacing: 15; anchors.left: parent.left; anchors.leftMargin: 15; anchors.verticalCenter: parent.verticalCenter
                                    Image { source: "../assets/icons/broadcast_on_home_30dp_EFEFEF_FILL0_wght400_GRAD0_opsz24.svg"; sourceSize: Qt.size(20, 20); fillMode: Image.PreserveAspectFit; mipmap: true; anchors.verticalCenter: parent.verticalCenter }
                                    Text { text: "Connection"; font.pixelSize: 15; font.bold: currentTab === 1; color: "white"; anchors.verticalCenter: parent.verticalCenter }
                                }
                            }
                        }

                        // 2: GAMEPAD
                        Button {
                            Layout.fillWidth: true; Layout.preferredHeight: 55
                            onClicked: mainWindow.tela = "../qml/ConfigGamepad.qml"
                            background: Rectangle { color: currentTab === 2 ? "#64a1fb" : "#111821"; radius: 12; border.color: currentTab === 2 ? "transparent" : "#1e2c3a"; border.width: 1 }
                            contentItem: Item { anchors.fill: parent
                                Row { spacing: 15; anchors.left: parent.left; anchors.leftMargin: 15; anchors.verticalCenter: parent.verticalCenter
                                    Image { source: "../assets/icons/videogame_asset_30dp_EFEFEF_FILL0_wght400_GRAD0_opsz24.svg"; sourceSize: Qt.size(20, 20); fillMode: Image.PreserveAspectFit; mipmap: true; anchors.verticalCenter: parent.verticalCenter }
                                    Text { text: "Gamepad"; font.pixelSize: 15; font.bold: currentTab === 2; color: "white"; anchors.verticalCenter: parent.verticalCenter }
                                }
                            }
                        }

                        // 3: MACRO
                        Button {
                            Layout.fillWidth: true; Layout.preferredHeight: 55
                            onClicked: mainWindow.tela = "../qml/ConfigMacro.qml"
                            background: Rectangle { color: currentTab === 3 ? "#64a1fb" : "#111821"; radius: 12; border.color: currentTab === 3 ? "transparent" : "#1e2c3a"; border.width: 1 }
                            contentItem: Item { anchors.fill: parent
                                Row { spacing: 15; anchors.left: parent.left; anchors.leftMargin: 15; anchors.verticalCenter: parent.verticalCenter
                                    Image { source: "../assets/icons/keyboard_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"; sourceSize: Qt.size(20, 20); fillMode: Image.PreserveAspectFit; mipmap: true; anchors.verticalCenter: parent.verticalCenter }
                                    Text { text: "Macro"; font.pixelSize: 15; font.bold: currentTab === 3; color: "white"; anchors.verticalCenter: parent.verticalCenter }
                                }
                            }
                        }

                        // 4: ACCOUNT
                        Button {
                            Layout.fillWidth: true; Layout.preferredHeight: 55
                            onClicked: mainWindow.tela = "../qml/ConfigAccount.qml"
                            background: Rectangle { color: currentTab === 4 ? "#64a1fb" : "#111821"; radius: 12; border.color: currentTab === 4 ? "transparent" : "#1e2c3a"; border.width: 1 }
                            contentItem: Item { anchors.fill: parent
                                Row { spacing: 15; anchors.left: parent.left; anchors.leftMargin: 15; anchors.verticalCenter: parent.verticalCenter
                                    Image { source: "../assets/icons/person_30dp_EFEFEF_FILL0_wght400_GRAD0_opsz24.svg"; sourceSize: Qt.size(20, 20); fillMode: Image.PreserveAspectFit; mipmap: true; anchors.verticalCenter: parent.verticalCenter }
                                    Text { text: "Account"; font.pixelSize: 15; font.bold: currentTab === 4; color: "white"; anchors.verticalCenter: parent.verticalCenter }
                                }
                            }
                        }

                        Item { Layout.fillHeight: true }
                    }
                }

                // ==========================================
                // ÁREA CENTRAL (Lista de Macros)
                // ==========================================
                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.margins: 40
                    Layout.alignment: Qt.AlignTop
                    spacing: 20

                    ColumnLayout {
                        visible: currentTab === 3
                        Layout.fillWidth: true
                        Layout.maximumWidth: 600
                        Layout.alignment: Qt.AlignHCenter
                        spacing: 25

                        // ==============================================
                        // COMPONENTE: LINHA DE MACRO
                        // ==============================================
                        Component {
                            id: macroRow
                            RowLayout {
                                Layout.fillWidth: true
                                property string actionText: ""
                                property string shortcutText: ""

                                // Botão de Ação (Azul) - Somente visual
                                Rectangle {
                                    Layout.preferredWidth: 160
                                    Layout.preferredHeight: 35
                                    color: "#64a1fb"
                                    radius: 17
                                    Text {
                                        anchors.centerIn: parent
                                        text: parent.parent.actionText
                                        color: "white"
                                        font.pixelSize: 13
                                        font.bold: true
                                    }
                                }

                                Item { Layout.preferredWidth: 20 }

                                // Visor do Atalho (Interativo)
                                Rectangle {
                                    id: shortcutBg
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: 35
                                    radius: 5

                                    property bool isRecording: false

                                    color: isRecording ? "#2a3545" : "#1e2c3a"
                                    border.color: isRecording ? "#64a1fb" : "transparent"
                                    border.width: isRecording ? 2 : 0

                                    Text {
                                        anchors.centerIn: parent
                                        text: shortcutBg.isRecording ? "Pressione a nova combinação..." : parent.parent.shortcutText
                                        color: shortcutBg.isRecording ? "#64a1fb" : "white"
                                        font.pixelSize: 13
                                        font.bold: true
                                    }

                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: {
                                            shortcutBg.isRecording = true
                                            shortcutBg.forceActiveFocus()
                                        }
                                    }

                                    Keys.onPressed: (event) => {
                                                        if (!shortcutBg.isRecording) return;

                                                        if (event.key === Qt.Key_Control || event.key === Qt.Key_Shift || event.key === Qt.Key_Alt || event.key === Qt.Key_Meta) {
                                                            return;
                                                        }

                                                        let modStr = "";
                                                        if (event.modifiers & Qt.ControlModifier) modStr += "CTRL+";
                                                        if (event.modifiers & Qt.AltModifier) modStr += "ALT+";
                                                        if (event.modifiers & Qt.ShiftModifier) modStr += "SHIFT+";

                                                        let keyStr = "";
                                                        if (event.key === Qt.Key_Escape) keyStr = "ESC";
                                                        else if (event.key === Qt.Key_Tab) keyStr = "TAB";
                                                        else if (event.key === Qt.Key_Backspace) keyStr = "BACKSPACE";
                                                        else if (event.key === Qt.Key_Enter || event.key === Qt.Key_Return) keyStr = "ENTER";
                                                        else if (event.key === Qt.Key_Space) keyStr = "SPACE";
                                                        else if (event.key === Qt.Key_Delete) keyStr = "DEL";
                                                        else if (event.key === Qt.Key_End) keyStr = "END";
                                                        else if (event.key >= Qt.Key_F1 && event.key <= Qt.Key_F12) keyStr = "F" + (event.key - Qt.Key_F1 + 1);
                                                        else {
                                                            keyStr = String.fromCharCode(event.key);
                                                        }

                                                        parent.parent.shortcutText = modStr + keyStr;
                                                        shortcutBg.isRecording = false;
                                                        event.accepted = true;
                                                    }

                                    onFocusChanged: {
                                        if (!focus) shortcutBg.isRecording = false;
                                    }
                                }
                            }
                        }

                        // ==============================================
                        // PREENCHENDO A LISTA DE MACROS
                        // ==============================================
                        Loader { sourceComponent: macroRow; Layout.fillWidth: true; onLoaded: { item.actionText = "Desconectar"; item.shortcutText = "CTRL+ALT+GRAVE" } }
                        Loader { sourceComponent: macroRow; Layout.fillWidth: true; onLoaded: { item.actionText = "Menu"; item.shortcutText = "CTRL+SHIFT+M" } }
                        Loader { sourceComponent: macroRow; Layout.fillWidth: true; onLoaded: { item.actionText = "Chat"; item.shortcutText = "CTRL+SHIFT+C" } }
                        Loader { sourceComponent: macroRow; Layout.fillWidth: true; onLoaded: { item.actionText = "Alternação, exibição"; item.shortcutText = "CTRL+SHIFT+D" } }
                        Loader { sourceComponent: macroRow; Layout.fillWidth: true; onLoaded: { item.actionText = "Enviar CTRL+ALT+DEL"; item.shortcutText = "CTRL+SHIFT+END" } }
                        Loader { sourceComponent: macroRow; Layout.fillWidth: true; onLoaded: { item.actionText = "Modo janela"; item.shortcutText = "CTRL+SHIFT+W" } }
                    }

                    Text {
                        visible: currentTab !== 3
                        text: "Configurações de " + (currentTab === 0 ? "Vídeo" : currentTab === 1 ? "Conexão" : currentTab === 2 ? "Gamepad" : "Conta")
                        color: "#a0aab5"
                        font.pixelSize: 18
                        Layout.alignment: Qt.AlignCenter
                    }

                    Item { Layout.fillHeight: true }
                }
            }
        }
    }
}