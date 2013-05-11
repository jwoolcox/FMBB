// Application with the Sheet project template
import bb.cascades 1.0
Page {
    //signal done(bool ok)
    actions: [
        ActionItem {
            title: "Edit"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                editSheet.open();
            }
        },
        ActionItem {
            title: "Output"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                outputSheet.open();
            }
        }
    ]
    attachedObjects: [
        Sheet {
            id: editSheet
            content: EditSheet {
                id: sheetEdit
            }
        },
        Sheet {
            id: outputSheet
            content: OutputSheet {
                id: sheetOutput
            }
        }
    ]
    Container {
        Label {
            text: "View Page"
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
    function closeEdit() {
        editSheet.close();
    }
    function closeOutput() {
        outputSheet.close();
    }
    onCreationCompleted: {
        sheetEdit.done.connect(closeEdit);
        sheetOutput.done.connect(closeOutput);

    }
}
