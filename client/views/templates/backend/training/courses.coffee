#Router

# Variables
######################

# Paths
path = 'training/courses'
addPath = 'addcourse'
# Page Title
pageTitle = 'Training Course'
# Page or Post
addText = 'Course'
# Section Icon
icon = 'fa-university'
# Subscriptions
subscribe = 'courses'
singleSubscribe = 'single-course'
# Collections
collection = 'Courses'
collectionName = 'courses'
# Autoform
formInsertId = 'insertCourse'
formUpdateId = 'updateCourse'
formFields = "coursetype,startdate,starttime,enddate,endtime,coursecostmember,coursecostnonmember,additional"

# Mapping
#######################

#Router

@CourseController = AdminController.extend(
    subscriptions: ->
        Meteor.subscribe subscribe
        Meteor.subscribe 'coursetypes'
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
    name: 'admin.course'
    controller: 'CourseController'
    template: 'admin_event_list'
    yieldRegions:
        'admin_list_breadcrumbs':
            to: 'breadcrumbs'
    data: ->
        db = Mongo.Collection.get(collectionName)
        db.find {} , sort: postdate: - 1

Router.route '/admin/' + path + '/' + addPath,
    name: 'admin.addcourse'
    controller: 'CourseController'
    template: 'admin_add'
    yieldTemplates:
        'admin_add_breadcrumbs':
            to: 'breadcrumbs'
    onAfterAction: ->
        Session.set 'pageTitle', 'Training'

Router.route '/admin/' + path + '/:_id',
    name: 'admin.editcourse'
    controller: 'CourseController'
    template: 'admin_edit'
    yieldTemplates:
        'admin_edit_breadcrumbs':
            to: 'breadcrumbs'
    data: ->
        db = Mongo.Collection.get(collectionName)
        db.findOne _id: @params._id
