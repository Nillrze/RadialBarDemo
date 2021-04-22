import QtQuick 2.15
import QtQuick.Window 2.2
import CustomControls 1.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Shapes 1.15

Window {
    id: root
    visible: true
    color: "#282a36"
    width: 1024
    height: 600
    title: qsTr("RadialBarShape Demo")

    QtObject {
        id: feeder

        property real value: 0

        SequentialAnimation on value {
            loops: Animation.Infinite
            NumberAnimation { to: 100; duration: 2000 }
            NumberAnimation { to: 0; duration: 2000 }
        }
    }


    ColumnLayout {
        anchors.centerIn: parent
        spacing: 10

        RowLayout {
            Layout.fillWidth: true
            spacing: 20
            RadialBarShape {
                value: feeder.value
            }
            RadialBarShape {
                Layout.preferredHeight: 300
                Layout.preferredWidth: 300
                progressColor: "#e6436d"
                value: feeder.value
                spanAngle: 270
                dialType: RadialBarShape.DialType.FullDial
                backgroundColor: "#6272a4"
                penStyle: Qt.FlatCap
                dialColor: "transparent"
            }
            RadialBarShape {
                progressColor: "#8be9fd"
                value: feeder.value
                spanAngle: 270
                dialType: RadialBarShape.DialType.NoDial
                dialColor: Qt.darker("#8be9fd", 3.8)
                penStyle: Qt.SquareCap
                dialWidth: 10
            }
            RadialBarShape {
                id: newone
                progressColor: "#50fa7b"
                value: feeder.value
                startAngle: 90
                spanAngle: 270
                dialType: RadialBarShape.DialType.MinToMax
                backgroundColor: "#6272a4"
                dialWidth: 5
            }
            visible: false
        }
    }

    ColumnLayout {
        id: croot
        spacing: 20
        anchors.centerIn: parent

        property real newVal: 0

        Row {
            spacing: 10
            RoundSlider {
                id: radSlider
                value: croot.newVal
                onValueChanged: croot.newVal = value
                handleOffset: 0.53

                handle: Rectangle {
                    id: handleItem
                    x: radSlider.width / 2 - width / 2
                    y: radSlider.height / 2 - height / 2
                    width: radSlider.dialWidth * 2
                    height: radSlider.dialWidth
                    color: "#bc081a"
                    radius: width / 2
                    antialiasing: true
                }
            }

            RoundSlider {
                id: radSlider2
                value: croot.newVal
                onValueChanged: croot.newVal = value
                startAngle: 40
                endAngle: 320
                rotation: 90

                handle: Rectangle {
                    x: radSlider2.width / 2 - width / 2
                    y: radSlider2.height / 2 - height / 2
                    width: radSlider2.width / 2
                    height: 10
                    color: "#65ac89"
                    radius: width / 2
                    antialiasing: true
                }
            }

        }

        Slider {
            id: newSLider
            from: 0
            to: 100
            width: 300
            value: croot.newVal
            onValueChanged: croot.newVal = value
            Layout.fillWidth: true
        }

        Dial {
            wrap: true
            from: 0
            to: 100
            value: croot.newVal
            onValueChanged: croot.newVal = value
            wheelEnabled: true
            Layout.alignment: Qt.AlignHCenter
        }
    }
}
