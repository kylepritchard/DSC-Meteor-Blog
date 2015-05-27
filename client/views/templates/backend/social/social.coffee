# Variables
######################

# Paths
path = 'social'
addPath = 'addsocial'
# Page Title
pageTitle = 'Social Section'
# Page or Post
addText = 'Page'
# Section Icon
icon = 'fa-users'
# Subscriptions
subscribe = 'social'
singleSubscribe = 'single-social'
# Collections
collection = 'Social'
collectionName = 'social'
# Autoform
formInsertId = 'insertPost'
formUpdateId = 'updatePost'
formFields = "title,content"

#Router

@SocialController = AdminController.extend(
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
    name: 'admin.social'
    controller: 'SocialController'
    template: 'admin_list'
    yieldRegions:
        'admin_list_breadcrumbs':
            to: 'breadcrumbs'
    data: ->
        db = Mongo.Collection.get(collectionName)
        db.find {} , sort: postdate: - 1

Router.route '/admin/' + path + '/' + addPath,
    name: 'admin.addsocial'
    controller: 'SocialController'
    template: 'admin_add'
    yieldTemplates:
        'admin_add_breadcrumbs':
            to: 'breadcrumbs'

Router.route '/admin/' + path + '/:_id',
    pname: 'admin.editsocial'
    controller: 'SocialController'
    template: 'admin_edit'
    yieldTemplates:
        'admin_edit_breadcrumbs':
            to: 'breadcrumbs'
    data: ->
        db = Mongo.Collection.get(collectionName)
        db.findOne _id: @params._id
