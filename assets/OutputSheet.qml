// Application with the Sheet project template
import bb.cascades 1.0
Page {
    signal done(bool ok)
    Container {
        Label {
            text: "Output Page \r pick from the icons.."
        }
        Divider {
        }
        Button {
            text: "cancel"
            onClicked: {
                done(false)
            }
        }

    }

}
