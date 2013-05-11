// Application with the Sheet project template
import bb.cascades 1.0
Page {
    signal done(bool ok)
    Container {
        Label {
            text: "Edit Page"
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
