import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: fundo
    anchors.fill: parent

    Rectangle{
        width: 400
        height: 200
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
        color: Colors.dark_blue
        radius: 20
        //Item com as informacoes do usuario
        Item {
            width: parent.width - 10
            height: parent.height - 80
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter

            Image {
                id: profile_image
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 10
                width: 100
                height: 100
                sourceSize.width: 100
                sourceSize.height: 100
                source: "../assets/icons/person.svg"
            }
            Text {
                id: username
                anchors.left: profile_image.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: - 30
                text: qsTr("Username: Dick Vigarista")
                color: "white"; font.pixelSize: 20; font.bold: false;
            }
            Text {
                id: user_id
                anchors.left: profile_image.right
                anchors.top: username.bottom
                anchors.topMargin: 5
                text: qsTr("ID: 2345678901")
                color: "white"; font.pixelSize: 15;
            }

            Text {
                id: user_email
                anchors.left: profile_image.right
                anchors.top: user_id.bottom
                anchors.topMargin: 5
                text: qsTr("example@email.com")
                color: "white"; font.pixelSize: 12;
            }
        }
        //botao redefinir senha
        Rectangle{
            id: reset_password
            width: 100
            height: 50
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.leftMargin: 10
            anchors.bottomMargin: 10
            color: Colors.vibrance_blue
            radius: 20
            Text {
                anchors.centerIn: parent
                text: qsTr("Redefinir senha")
                color: "white"; font.pixelSize: 12; font.bold: true;
            }
            MouseArea{
                anchors.fill: parent
                onClicked: console.log("Redefinir senha")
            }
        }
        //botao sair da conta
        Rectangle{
            id: exit_account
            width: 80
            height: 50
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 10
            anchors.bottomMargin: 10
            radius: 20
            color: "red"
            Text {
                anchors.centerIn: parent
                text: qsTr("Sair")
                color: "white"; font.pixelSize: 12; font.bold: true;
            }
            MouseArea{
                anchors.fill: parent
                onClicked: console.log("Sair")
            }
        }
    }
}