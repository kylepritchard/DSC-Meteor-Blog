#Router

# Variables
######################

# Paths
path = 'training'
addPath = 'addtraining'
# Page Title
pageTitle = 'Training'
# Page or Post
addText = 'Page'
# Section Icon
icon = 'fa-university'
# Subscriptions
subscribe = 'trainingpages'
singleSubscribe = 'single-trainingpage'
# Collections
collection = 'Training'
collectionName = 'training'
# Autoform
formInsertId = 'insertPost'
formUpdateId = 'updatePost'
formFields = "title,content"

# Mapping
#######################

#Router

@TrainingController = AdminController.extend(
    subscriptions: ->
        Meteor.subscribe subscribe
    onBeforeAction: ->
        Session.set 'path', path
        Session.set 'addPath', addPath
        Session.set 'pageTitle', pageTitle
        Session.set 'addText', addText
        Session.set 'icon', icon
        Session.set 'collection', collection
        Session.set 'collectionName', collectionName
        Session.set 'formFields', formFields
        Session.set 'formInsertId', formInsertId
        Session.set 'formUpdateId', formUpdateId
        @next()
)

# Mapping
#######################

Router.route '/admin/' + path,
    name: 'admin.training'
    controller: 'TrainingController'
    template: 'admin_list'
    yieldRegions:
        'admin_list_breadcrumbs':
            to: 'breadcrumbs'
    data: ->
        db = Mongo.Collection.get(collectionName)
        db.find {} , sort: postdate: - 1

Router.route '/admin/' + path + '/' + addPath,
    name: 'admin.addtraining'
    controller: 'TrainingController'
    template: 'admin_add'
    yieldTemplates:
        'admin_add_breadcrumbs':
            to: 'breadcrumbs'

Router.route '/admin/' + path + '/:_id',
    name: 'admin.edittraining'
    controller: 'TrainingController'
    template: 'admin_edit'
    yieldTemplates:
        'admin_edit_breadcrumbs':
            to: 'breadcrumbs'
    data: ->
        db = Mongo.Collection.get(collectionName)
        db.findOne _id: @params._id
