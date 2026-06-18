import QtQuick 2.15
import QtQuick.Effects

Item {
    anchors.fill: parent
    Rectangle{
        id: fundo
        anchors.fill: parent
        color: Colors.cadus_blue

        //menu lateral principal ===================================
        Rectangle{
            id: lateral
            anchors.left: fundo.left
            width: 300
            height: fundo.height
            color: Colors.dark_blue
            //Botoes principais ====================================
            Row {
                id: botoes
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 30
                anchors.top: parent.top
                anchors.topMargin: 10
                property int selecionado: 0

                // desktop
                Rectangle {
                    id: desktop
                    width: 50
                    height: 50
                    radius: 8
                    color: botoes.selecionado === 0 ? Colors.vibrance_blue : "transparent"
                    Image {
                        anchors.centerIn: parent
                        width: 35
                        height: 35
                        sourceSize.width: 35
                        sourceSize.height: 35
                        source: "../assets/icons/desktop_windows.svg"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            botoes.selecionado = 0
                            lateral.bara_lateral_itens = 0
                        }
                        cursorShape: Qt.PointingHandCursor
                    }
                }
                //friend add
                Rectangle {
                    id: friendadd
                    width: 50
                    height: 50
                    radius: 8
                    color: botoes.selecionado === 1 ? Colors.vibrance_blue : "transparent"
                    Image {
                        anchors.centerIn: parent
                        width: 35
                        height: 35
                        sourceSize.width: 35
                        sourceSize.height: 35
                        source: "../assets/icons/friend_add.svg"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            botoes.selecionado = 1
                            lateral.bara_lateral_itens = 1
                        }
                        cursorShape: Qt.PointingHandCursor
                    }
                }
                //setings
                Rectangle {
                    id: settings
                    width: 50
                    height: 50
                    radius: 8
                    color: botoes.selecionado === 2 ? Colors.vibrance_blue : "transparent"
                    Image {
                        anchors.centerIn: parent
                        width: 35
                        height: 35
                        sourceSize.width: 35
                        sourceSize.height: 35
                        source: "../assets/icons/settings.svg"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            botoes.selecionado = 2
                            lateral.bara_lateral_itens = 2
                        }
                        cursorShape: Qt.PointingHandCursor
                    }
                }
            }
            //Conteudo que sera modificado na barra lateral ====================================
            property int bara_lateral_itens: 0 // 0 , 1 , e 2
            property int conf_selecionada: 0
            Loader{
                anchors.top: botoes.bottom
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                sourceComponent: {
                    if (lateral.bara_lateral_itens === 0) return column_desktop
                    if (lateral.bara_lateral_itens === 1) return column_friends
                    if (lateral.bara_lateral_itens === 2) return column_settings
                    return null
                }
            }
            Component {
                //codigo settings
                id: column_settings

                Column{
                    id: colula
                    anchors.fill: parent
                    spacing: 5
                    Text {
                        id: text_amigos
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: qsTr("Configuracoes")
                        color: "white"; font.pixelSize: 20; font.bold: false;
                    }
                    Item { // espassador
                        width: parent.width
                        height: 10
                    }
                    Rectangle{
                        width: parent.width - 20
                        height: 1
                        color: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    //config video
                    Rectangle{
                        width: parent.width - 20
                        height: 80
                        anchors.horizontalCenter: parent.horizontalCenter
                        radius: 20
                        color: Colors.medium_blue
                        Image {
                            id: image_video
                            width: 35
                            height: 35
                            sourceSize.width: 35
                            sourceSize.height: 35
                            anchors.left: parent.left
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.leftMargin: 10
                            source: "../assets/icons/display_settings.svg"
                        }
                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: image_video.right
                            anchors.leftMargin: 10
                            text: qsTr("Video")
                            color: "white"; font.pixelSize: 25; font.bold: false;
                        }
                        MouseArea{
                            anchors.fill: parent
                            onClicked: lateral.conf_selecionada = 0
                            cursorShape: Qt.PointingHandCursor
                        }
                    }
                    //config coneccao
                    Rectangle{
                        width: parent.width - 20
                        height: 80
                        anchors.horizontalCenter: parent.horizontalCenter
                        radius: 20
                        color: Colors.medium_blue
                        Image {
                            id: image_coneccao
                            width: 35
                            height: 35
                            sourceSize.width: 35
                            sourceSize.height: 35
                            anchors.left: parent.left
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.leftMargin: 10
                            source: "../assets/icons/conection.svg"
                        }
                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: image_coneccao.right
                            anchors.leftMargin: 10
                            text: qsTr("Conecção")
                            color: "white"; font.pixelSize: 25; font.bold: false;
                        }
                        MouseArea{
                            anchors.fill: parent
                            onClicked: lateral.conf_selecionada = 1
                            cursorShape: Qt.PointingHandCursor
                        }
                    }
                    //config gamepad
                    Rectangle{
                        width: parent.width - 20
                        height: 80
                        anchors.horizontalCenter: parent.horizontalCenter
                        radius: 20
                        color: Colors.medium_blue
                        Image {
                            id: image_gamepad
                            width: 35
                            height: 35
                            sourceSize.width: 35
                            sourceSize.height: 35
                            anchors.left: parent.left
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.leftMargin: 10
                            source: "../assets/icons/conf_control.svg"
                        }
                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: image_gamepad.right
                            anchors.leftMargin: 10
                            text: qsTr("Gamepad")
                            color: "white"; font.pixelSize: 25; font.bold: false;
                        }
                        MouseArea{
                            anchors.fill: parent
                            onClicked: lateral.conf_selecionada = 2
                            cursorShape: Qt.PointingHandCursor
                        }
                    }
                    //config macro
                    Rectangle{
                        width: parent.width - 20
                        height: 80
                        anchors.horizontalCenter: parent.horizontalCenter
                        radius: 20
                        color: Colors.medium_blue
                        Image {
                            id: image_macro
                            width: 35
                            height: 35
                            sourceSize.width: 35
                            sourceSize.height: 35
                            anchors.left: parent.left
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.leftMargin: 10
                            source: "../assets/icons/keyboard.svg"
                        }
                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: image_macro.right
                            anchors.leftMargin: 10
                            text: qsTr("Atalhos")
                            color: "white"; font.pixelSize: 25; font.bold: false;
                        }
                        MouseArea{
                            anchors.fill: parent
                            onClicked: lateral.conf_selecionada = 3
                            cursorShape: Qt.PointingHandCursor
                        }
                    }
                    //config conta
                    Rectangle{
                        width: parent.width - 20
                        height: 80
                        anchors.horizontalCenter: parent.horizontalCenter
                        radius: 20
                        color: Colors.medium_blue
                        Image {
                            id: image_conta
                            width: 35
                            height: 35
                            sourceSize.width: 35
                            sourceSize.height: 35
                            anchors.left: parent.left
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.leftMargin: 10
                            source: "../assets/icons/person.svg"
                        }
                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: image_conta.right
                            anchors.leftMargin: 10
                            text: qsTr("Conta")
                            color: "white"; font.pixelSize: 25; font.bold: false;
                        }
                        MouseArea{
                            anchors.fill: parent
                            onClicked: lateral.conf_selecionada = 4
                            cursorShape: Qt.PointingHandCursor
                        }
                    }
                }
            }
            Component {
                //codigo friends
                id: column_friends
                Column{
                    id: colula
                    anchors.fill: parent
                    spacing: 5
                    Text {
                        id: text_amigos
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: qsTr("Amigos")
                        color: "white"; font.pixelSize: 20; font.bold: false;
                    }
                    Item { // espassador
                        width: parent.width
                        height: 10
                    }
                    Rectangle{
                        width: parent.width - 20
                        height: 1
                        color: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Rectangle{
                        width: parent.width - 20
                        height: 80
                        anchors.horizontalCenter: parent.horizontalCenter
                        radius: 20
                        color: Colors.medium_blue
                        Text {
                            id: nome_friend
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            text: "Fulano"
                            color: "white"; font.pixelSize: 20; font.bold: true;
                        }
                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.top: nome_friend.bottom
                            anchors.leftMargin: 10
                            text: "ID: 1234567890"
                            color: "white"; font.pixelSize: 10; font.bold: false;
                        }
                        Image {
                            width: 25
                            height: 25
                            sourceSize.width: 25
                            sourceSize.height: 25
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.rightMargin: 20
                            source: "../assets/icons/del_friend.svg"
                        }
                    }
                }
            }
            Component {
                //codigo desktop
                id: column_desktop
                Column{
                    id: colula
                    anchors.fill: parent
                    spacing: 10

                    /*Text {
                        id: text_amigos
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: qsTr("Hosts")
                        color: "white"; font.pixelSize: 20; font.bold: false;
                    }
                    Item { // espassador
                        width: parent.width
                        height: 10
                    }
                    Rectangle{
                        width: parent.width - 20
                        height: 1
                        color: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }*/

                    // textos e linhas conectados =========================================
                    Text {
                        id: conected
                        text: qsTr("Hosts disponiveis")
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: "white" ; font.pixelSize: 20; font.bold: false;
                    }
                    Rectangle{
                        width: parent.width - 20
                        height: 1
                        color: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.topMargin: 5
                    }

                    // card de conexao ============================================================================================================
                    Rectangle{
                        //property int card_info: 0 // conteudo a ser carregado cards #########################
                        id: desktopcard
                        width: parent.width-20
                        height: 80
                        anchors.horizontalCenter: parent.horizontalCenter
                        radius: 20
                        color: Colors.medium_blue
                        Image {
                            id: imagedesktop
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            width: 35
                            height: 35
                            sourceSize.width: 35
                            sourceSize.height: 35
                            source: "../assets/icons/desktop_windows.svg"
                        }
                        Text {
                            id: nome
                            text: "Fulano"
                            color: "white"; font.pixelSize: 20; font.bold: true;
                            anchors.left: imagedesktop.right
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.verticalCenterOffset: -10 //ajusta vertical com base no parametro
                        }
                        Text {
                            id: nomeid
                            text: "ID: 1234567890"
                            color: "white"; font.pixelSize: 10; font.bold: false;
                            anchors.left: imagedesktop.right
                            anchors.top: nome.bottom
                        }
                        //Loader dos estados de conexao
                        property int card_info: 0// conteudo a ser carregado cards #########################
                        Loader{
                            anchors.right: parent.right
                            width: 120
                            height: parent.height
                            sourceComponent: {
                                if (desktopcard.card_info === 0) return card_comp0
                                if (desktopcard.card_info === 1) return card_comp1
                                if (desktopcard.card_info === 2) return card_comp2
                                if (desktopcard.card_info === 3) return card_comp3
                                return null
                            }
                        }
                        MouseArea{ /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                            anchors.fill: parent
                            onClicked: Controller.conectar(/*"100.90.54.100"*/"100.102.133.24")
                        }

                        Component {
                            id: card_comp0
                            //codigo do 0 aqui
                            Item {
                                anchors.right: parent.right
                                width: 120
                                height: parent.height
                            }
                        }
                        Component {
                            id: card_comp1
                            //codigo do 1 aqui
                            Item {
                                anchors.right: parent.right
                                width: 120
                                height: parent.height
                                Row{
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    Image {
                                        id: button_yes
                                        width: 25
                                        height: 25
                                        sourceSize.width: 25
                                        sourceSize.height: 25
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.right: button_no.left
                                        anchors.rightMargin: 10
                                        source: "../assets/icons/check_circle.svg"
                                    }

                                    MultiEffect { // efeitos do import QtQuick.Effects
                                        source: button_yes
                                        anchors.fill: button_yes
                                        colorization: 1.0
                                        colorizationColor: "green"
                                    }
                                    Image {
                                        id: button_no
                                        width: 25
                                        height: 25
                                        sourceSize.width: 25
                                        sourceSize.height: 25
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.right: parent.left
                                        anchors.rightMargin: 10
                                        source: "../assets/icons/cancelar.svg"
                                    }

                                    MultiEffect { // efeitos do import QtQuick.Effects
                                        source: button_no
                                        anchors.fill: button_no
                                        colorization: 1.0
                                        colorizationColor: "red"
                                    }
                                }
                            }
                        }
                        Component {
                            id: card_comp2
                            //codigo do 2 aqui
                            Item{
                                anchors.right: parent.right
                                width: 120
                                height: parent.height
                                Image {
                                    id: logout
                                    width: 25
                                    height: 25
                                    sourceSize.width: 25
                                    sourceSize.height: 25
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: column_disp.left
                                    anchors.rightMargin: 10
                                    source: "../assets/icons/logout.svg"

                                }
                                MultiEffect { // efeitos do import QtQuick.Effects
                                    source: logout
                                    anchors.fill: logout
                                    colorization: 1.0
                                    colorizationColor: "yellow"
                                }
                                Column{
                                    id: column_disp
                                    anchors.right: parent.right
                                    anchors.rightMargin: 15
                                    anchors.verticalCenter: parent.verticalCenter
                                    spacing: 2

                                    Image {
                                        width: 25
                                        height: 25
                                        sourceSize.width: 25
                                        sourceSize.height: 25
                                        source: "../assets/icons/controller.svg"
                                    }
                                    Image {
                                        width: 25
                                        height: 25
                                        sourceSize.width: 25
                                        sourceSize.height: 25
                                        source: "../assets/icons/keyboard.svg"
                                    }
                                    Image {
                                        width: 25
                                        height: 25
                                        sourceSize.width: 25
                                        sourceSize.height: 25
                                        source: "../assets/icons/mouse.svg"
                                    }
                                }
                            }
                        }
                        Component {
                            id: card_comp3
                            //codigo do 3 aqui
                            Item{
                                anchors.right: parent.right
                                width: 120
                                height: parent.height
                                Image {
                                    id: logout
                                    width: 25
                                    height: 25
                                    sourceSize.width: 25
                                    sourceSize.height: 25
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 10
                                    source: "../assets/icons/logout.svg"
                                    MouseArea{
                                        anchors.fill: parent
                                        onClicked: Controller.desconectar()

                                    }
                                }
                                MultiEffect { // efeitos do import QtQuick.Effects
                                    source: logout
                                    anchors.fill: logout
                                    colorization: 1.0
                                    colorizationColor: "red"
                                }
                            }
                        }
                    }

                    // textos e linhas Hosts disponiveis ================================================================================================
                    Text {
                        id: hosts
                        text: qsTr("Hosts OFF")
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: "white" ; font.pixelSize: 20; font.bold: false;
                    }
                    Rectangle{
                        width: parent.width - 20
                        height: 1
                        color: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.topMargin: 5
                    }
                }
            }
        }
        //Area da direta de conteudos ===============================================================
        Loader{
            anchors.top: fundo.top
            //anchors.topMargin: 10
            anchors.left: lateral.right
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            source: {
                if (botoes.selecionado === 0) return "../qml/HomeScreen.qml"
                if (botoes.selecionado === 1) return "../qml/Friends.qml"
                //config janelas
                if (lateral.conf_selecionada === 0) return "../qml/CVideo.qml"
                if (lateral.conf_selecionada === 1) return "../qml/CConnection.qml"
                if (lateral.conf_selecionada === 2) return "../qml/CGamepad.qml"
                if (lateral.conf_selecionada === 3) return "../qml/CMacro.qml"
                if (lateral.conf_selecionada === 4) return "../qml/CAccount.qml"
                return ""
            }
        }
    }
}