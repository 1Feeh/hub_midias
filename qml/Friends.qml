import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    anchors.fill: parent
    Rectangle{
        id: search_zone
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width - 20
        height: 50
        color: "black"
        opacity: 1
        radius: 20
        Image {
            width: 40
            height: 40
            sourceSize.width: 40
            sourceSize.height: 40
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.verticalCenter: parent.verticalCenter
            source: "../assets/icons/search.svg"
            MouseArea{
                anchors.fill: parent
                onClicked: console.log("peleleca")
            }
        }
    }
    ScrollView {
        anchors.top: search_zone.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.topMargin: 10
        contentWidth: width
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

        Column {
            width: parent.width
            spacing: 10
            anchors.topMargin: 10

            // card de amigo
            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width - 40
                height: 70
                color: Colors.dark_blue
                opacity: 0.5
                radius: 20

                Image {
                    id: icon_person
                    width: 40
                    height: 40
                    sourceSize.width: 40
                    sourceSize.height: 40
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    anchors.verticalCenter: parent.verticalCenter
                    source: "../assets/icons/person.svg"
                }
                Text {
                    id: user_name
                    anchors.left: icon_person.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: - 10
                    text: "Fulano"
                    color: "white"; font.pixelSize: 20; font.bold: true
                }
                Text {
                    id: name
                    anchors.left: icon_person.right
                    anchors.top: user_name.bottom
                    color: "white"; font.pixelSize: 10; font.bold: false
                    text: qsTr("ID: 1234567890")
                }
                Image {
                    width: 40
                    height: 40
                    sourceSize.width: 40
                    sourceSize.height: 40
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    source: "../assets/icons/friend_add.svg"

                    MouseArea {
                        anchors.fill: parent
                        onClicked: console.log("xoxota")
                    }
                }
            }
            // mais cards aqui
        }
    }
}