# Variables
#
# Paths
path = 'clubnews'
addPath = 'addclubnews'

# Page Title
pageTitle = 'Club News'

# Page or Post
addText = 'Post'

# Section Icon
icon = 'fa-newspaper-o'

# Subscriptions
subscribe = 'posts'
singleSubscribe = 'single-post'

# Collections
collection = 'Posts'
collectionName = 'posts'

# Autoform
formInsertId = 'insertPost'
formUpdateId = 'updatePost'
formFields = "title,content"

# Router
@PostController = AdminController.extend(

    # subscriptions: ->
    # Meteor.subscribe subscribe
    onBeforeAction : ->
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
Router.route '/admin/' + path,
    name : 'admin.clubnews'
    controller : 'PostController'
    template : 'admin_list'
    yieldRegions :
        'admin_list_breadcrumbs' :
            to : 'breadcrumbs'
    data : ->
        db = Mongo.Collection.get(collectionName)
        db.find {} , sort : postdate : - 1

Router.route '/admin/' + path + '/' + addPath,
    name : 'admin.addclubnews'
    controller : 'PostController'
    template : 'admin_add'
    yieldTemplates :
        'admin_add_breadcrumbs' :
            to : 'breadcrumbs'

Router.route '/admin/' + path + '/:_id',
    pname : 'admin.editclubnews'
    controller : 'PostController'
    template : 'admin_edit'
    yieldTemplates :
        'admin_edit_breadcrumbs' :
            to : 'breadcrumbs'
    data : ->
        db = Mongo.Collection.get(collectionName)
        db.findOne _id : @params._id
