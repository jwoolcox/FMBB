// Application with the Sheet project template
import bb.cascades 1.0
Page {
    signal done(bool ok)
    Container {
        Label {
            text: "Add Page"
        }

        Divider {
        }
        Button {
            text: "Close"
            onClicked: {
                done(false)
            }
        }

    }

}
