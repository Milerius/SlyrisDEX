import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.12
import "../Components"
import "../Constants"

// List
ListView {
    implicitWidth: contentItem.childrenRect.width
    implicitHeight: contentItem.childrenRect.height

    model: API.get().current_coin_info.transactions
    clip: true

    // Row
    delegate: Rectangle {
        id: rectangle
        color: "transparent"
        implicitWidth: parent.width
        height: 65

        // Icon
        Image {
            id: received_icon
            source: General.image_path + "circle-" + (model.modelData.received ? "success" : "failed") + ".png"
            fillMode: Image.PreserveAspectFit
            width: Style.textSize2
            anchors.verticalCenter: parent.verticalCenter
        }

        // Amount
        ColumnLayout {
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 250

            // Crypto
            DefaultText {
                text: (model.modelData.received ? "+" : "-") + " " + model.modelData.amount
                Layout.alignment: Qt.AlignRight
                font.pointSize: Style.textSize2
            }

            // Fiat
            DefaultText {
                text: model.modelData.amount_fiat
                Layout.topMargin: -10
                Layout.rightMargin: 4
                Layout.alignment: Qt.AlignRight
                font.pointSize: Style.textSize
                color: Style.colorWhite4
            }
        }

        // Name
        DefaultText {
            anchors.right: parent.right
            anchors.rightMargin: 50
            text: model.modelData.date
            anchors.verticalCenter: parent.verticalCenter
        }

        // Info button
        Image {
            anchors.right: parent.right
            source: General.image_path + "dashboard-info.svg"
            fillMode: Image.PreserveAspectFit
            width: Style.textSize2
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}







/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/