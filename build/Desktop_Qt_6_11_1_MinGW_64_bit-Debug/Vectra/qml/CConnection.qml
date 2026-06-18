import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ScrollView {
    anchors.fill: parent
    contentWidth: width
    contentHeight: coluna.height + 10  // altura do conteudo interno
    ScrollBar.horizontal.policy: ScrollBar.AlwaysOff



    //Modelo de botoes a serem ciados e usados/acessados ======================================
    Column{
        id: coluna
        width: parent.width - 20
        spacing: 5
        anchors.topMargin: 10

        Text {
            text: qsTr("Configurações de Conecção")
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white" ; font.pixelSize: 30; font.bold: false;
        }
        Rectangle{
            width: parent.width - 20
            height: 1
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Item { width: parent.width; height: 10 }

        //bitrate transmissao
        Rectangle {
            width: parent.width - 10
            height: Math.max(60, row3.implicitHeight + 20)
            color: Colors.medium_blue
            anchors.horizontalCenter: parent.horizontalCenter
            radius: 10
            border.width: 1
            border.color: Colors.dark_blue

            RowLayout {
                id: row3
                width: parent.width
                anchors.verticalCenter: parent.verticalCenter

                Text {
                    Layout.fillWidth: true  // ocupa todo espaco que sobrar
                    Layout.leftMargin: 10
                    Layout.rightMargin: 20
                    Layout.maximumWidth: 400
                    wrapMode: Text.WordWrap
                    text: qsTr("bitrate da transmissao")
                    color: "white"
                    font.pixelSize: 15
                }

                ComboBox {
                    contentItem: Text {
                        text: parent.displayText
                        color: "black"
                        verticalAlignment: Text.AlignVCenter
                        leftPadding: 10
                    }
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    Layout.rightMargin: 10
                    model: ["Baixo (5 Mbps)", "Médio (10 Mbps)", "Alto (20 Mbps)", "Ultra (50 Mbps)"]
                    Component.onCompleted: {
                        currentIndex = Controller.getBitrateIndex()  // restaura
                    }

                    onActivated: {
                        if (currentIndex === 0) Controller.setBitrate(5000, 0)
                        if (currentIndex === 1) Controller.setBitrate(10000, 1)
                        if (currentIndex === 2) Controller.setBitrate(20000, 2)
                        if (currentIndex === 3) Controller.setBitrate(50000, 3)
                    }
                }
            }
        }

        /*
        //Switch ---------------
        Rectangle{
            width: parent.width - 10
            height: Math.max(60, row1.implicitHeight + 20)
            color: Colors.medium_blue
            anchors.horizontalCenter: parent.horizontalCenter
            radius: 10
            border.width: 1
            border.color: Colors.dark_blue

            RowLayout {
                id: row1
                width: parent.width
                anchors.verticalCenter: parent.verticalCenter

                Text {
                    Layout.fillWidth: true  // ocupa todo espaco que sobrar
                    Layout.leftMargin: 10
                    Layout.rightMargin: 20
                    Layout.maximumWidth: 400
                    wrapMode: Text.WordWrap
                    text: qsTr("Primeira config de video para teste de quebra de linha e testando ver se nao vai dar pau com o row layout nessa budega")
                    color: "white"
                    font.pixelSize: 15
                }

                Switch {
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    Layout.rightMargin: 10
                    onCheckedChanged: console.log(checked)
                }
            }
        }

        //Slider ---------------
        Rectangle{
            width: parent.width - 10
            height: Math.max(60, row2.implicitHeight + 20)
            color: Colors.medium_blue
            anchors.horizontalCenter: parent.horizontalCenter
            radius: 10
            border.width: 1
            border.color: Colors.dark_blue

            RowLayout {
                id: row2
                width: parent.width
                anchors.verticalCenter: parent.verticalCenter

                Text {
                    Layout.fillWidth: true  // ocupa todo espaco que sobrar
                    Layout.leftMargin: 10
                    Layout.rightMargin: 20
                    Layout.maximumWidth: 400
                    wrapMode: Text.WordWrap
                    text: qsTr("Primeira config de video para teste de quebra de linha e testando ver se nao vai dar pau com o row layout nessa budega")
                    color: "white"
                    font.pixelSize: 15
                }

                Slider {
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    Layout.rightMargin: 10
                    from: 0
                    to: 100
                    value: 50
                    onValueChanged: console.log(value)
                }
            }
        }

        //ComboBox ---------------
        Rectangle {
            width: parent.width - 10
            height: Math.max(60, row3.implicitHeight + 20)
            color: Colors.medium_blue
            anchors.horizontalCenter: parent.horizontalCenter
            radius: 10
            border.width: 1
            border.color: Colors.dark_blue

            RowLayout {
                id: row3
                width: parent.width
                anchors.verticalCenter: parent.verticalCenter

                Text {
                    Layout.fillWidth: true  // ocupa todo espaco que sobrar
                    Layout.leftMargin: 10
                    Layout.rightMargin: 20
                    Layout.maximumWidth: 400
                    wrapMode: Text.WordWrap
                    text: qsTr("Primeira config de video para teste de quebra de linha e testando ver se nao vai dar pau com o row layout nessa budega")
                    color: "white"
                    font.pixelSize: 15
                }

                ComboBox {
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    Layout.rightMargin: 10
                    model: ["720p", "1080p", "1440p", "4K"]
                    onActivated: console.log(currentText)
                }
            }
        }

        //TextField ---------------
        Rectangle{
            width: parent.width - 10
            height: Math.max(60, row4.implicitHeight + 20)
            color: Colors.medium_blue
            anchors.horizontalCenter: parent.horizontalCenter
            radius: 10
            border.width: 1
            border.color: Colors.dark_blue
            RowLayout {
                id: row4
                width: parent.width
                anchors.verticalCenter: parent.verticalCenter
                Text {
                    Layout.fillWidth: true  // ocupa todo espaco que sobrar
                    Layout.leftMargin: 10
                    Layout.rightMargin: 20
                    Layout.maximumWidth: 400
                    wrapMode: Text.WordWrap
                    text: qsTr("Primeira config de video para teste de quebra de linha e testando ver se nao vai dar pau com o row layout nessa budega")
                    color: "white"
                    font.pixelSize: 15
                }

                TextField {
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    Layout.rightMargin: 10
                    placeholderText: "Digite aqui..."
                    onTextChanged: console.log(text)
                }
            }
        }

        //CheckBox ---------------
        Rectangle{
            width: parent.width - 10
            height: Math.max(60, row5.implicitHeight + 20)
            color: Colors.medium_blue
            anchors.horizontalCenter: parent.horizontalCenter
            radius: 10
            border.width: 1
            border.color: Colors.dark_blue
            RowLayout {
                id: row5
                width: parent.width
                anchors.verticalCenter: parent.verticalCenter
                Text {
                    Layout.fillWidth: true  // ocupa todo espaco que sobrar
                    Layout.leftMargin: 10
                    Layout.rightMargin: 20
                    Layout.maximumWidth: 400
                    wrapMode: Text.WordWrap
                    text: qsTr("Primeira config de video para teste de quebra de linha e testando ver se nao vai dar pau com o row layout nessa budega")
                    color: "white"
                    font.pixelSize: 15
                }

                CheckBox {
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    Layout.rightMargin: 10
                    onCheckedChanged: console.log(checked)
                }
            }
        }
    */
    }
}