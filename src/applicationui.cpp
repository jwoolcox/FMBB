// Grid view with detail project template
#include "applicationui.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/ListView>
#include <bb/cascades/GroupDataModel>
#include <bb/data/JsonDataAccess>

using namespace bb::cascades;

ApplicationUI::ApplicationUI(bb::cascades::Application *app)
: QObject(app)
{
    // create scene document from main.qml asset
    // set parent to created document to ensure it exists for the whole application lifetime
    QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(this);

    // create root object for the UI
    AbstractPane *root = qml->createRootObject<AbstractPane>();
    // set created root object as a scene
    app->setScene(root);

    {
        // load JSON data from file to QVariant
        bb::data::JsonDataAccess jda;
        QVariantList lst = jda.load("app/native/assets/mydata.json").toList();
        if (jda.hasError()) {
            bb::data::DataAccessError error = jda.error();
            qDebug() << "JSON loading error: " << error.errorType() << ": " << error.errorMessage();
        }
        else {
            qDebug() << "JSON data loaded OK!";
            GroupDataModel *m = new GroupDataModel();
            // insert the JSON data to model
            m->insertList(lst);
            // make the model flat
            m->setGrouping(ItemGrouping::None);
            // find cascades component of type ListView with an objectName property set to the value 'listView'
            // usable if one do not want to expose GroupDataModel to QML (qmlRegisterType<GroupDataModel>("com.example", 1, 0, "MyListModel");)
            ListView *list_view = root->findChild<ListView*>("listView");
            // assign data model object (m) to its GUI representation object (list_view)
            if(list_view) list_view->setDataModel(m);
        }
    }
}
