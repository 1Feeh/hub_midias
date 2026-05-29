import QtQuick 2.15

Rectangle{
    id: fundo_direita
    //anchors.fill: parent
    height: 1000
    width: 1000
    color: "transparent"
    //Card de Perfil =============================================================
    Rectangle{
        width: 200
        height: 80
        color: Colors.dark_blue
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.rightMargin: 10
        radius: 20
        Image {
            id: profile
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 10
            anchors.rightMargin: 10
            width: 35
            height: 35
            sourceSize.width: 35
            sourceSize.height: 35
            source: "../assets/icons/person.svg"
        }
        Text {
            id: idname
            anchors.left: profile.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -10
            text: "Dick Vigarista"
            color: "white"; font.pixelSize: parent.width / 10; font.bold: true;
        }
        Text {
            id: iduser
            anchors.top: idname.bottom
            anchors.left: profile.right
            text: "ID: 2345678901"
            color: "white"; font.pixelSize: 12; font.bold: false;
        }
    }
    //Tela de saida de video ====================================================================
    Rectangle{
        width: parent.width - 50
        height: parent.height - 300
        color: "black"
        anchors.centerIn: parent
        Image {
            id: full_screen
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.leftMargin: 5
            anchors.bottomMargin: 5
            width: 35
            height: 35
            sourceSize.width: 35
            sourceSize.height: 35
            source: "../assets/icons/fullscreen.svg"
        }
    }
}