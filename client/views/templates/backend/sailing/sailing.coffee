#Router

# Variables
######################

# Paths
path = 'sailing'
addPath = 'addsailing'
# Page Title
pageTitle = 'Sailing'
# Page or Post
addText = 'Page'
# Section Icon
icon = 'fa-ship'
# Subscriptions
subscribe = 'sailingpages'
singleSubscribe = 'single-sailingpage'
# Collections
collection = 'Sailing'
collectionName = 'sailing'
# Autoform
formInsertId = 'insertPost'
formUpdateId = 'updatePost'
formFields = "title,content"

# Mapping
#######################

#Router

@SailingController = AdminController.extend(
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
    name: 'admin.sailing'
    controller: 'SailingController'
    template: 'admin_list'
    yieldRegions:
        'admin_list_breadcrumbs':
            to: 'breadcrumbs'
    data: ->
        db = Mongo.Collection.get(collectionName)
        db.find {} , sort: postdate: - 1

Router.route '/admin/' + path + '/' + addPath,
    name: 'admin.addsailing'
    controller: 'SailingController'
    template: 'admin_add'
    yieldTemplates:
        'admin_add_breadcrumbs':
            to: 'breadcrumbs'

Router.route '/admin/sailing/batteryrota',
    name: 'admin.batteryrota'
    controller: 'SailingController'
    template: 'admin_batteryrota'
    yieldTemplates:
        'admin_edit_breadcrumbs':
            to: 'breadcrumbs'
    subscriptions: ->
        Meteor.subscribe 'batteryrota'
    data: ->
        BatteryRota.find

Router.route '/admin/' + path + '/:_id',
    name: 'admin.editsailing'
    controller: 'SailingController'
    template: 'admin_edit'
    yieldTemplates:
        'admin_edit_breadcrumbs':
            to: 'breadcrumbs'
    data: ->
        db = Mongo.Collection.get(collectionName)
        db.findOne _id: @params._id


Template.admin_batteryrota.events
    'click #add_date': ( event ) ->
        BatteryRota.insert({date: new Date} )
    'click #delete': ( event ) ->
        BatteryRota.remove @_id
    'click #edit': ( event ) ->
        #Function goes below
        $().replaceWith('<input>' + @date)

#Helpers

Template.admin_batteryrota.helpers
    batteryRota: ->
        BatteryRota.find {},
            sort:
                date: 1
    makeUniqueID: ->
        @_id
    # makeUniqueIDwithDate: ->
    #     'rotaDate ' + @_id

# Rendering
# Template.admin_batteryrota.rendered = ->
#     $('input.rotaDatepicker').datepicker()
