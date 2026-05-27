import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    id: mainWindow
    width: 1280
    height: 720
    visible: true
    title: "Meu Aplicativo"

    StackView {
        id: mainStack
        anchors.fill: parent
        initialItem: "Login.qml"

        // ==========================================
        // ANIMAÇÕES DE TRANSIÇÃO (Suave / Fade)
        // ==========================================

        // Animação para quando usar o comando "replace()" (Navegação da Sidebar)
        replaceEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 200 // Duração em milissegundos
            }
        }
        replaceExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 200
            }
        }

        // Animação para quando usar o comando "push()"
        pushEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 200
            }
        }
        pushExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 200
            }
        }

        // Animação para quando usar o comando "pop()"
        popEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 200
            }
        }
        popExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 200
            }
        }
    }
}
