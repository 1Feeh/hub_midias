import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Vectra


Window {
    width: 800
    height: 640
    visible: true
    title: "Vectra"
    color: "red" // Cor de fundo ajustada com base no protótipo

    RowLayout {
        anchors.fill: parent
        spacing: 0

        // --- SIDEBAR (ESQUERDA) ---
        Rectangle {
            id: sidebar
            Layout.preferredWidth: 350
            Layout.fillHeight: parent
            color: Colors.dark_blue // Fundo escuro idêntico ao protótipo

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 35
                spacing: 15

                // --- Seção QR Code ---
                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 8

                    Text {
                        text: "Scaneie com app mobile"
                        color: "white"
                        font.pixelSize: 14
                        Layout.alignment: Qt.AlignHCenter
                    }

                    // Linha divisória fina abaixo do texto do QR Code
                    Rectangle {
                        Layout.fillWidth: true
                        height: 1
                        color: "#334155"
                    }

                    Item { height: 5 } // Pequeno espaçador

                    Rectangle {
                        width: 130; height: 130
                        color: "white"
                        Layout.alignment: Qt.AlignHCenter

                        Image {
                            anchors.fill: parent
                            anchors.margins: 6
                            // Caminho do seu QR Code local
                            source: "../assets/icons/adobe-express-qr-code1.png"
                            fillMode: Image.PreserveAspectFit
                        }
                    }
                }

                Item { height: 10 } // Espaçador

                // --- Seção Título Login ---
                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 8

                    Text {
                        text: "Login"
                        color: "white"
                        font.pixelSize: 22
                        Layout.alignment: Qt.AlignHCenter
                    }

                    // Linha divisória fina abaixo do Login
                    Rectangle {
                        Layout.fillWidth: true
                        height: 1
                        color: "#334155"
                    }
                }

                Item { height: 10 } // Espaçador

                // --- FORMULÁRIO (INPUTS) ---
                // Campo de E-mail
                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 6

                    Text {
                        text: "E-mail"
                        color: "#E2E8F0"
                        font.pixelSize: 14
                        Layout.alignment: Qt.AlignHCenter
                    }

                    TextField {
                        id: emailField
                        placeholderText: "example@mail.com"
                        placeholderTextColor: "#64748B"
                        Layout.fillWidth: true
                        height: 35
                        color: "white"
                        leftPadding: 10
                        rightPadding: 35

                        background: Rectangle {
                            color: "#1E293B"
                            radius: 0 // Quadrado igual ao protótipo
                        }

                        // Ícone do Email posicionado à direita
                        Image {
                            source: "../assets/icons/Email.png"
                            width: 18
                            height: 14
                            fillMode: Image.PreserveAspectFit
                            anchors.right: parent.right
                            anchors.rightMargin: 10
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                }

                // Campo de Senha
                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 6

                    Text {
                        text: "Password"
                        color: "#E2E8F0"
                        font.pixelSize: 14
                        Layout.alignment: Qt.AlignHCenter
                    }

                    TextField {
                        id: passwordField
                        placeholderText: "****************"
                        placeholderTextColor: "#64748B"
                        echoMode: TextInput.Password
                        Layout.fillWidth: true
                        height: 35
                        color: "white"
                        leftPadding: 10
                        rightPadding: 35

                        background: Rectangle {
                            color: "#1E293B"
                            radius: 0 // Quadrado igual ao protótipo
                        }

                        // Ícone do Olho posicionado à direita
                        Image {
                            source: "../assets/icons/OlhoPassword.png"
                            width: 20
                            height: 14
                            fillMode: Image.PreserveAspectFit
                            anchors.right: parent.right
                            anchors.rightMargin: 10
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                }

                // Esqueci a senha
                Text {
                    text: "Forgot password?"
                    color: "#3b82f6"
                    font.underline: true
                    font.pixelSize: 14
                    Layout.alignment: Qt.AlignHCenter

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            console.log("Forgot password clicked!")
                        }
                    }
                }

                Item { Layout.fillHeight: true } // Espaçador que empurra os botões para baixo

                // --- BOTÕES (IDÊNTICOS) ---
                // Botão Login
                Button {
                    id: loginBtn
                    text: "Login"
                    Layout.fillWidth: true
                    implicitHeight: 50

                    contentItem: Text {
                        text: parent.text
                        color: "white"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pixelSize: 18
                    }
                    background: Rectangle {
                        color: loginBtn.pressed ? "#2563eb" : "#5897f7"
                        radius: 10
                    }
                }

                // Botão Create Account
                Button {
                    id: createAccountBtn
                    text: "Create account"
                    Layout.fillWidth: true
                    implicitHeight: 50

                    contentItem: Text {
                        text: parent.text
                        color: "white"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pixelSize: 18
                    }
                    background: Rectangle {
                        color: createAccountBtn.pressed ? "#2563eb" : "#5897f7"
                        radius: 10
                    }
                }
            }
        }

        // --- ÁREA PRINCIPAL (DIREITA) ---
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: parent
            color: "#111E30" // Cor azul do fundo da direita conforme o protótipo

            // Imagem do seu Logo "V" centralizada perfeitamente
            Image {
                id: logoView
                // Seu caminho local do Windows configurado com o protocolo file:///
                source: "../assets/icons/Vector.png"
                anchors.centerIn: parent
                width: 450  // Ajuste o tamanho padrão para exibição aqui se necessário
                height: 450
                fillMode: Image.PreserveAspectFit
            }
        }
    }
}