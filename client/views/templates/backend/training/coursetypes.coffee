#Router

# Variables
######################

# Paths
path = 'training/coursetypes'
addPath = 'addcoursetype'
# Page Title
pageTitle = 'Course Types'
# Page or Post
addText = 'Course'
# Section Icon
icon = 'fa-university'
# Subscriptions
subscribe = 'coursetypes'
singleSubscribe = 'single-coursetype'
# Collections
collection = 'CourseTypes'
collectionName = 'coursetypes'
# Autoform
formInsertId = 'insertCourseType'
formUpdateId = 'updateCourseType'
formFields = "title,coursetype,coursedescription,courserequirements,courseduration,courseminduration,courseassumedknowledge,coursedifficulty"

# Mapping
#######################

#Router

@CourseTypeController = AdminController.extend(
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
    name: 'admin.coursetype'
    controller: 'CourseTypeController'
    template: 'admin_list'
    yieldRegions:
        'admin_list_breadcrumbs':
            to: 'breadcrumbs'
    data: ->
        db = Mongo.Collection.get(collectionName)
        db.find {} , sort: postdate: - 1

Router.route '/admin/' + path + '/' + addPath,
    name: 'admin.addcoursetype'
    controller: 'CourseTypeController'
    template: 'admin_add'
    yieldTemplates:
        'admin_add_breadcrumbs':
            to: 'breadcrumbs'
    onAfterAction: ->
        Session.set 'addText', ''

Router.route '/admin/' + path + '/:_id',
    name: 'admin.editcoursetype'
    controller: 'CourseTypeController'
    template: 'admin_edit'
    yieldTemplates:
        'admin_edit_breadcrumbs':
            to: 'breadcrumbs'
    data: ->
        db = Mongo.Collection.get(collectionName)
        db.findOne _id: @params._id
