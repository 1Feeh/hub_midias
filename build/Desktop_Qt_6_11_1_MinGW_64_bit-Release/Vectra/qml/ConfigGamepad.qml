import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    anchors.fill: parent

    RowLayout {
        anchors.fill: parent
        spacing: 0
        Rectangle {
            id: homeConfigGamepadScreen
            anchors.fill: parent
            color: "#15273d"

            property int topTab: 2
            property int currentTab: 2

            // ==========================================
            // COMPONENTE REUTILIZÁVEL DE MAPEAMENTO
            // (Ele escuta o teclado e muda a tecla)
            // ==========================================
            Component {
                id: interactiveKeyMapper
                Rectangle {
                    property string currentKey: ""
                    property int fontSize: 13
                    property int cornerRadius: 4
                    property bool isRecording: false

                    color: isRecording ? "#2a3545" : "#1a2636"
                    radius: cornerRadius
                    border.color: isRecording ? "#64a1fb" : "transparent"
                    border.width: isRecording ? 2 : 0

                    Text {
                        text: parent.isRecording ? "..." : parent.currentKey
                        color: parent.isRecording ? "#64a1fb" : "white"
                        font.bold: true
                        font.pixelSize: parent.fontSize
                        anchors.centerIn: parent
                    }

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            parent.isRecording = true
                            parent.forceActiveFocus()
                        }
                    }

                    Keys.onPressed: {
                        if (!isRecording) {
                            return
                        }

                        // Ignora se apertar SÓ o modificador (Ctrl/Shift/Alt)
                        if (event.key === Qt.Key_Control || event.key === Qt.Key_Shift || event.key === Qt.Key_Alt || event.key === Qt.Key_Meta) {
                            return
                        }

                        let modStr = ""
                        if (event.modifiers & Qt.ControlModifier) modStr += "CTRL+"
                        if (event.modifiers & Qt.AltModifier) modStr += "ALT+"
                        if (event.modifiers & Qt.ShiftModifier) modStr += "SHIFT+"

                        let keyStr = ""
                        if (event.key === Qt.Key_Escape) keyStr = "ESC"
                        else if (event.key === Qt.Key_Tab) keyStr = "TAB"
                        else if (event.key === Qt.Key_Backspace) keyStr = "BACKSPACE"
                        else if (event.key === Qt.Key_Enter || event.key === Qt.Key_Return) keyStr = "ENTER"
                        else if (event.key === Qt.Key_Space) keyStr = "SPACE"
                        else if (event.key === Qt.Key_Delete) keyStr = "DEL"
                        else if (event.key === Qt.Key_Up) keyStr = "UP"
                        else if (event.key === Qt.Key_Down) keyStr = "DOWN"
                        else if (event.key === Qt.Key_Left) keyStr = "LEFT"
                        else if (event.key === Qt.Key_Right) keyStr = "RIGHT"
                        else if (event.key >= Qt.Key_F1 && event.key <= Qt.Key_F12) keyStr = "F" + (event.key - Qt.Key_F1 + 1)
                        else {
                            keyStr = String.fromCharCode(event.key).toUpperCase()
                        }

                        parent.currentKey = modStr + keyStr
                        parent.isRecording = false
                        event.accepted = true
                    }

                    onFocusChanged: {
                        if (!focus) {
                            isRecording = false
                        }
                    }
                }
            }

            RowLayout {
                anchors.fill: parent
                spacing: 0

                // ==========================================
                // PAINEL LATERAL ESQUERDO
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
                // ÁREA CENTRAL (CONFIGURAÇÃO DO GAMEPAD)
                // ==========================================
                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.margins: 25
                    spacing: 20
                    visible: currentTab === 2

                    // --- 1. BARRA SUPERIOR DE SELEÇÃO ---
                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 15

                        RowLayout {
                            spacing: 8
                            CheckBox {
                                id: chkConnect
                                checked: true
                            }
                            Text {
                                text: "Conectar Comando"
                                color: "white"
                                font.pixelSize: 14
                            }
                        }

                        ComboBox {
                            id: cbControllerType
                            model: ["Xbox Controller", "DualShock 4", "Comando Pro"]
                            Layout.preferredWidth: 160
                            Layout.preferredHeight: 34
                            background: Rectangle {
                                color: "#1a2636"
                                radius: 4
                                border.color: "#3d4e63"
                            }
                            contentItem: Text {
                                text: cbControllerType.displayText
                                color: "white"
                                leftPadding: 10
                                verticalAlignment: Text.AlignVCenter
                                font.pixelSize: 14
                            }
                        }

                        Text {
                            text: "Entrada"
                            color: "#a0aab5"
                            font.pixelSize: 14
                        }
                        ComboBox {
                            id: cbInputDev
                            model: ["Any", "Keyboard", "DirectInput"]
                            Layout.preferredWidth: 140
                            Layout.preferredHeight: 34
                            background: Rectangle {
                                color: "#1a2636"
                                radius: 4
                                border.color: "#3d4e63"
                            }
                            contentItem: Text {
                                text: cbInputDev.displayText
                                color: "white"
                                leftPadding: 10
                                verticalAlignment: Text.AlignVCenter
                                font.pixelSize: 14
                            }
                        }

                        Text {
                            text: "Perfil"
                            color: "#a0aab5"
                            font.pixelSize: 14
                        }
                        ComboBox {
                            id: cbProfile
                            model: ["Fulaninho", "Default Gaming", "Esportes"]
                            Layout.fillWidth: true
                            Layout.preferredHeight: 34
                            background: Rectangle {
                                color: "#1a2636"
                                radius: 4
                                border.color: "#3d4e63"
                            }
                            contentItem: Text {
                                text: cbProfile.displayText
                                color: "white"
                                leftPadding: 10
                                verticalAlignment: Text.AlignVCenter
                                font.pixelSize: 14
                            }
                        }

                        Button {
                            Layout.preferredWidth: 80
                            Layout.preferredHeight: 34
                            background: Rectangle {
                                color: "#22c55e"
                                radius: 4
                            }
                            contentItem: Text {
                                text: "Guardar"
                                color: "white"
                                font.pixelSize: 13
                                font.bold: true
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                        Button {
                            Layout.preferredWidth: 70
                            Layout.preferredHeight: 34
                            background: Rectangle {
                                color: "#1a2636"
                                radius: 4
                                border.color: "#3d4e63"
                            }
                            contentItem: Text {
                                text: "Novo"
                                color: "white"
                                font.pixelSize: 13
                                font.bold: true
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                        Button {
                            Layout.preferredWidth: 70
                            Layout.preferredHeight: 34
                            background: Rectangle {
                                color: "#ef4444"
                                radius: 4
                            }
                            contentItem: Text {
                                text: "Apagar"
                                color: "white"
                                font.pixelSize: 13
                                font.bold: true
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                    }

                    // --- 2. PAINEL PRINCIPAL DE MAPEAMENTO CENTRALIZADO E COM SCROLL ---
                    ScrollView {
                        id: scrollView
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        clip: true
                        ScrollBar.horizontal.policy: ScrollBar.AsNeeded
                        ScrollBar.vertical.policy: ScrollBar.AsNeeded

                        Item {
                            width: Math.max(scrollView.availableWidth, mainContentRow.width)
                            height: Math.max(scrollView.availableHeight, mainContentRow.height)

                            Row {
                                id: mainContentRow
                                anchors.centerIn: parent
                                spacing: 40

                                // ==============================
                                // COLUNA ESQUERDA
                                // ==============================
                                Column {
                                    width: 240
                                    spacing: 20

                                    // Analógico Esquerdo
                                    Rectangle {
                                        width: 240
                                        height: 230
                                        color: "#111821"
                                        radius: 8
                                        border.color: "#1e2c3a"

                                        Column {
                                            anchors.fill: parent
                                            anchors.margins: 16
                                            spacing: 12
                                            Text {
                                                text: "Analógico Esquerdo"
                                                color: "white"
                                                font.bold: true
                                                font.pixelSize: 15
                                            }

                                            GridLayout {
                                                columns: 2
                                                columnSpacing: 15
                                                rowSpacing: 8

                                                Text {
                                                    text: "Esquerda"
                                                    color: "#a0aab5"
                                                    font.pixelSize: 13
                                                    Layout.alignment: Qt.AlignVCenter
                                                }
                                                Loader {
                                                    Layout.preferredWidth: 80
                                                    Layout.preferredHeight: 28
                                                    sourceComponent: interactiveKeyMapper
                                                    onLoaded: {
                                                        item.currentKey = "A"
                                                    }
                                                }

                                                Text {
                                                    text: "Cima"
                                                    color: "#a0aab5"
                                                    font.pixelSize: 13
                                                    Layout.alignment: Qt.AlignVCenter
                                                }
                                                Loader {
                                                    Layout.preferredWidth: 80
                                                    Layout.preferredHeight: 28
                                                    sourceComponent: interactiveKeyMapper
                                                    onLoaded: {
                                                        item.currentKey = "W"
                                                    }
                                                }

                                                Text {
                                                    text: "Baixo"
                                                    color: "#a0aab5"
                                                    font.pixelSize: 13
                                                    Layout.alignment: Qt.AlignVCenter
                                                }
                                                Loader {
                                                    Layout.preferredWidth: 80
                                                    Layout.preferredHeight: 28
                                                    sourceComponent: interactiveKeyMapper
                                                    onLoaded: {
                                                        item.currentKey = "S"
                                                    }
                                                }

                                                Text {
                                                    text: "Direita"
                                                    color: "#a0aab5"
                                                    font.pixelSize: 13
                                                    Layout.alignment: Qt.AlignVCenter
                                                }
                                                Loader {
                                                    Layout.preferredWidth: 80
                                                    Layout.preferredHeight: 28
                                                    sourceComponent: interactiveKeyMapper
                                                    onLoaded: {
                                                        item.currentKey = "D"
                                                    }
                                                }

                                                Text {
                                                    text: "Premido"
                                                    color: "#a0aab5"
                                                    font.pixelSize: 13
                                                    Layout.alignment: Qt.AlignVCenter
                                                }
                                                Loader {
                                                    Layout.preferredWidth: 80
                                                    Layout.preferredHeight: 28
                                                    sourceComponent: interactiveKeyMapper
                                                    onLoaded: {
                                                        item.currentKey = "F"
                                                    }
                                                }
                                            }
                                        }
                                    }

                                    // D-Pad
                                    Rectangle {
                                        width: 240
                                        height: 190
                                        color: "#111821"
                                        radius: 8
                                        border.color: "#1e2c3a"

                                        Column {
                                            anchors.fill: parent
                                            anchors.margins: 16
                                            spacing: 12
                                            Text {
                                                text: "D-Pad"
                                                color: "white"
                                                font.bold: true
                                                font.pixelSize: 15
                                            }

                                            GridLayout {
                                                columns: 2
                                                columnSpacing: 15
                                                rowSpacing: 8

                                                Text {
                                                    text: "Esquerda"
                                                    color: "#a0aab5"
                                                    font.pixelSize: 13
                                                    Layout.alignment: Qt.AlignVCenter
                                                }
                                                Loader {
                                                    Layout.preferredWidth: 80
                                                    Layout.preferredHeight: 28
                                                    sourceComponent: interactiveKeyMapper
                                                    onLoaded: {
                                                        item.currentKey = "LEFT"
                                                    }
                                                }

                                                Text {
                                                    text: "Cima"
                                                    color: "#a0aab5"
                                                    font.pixelSize: 13
                                                    Layout.alignment: Qt.AlignVCenter
                                                }
                                                Loader {
                                                    Layout.preferredWidth: 80
                                                    Layout.preferredHeight: 28
                                                    sourceComponent: interactiveKeyMapper
                                                    onLoaded: {
                                                        item.currentKey = "UP"
                                                    }
                                                }

                                                Text {
                                                    text: "Baixo"
                                                    color: "#a0aab5"
                                                    font.pixelSize: 13
                                                    Layout.alignment: Qt.AlignVCenter
                                                }
                                                Loader {
                                                    Layout.preferredWidth: 80
                                                    Layout.preferredHeight: 28
                                                    sourceComponent: interactiveKeyMapper
                                                    onLoaded: {
                                                        item.currentKey = "DOWN"
                                                    }
                                                }

                                                Text {
                                                    text: "Direita"
                                                    color: "#a0aab5"
                                                    font.pixelSize: 13
                                                    Layout.alignment: Qt.AlignVCenter
                                                }
                                                Loader {
                                                    Layout.preferredWidth: 80
                                                    Layout.preferredHeight: 28
                                                    sourceComponent: interactiveKeyMapper
                                                    onLoaded: {
                                                        item.currentKey = "RIGHT"
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }

                                // ==============================
                                // COLUNA CENTRAL (BOTÕES XBOX)
                                // ==============================
                                Column {
                                    width: 380
                                    spacing: 35

                                    // Triggers Superiores Padrão Xbox (LT, LB / View, Menu / RB, RT)
                                    Row {
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        spacing: 8

                                        Loader {
                                            width: 50
                                            height: 35
                                            sourceComponent: interactiveKeyMapper
                                            onLoaded: {
                                                item.currentKey = "LT"
                                                item.cornerRadius = 6
                                            }
                                        }
                                        Loader {
                                            width: 50
                                            height: 35
                                            sourceComponent: interactiveKeyMapper
                                            onLoaded: {
                                                item.currentKey = "LB"
                                                item.cornerRadius = 6
                                            }
                                        }

                                        Item {
                                            width: 15
                                        }

                                        Loader {
                                            width: 55
                                            height: 35
                                            sourceComponent: interactiveKeyMapper
                                            onLoaded: {
                                                item.currentKey = "VIEW"
                                                item.cornerRadius = 6
                                                item.fontSize = 11
                                            }
                                        }
                                        Loader {
                                            width: 55
                                            height: 35
                                            sourceComponent: interactiveKeyMapper
                                            onLoaded: {
                                                item.currentKey = "MENU"
                                                item.cornerRadius = 6
                                                item.fontSize = 11
                                            }
                                        }

                                        Item {
                                            width: 15
                                        }

                                        Loader {
                                            width: 50
                                            height: 35
                                            sourceComponent: interactiveKeyMapper
                                            onLoaded: {
                                                item.currentKey = "RB"
                                                item.cornerRadius = 6
                                            }
                                        }
                                        Loader {
                                            width: 50
                                            height: 35
                                            sourceComponent: interactiveKeyMapper
                                            onLoaded: {
                                                item.currentKey = "RT"
                                                item.cornerRadius = 6
                                            }
                                        }
                                    }

                                    // Imagem do Controle
                                    Image {
                                        id: mainControllerAsset
                                        source: "../assets/icons/stadia_controller_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg"
                                        width: 340
                                        height: 220
                                        fillMode: Image.PreserveAspectFit
                                        mipmap: true
                                        anchors.horizontalCenter: parent.horizontalCenter
                                    }

                                    // Analógicos Circulares
                                    Row {
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        spacing: 50
                                        Rectangle {
                                            width: 100
                                            height: 100
                                            color: "#111821"
                                            radius: 50
                                            border.color: "#3d4e63"
                                            border.width: 3
                                            Rectangle {
                                                width: 10
                                                height: 10
                                                color: "#22c55e"
                                                radius: 5
                                                anchors.centerIn: parent
                                            }
                                        }
                                        Rectangle {
                                            width: 100
                                            height: 100
                                            color: "#111821"
                                            radius: 50
                                            border.color: "#3d4e63"
                                            border.width: 3
                                            Rectangle {
                                                width: 10
                                                height: 10
                                                color: "#22c55e"
                                                radius: 5
                                                anchors.centerIn: parent
                                            }
                                        }
                                    }

                                    // Checkboxes
                                    Row {
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        spacing: 40
                                        Row {
                                            spacing: 8
                                            CheckBox {
                                                id: chkVib
                                                checked: true
                                                anchors.verticalCenter: parent.verticalCenter
                                            }
                                            Text {
                                                text: "Vibração"
                                                color: "white"
                                                font.pixelSize: 14
                                                anchors.verticalCenter: parent.verticalCenter
                                            }
                                        }
                                        Row {
                                            spacing: 8
                                            CheckBox {
                                                id: chkMov
                                                checked: true
                                                anchors.verticalCenter: parent.verticalCenter
                                            }
                                            Text {
                                                text: "Movimento"
                                                color: "white"
                                                font.pixelSize: 14
                                                anchors.verticalCenter: parent.verticalCenter
                                            }
                                        }
                                    }
                                }

                                // ==============================
                                // COLUNA DIREITA
                                // ==============================
                                Column {
                                    width: 240
                                    spacing: 20

                                    // Botões de Rosto
                                    Rectangle {
                                        width: 240
                                        height: 190
                                        color: "#111821"
                                        radius: 8
                                        border.color: "#1e2c3a"

                                        Column {
                                            anchors.fill: parent
                                            anchors.margins: 16
                                            spacing: 12
                                            Text {
                                                text: "Botões de Rosto"
                                                color: "white"
                                                font.bold: true
                                                font.pixelSize: 15
                                            }

                                            GridLayout {
                                                columns: 2
                                                columnSpacing: 15
                                                rowSpacing: 8

                                                Text {
                                                    text: "Botão X"
                                                    color: "#a0aab5"
                                                    font.pixelSize: 13
                                                    Layout.alignment: Qt.AlignVCenter
                                                }
                                                Loader {
                                                    Layout.preferredWidth: 80
                                                    Layout.preferredHeight: 28
                                                    sourceComponent: interactiveKeyMapper
                                                    onLoaded: {
                                                        item.currentKey = "V"
                                                    }
                                                }

                                                Text {
                                                    text: "Botão A"
                                                    color: "#a0aab5"
                                                    font.pixelSize: 13
                                                    Layout.alignment: Qt.AlignVCenter
                                                }
                                                Loader {
                                                    Layout.preferredWidth: 80
                                                    Layout.preferredHeight: 28
                                                    sourceComponent: interactiveKeyMapper
                                                    onLoaded: {
                                                        item.currentKey = "C"
                                                    }
                                                }

                                                Text {
                                                    text: "Botão Y"
                                                    color: "#a0aab5"
                                                    font.pixelSize: 13
                                                    Layout.alignment: Qt.AlignVCenter
                                                }
                                                Loader {
                                                    Layout.preferredWidth: 80
                                                    Layout.preferredHeight: 28
                                                    sourceComponent: interactiveKeyMapper
                                                    onLoaded: {
                                                        item.currentKey = "Z"
                                                    }
                                                }

                                                Text {
                                                    text: "Botão B"
                                                    color: "#a0aab5"
                                                    font.pixelSize: 13
                                                    Layout.alignment: Qt.AlignVCenter
                                                }
                                                Loader {
                                                    Layout.preferredWidth: 80
                                                    Layout.preferredHeight: 28
                                                    sourceComponent: interactiveKeyMapper
                                                    onLoaded: {
                                                        item.currentKey = "X"
                                                    }
                                                }
                                            }
                                        }
                                    }

                                    // Analógico Direito
                                    Rectangle {
                                        width: 240
                                        height: 190
                                        color: "#111821"
                                        radius: 8
                                        border.color: "#1e2c3a"

                                        Column {
                                            anchors.fill: parent
                                            anchors.margins: 16
                                            spacing: 12
                                            Text {
                                                text: "Analógico Direito"
                                                color: "white"
                                                font.bold: true
                                                font.pixelSize: 15
                                            }

                                            GridLayout {
                                                columns: 2
                                                columnSpacing: 15
                                                rowSpacing: 8

                                                Text {
                                                    text: "Esquerda"
                                                    color: "#a0aab5"
                                                    font.pixelSize: 13
                                                    Layout.alignment: Qt.AlignVCenter
                                                }
                                                Loader {
                                                    Layout.preferredWidth: 80
                                                    Layout.preferredHeight: 28
                                                    sourceComponent: interactiveKeyMapper
                                                    onLoaded: {
                                                        item.currentKey = "J"
                                                    }
                                                }

                                                Text {
                                                    text: "Cima"
                                                    color: "#a0aab5"
                                                    font.pixelSize: 13
                                                    Layout.alignment: Qt.AlignVCenter
                                                }
                                                Loader {
                                                    Layout.preferredWidth: 80
                                                    Layout.preferredHeight: 28
                                                    sourceComponent: interactiveKeyMapper
                                                    onLoaded: {
                                                        item.currentKey = "I"
                                                    }
                                                }

                                                Text {
                                                    text: "Baixo"
                                                    color: "#a0aab5"
                                                    font.pixelSize: 13
                                                    Layout.alignment: Qt.AlignVCenter
                                                }
                                                Loader {
                                                    Layout.preferredWidth: 80
                                                    Layout.preferredHeight: 28
                                                    sourceComponent: interactiveKeyMapper
                                                    onLoaded: {
                                                        item.currentKey = "K"
                                                    }
                                                }

                                                Text {
                                                    text: "Direita"
                                                    color: "#a0aab5"
                                                    font.pixelSize: 13
                                                    Layout.alignment: Qt.AlignVCenter
                                                }
                                                Loader {
                                                    Layout.preferredWidth: 80
                                                    Layout.preferredHeight: 28
                                                    sourceComponent: interactiveKeyMapper
                                                    onLoaded: {
                                                        item.currentKey = "L"
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }

                    // --- 3. BARRA INFERIOR DE RESTAURAÇÃO ---
                    RowLayout {
                        Layout.fillWidth: true
                        Layout.topMargin: 5
                        spacing: 12

                        Item {
                            Layout.fillWidth: true
                        }

                        Button {
                            Layout.preferredWidth: 100
                            Layout.preferredHeight: 36
                            background: Rectangle {
                                color: "#1a2636"
                                radius: 6
                                border.color: "#3d4e63"
                            }
                            contentItem: Text {
                                text: "Padrões"
                                color: "white"
                                font.bold: true
                                font.pixelSize: 14
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                        }

                        Button {
                            Layout.preferredWidth: 90
                            Layout.preferredHeight: 36
                            background: Rectangle {
                                color: "#ef4444"
                                radius: 6
                            }
                            contentItem: Text {
                                text: "Limpar"
                                color: "white"
                                font.bold: true
                                font.pixelSize: 14
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                    }
                }
            }
        }
    }
}