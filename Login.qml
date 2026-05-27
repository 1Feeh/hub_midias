import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: loginScreen
    anchors.fill: parent
    color: "#0b1016" // Cor de fundo principal escura

    RowLayout {
        anchors.fill: parent
        spacing: 0

        // ==========================================
        // PAINEL DE LOGIN (Esquerdo)
        // ==========================================
        Rectangle {
            Layout.preferredWidth: 320
            Layout.fillHeight: true
            color: "#0b1016"
            border.color: "#1e2c3a"

            ScrollView {
                anchors.fill: parent
                clip: true
                contentWidth: availableWidth
                // Esconde a barra de rolagem visualmente
                ScrollBar.vertical.policy: ScrollBar.AlwaysOff

                ColumnLayout {
                    width: parent.width
                    spacing: 12

                    Item { Layout.preferredHeight: 20 }

                    Text {
                        text: "Scaneie com app mobile"
                        color: "#a0aab5"
                        font.pixelSize: 14
                        Layout.alignment: Qt.AlignHCenter
                    }

                    Rectangle { Layout.fillWidth: true; Layout.leftMargin: 25; Layout.rightMargin: 25; height: 1; color: "#3d4e63" }

                    // Imagem do QR Code (Atualizado para PNG)
                    Image {
                        source: "assets/Icons/adobe-express-qr-code1.png"
                        Layout.preferredWidth: 150; Layout.preferredHeight: 150
                        Layout.alignment: Qt.AlignHCenter
                        fillMode: Image.PreserveAspectFit; mipmap: true
                    }

                    Text {
                        text: "Login"
                        color: "white"
                        font.pixelSize: 26; font.bold: true
                        Layout.alignment: Qt.AlignHCenter
                        Layout.topMargin: 10
                    }

                    Rectangle { Layout.fillWidth: true; Layout.leftMargin: 25; Layout.rightMargin: 25; height: 1; color: "#3d4e63" }

                    // --- CAMPOS DE FORMULÁRIO ---

                    // E-MAIL
                    Text { text: "E-mail"; color: "white"; font.pixelSize: 14; Layout.leftMargin: 25; Layout.topMargin: 10 }
                    Rectangle {
                        Layout.fillWidth: true; Layout.preferredHeight: 38; Layout.leftMargin: 25; Layout.rightMargin: 25
                        color: "#1a2636"; radius: 8
                        RowLayout {
                            anchors.fill: parent; anchors.leftMargin: 15; anchors.rightMargin: 15

                            TextField {
                                Layout.fillWidth: true
                                placeholderText: "example@email.com"
                                placeholderTextColor: "#a0aab5"
                                color: "white"
                                font.pixelSize: 14
                                background: Item {} // Remove o fundo branco padrão
                                leftPadding: 0
                            }

                            // Ícone de E-mail atualizado
                            Image { source: "assets/Icons/mail_30dp_EFEFEF_FILL0_wght400_GRAD0_opsz24.svg"; sourceSize: Qt.size(20, 20); fillMode: Image.PreserveAspectFit; mipmap: true }
                        }
                    }

                    // PASSWORD
                    Text { text: "Password"; color: "white"; font.pixelSize: 14; Layout.leftMargin: 25; Layout.topMargin: 5 }
                    Rectangle {
                        Layout.fillWidth: true; Layout.preferredHeight: 38; Layout.leftMargin: 25; Layout.rightMargin: 25
                        color: "#1a2636"; radius: 8
                        RowLayout {
                            anchors.fill: parent; anchors.leftMargin: 15; anchors.rightMargin: 15

                            TextField {
                                id: passwordInput
                                Layout.fillWidth: true
                                placeholderText: "Sua senha aqui..."
                                placeholderTextColor: "#a0aab5"
                                color: "white"
                                font.pixelSize: 14
                                echoMode: TextInput.Password // Esconde a senha com bolinhas
                                background: Item {}
                                leftPadding: 0
                            }

                            // Ícone do olho (Visibility Toggle) atualizado
                            Image {
                                id: eyeIcon
                                source: "assets/Icons/visibility_30dp_EFEFEF_FILL0_wght400_GRAD0_opsz24.svg"
                                sourceSize: Qt.size(20, 20); fillMode: Image.PreserveAspectFit; mipmap: true
                                MouseArea {
                                    anchors.fill: parent; cursorShape: Qt.PointingHandCursor
                                    onClicked: {
                                        if (passwordInput.echoMode === TextInput.Password) {
                                            passwordInput.echoMode = TextInput.Normal
                                        } else {
                                            passwordInput.echoMode = TextInput.Password
                                        }
                                    }
                                }
                                onStatusChanged: if (eyeIcon.status === Image.Error) eyeIcon.source = "assets/Icons/keyboard_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                            }
                        }
                    }

                    Text {
                        text: "Forgot password?"; color: "#64a1fb"; font.pixelSize: 14
                        Layout.alignment: Qt.AlignHCenter; Layout.topMargin: 10
                        MouseArea { anchors.fill: parent; cursorShape: Qt.PointingHandCursor }
                    }

                    // --- BOTÕES DE AÇÃO ---
                    Button {
                        Layout.fillWidth: true; Layout.preferredHeight: 40; Layout.leftMargin: 25; Layout.rightMargin: 25; Layout.topMargin: 10
                        background: Rectangle { color: "#64a1fb"; radius: 12 }
                        contentItem: Text { text: "Login"; color: "white"; font.bold: true; verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter }
                        onClicked: {
                        // Altere "Home.qml" se o nome do seu arquivo for diferente (ex: "MainHome.qml")
                            loginScreen.StackView.view.push("Home.qml")
                        }
                    }

                    Button {
                        Layout.fillWidth: true; Layout.preferredHeight: 40; Layout.leftMargin: 25; Layout.rightMargin: 25
                        background: Rectangle { color: "#64a1fb"; radius: 12 }
                        contentItem: Text { text: "Create account"; color: "white"; font.bold: true; verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter }
                    }

                    Item { Layout.preferredHeight: 30 }
                }
            }
        }

        // ==========================================
        // ÁREA DA MARCA (Direita)
        // ==========================================
        Rectangle {
            Layout.fillWidth: true; Layout.fillHeight: true; color: "#0b1016"

            Item {
                anchors.centerIn: parent
                width: Math.min(parent.width * 0.45, 450)
                height: width

                // Imagem do Logo principal atualizada para Vector.png
                Image {
                    id: brandLogo
                    source: "assets/Icons/Vector.png"
                    anchors.fill: parent
                    sourceSize: Qt.size(width, height)
                    fillMode: Image.PreserveAspectFit; mipmap: true
                    z: 2
                }

                // Sombra oval no chão
                Rectangle {
                    anchors.top: brandLogo.bottom
                    anchors.topMargin: -30
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: brandLogo.width * 0.6
                    height: 25
                    color: "#05070a"
                    radius: 12.5
                    opacity: 0.8
                    z: 1
                }
            }
        }
    }
}
