# Router
#
# Variables
#
# Paths
path = 'events'
addPath = 'addevent'

# Page Title
pageTitle = 'Events'

# Page or Post
addText = 'Event'

# Section Icon
icon = 'fa-university'

# Subscriptions
subscribe = 'events'
singleSubscribe = 'single-event'

# Collections
collection = 'Events'
collectionName = 'events'

# Autoform
formInsertId = 'insertEvent'
formUpdateId = 'updateEvent'
formFields = "title,startDate,startTime,endDate,endTime,eventDetails,recurSelect,recurString"

# Mapping
#
# Router
@EventsController = AdminController.extend(
  subscriptions : ->
    Meteor.subscribe subscribe
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
  name : 'admin.events'
  controller : 'EventsController'
  template : 'event_list'
  yieldRegions :
    'admin_list_breadcrumbs' :
      to : 'breadcrumbs'
  data : ->
    db = Mongo.Collection.get(collectionName)
    db.find {} , sort : postdate : - 1

Router.route '/admin/' + path + '/' + addPath,
  name : 'admin.addevent'
  controller : 'EventsController'
  template : 'admin_add_event'
  yieldTemplates :
    'admin_add_breadcrumbs' :
      to : 'breadcrumbs'

Router.route '/admin/' + path + '/:_id',
  name : 'admin.editevent'
  controller : 'EventsController'
  template : 'admin_edit_event'
  yieldTemplates :
    'admin_edit_breadcrumbs' :
      to : 'breadcrumbs'
  data : ->
    db = Mongo.Collection.get(collectionName)
    db.findOne _id : @params._id


generateRecurrence = ->
  # Globals
  dates = undefined
  recur = undefined
  val = undefined
  startdate = undefined

  enddate = $('input#end-date').val()

  if enddate == ''
    enddate = moment().add(100, 'days').calendar()
    enddate = moment(enddate).toDate()
  else
    enddate = moment(enddate).toDate()
    console.log enddate

  # Daily
  if $('#daily').hasClass('active') == true
    val = parseInt($('#slider-daily').val())
    startdate = new Date
    dates = new RRule(
      freq: RRule.DAILY
      interval: val
      dtstart: startdate
      until: enddate
      )

    console.log dates.toString()
    console.log dates.all()
  else if $('#weekly').hasClass('active') == true
    val = parseInt($('#slider-weekly').val())

    days = []
    $('input[name="dayOfWk"]:checked').each ->
      days.push parseInt(@value)

    startdate = moment().toDate()
    dates = new RRule(
      freq: RRule.WEEKLY
      interval: val
      byweekday: days
      dtstart: startdate
      until: enddate
      )

    console.log dates.toString()
    console.log dates.all()

  else if $('#monthly').hasClass('active') == true
    if $('#dayOfMth-radio').is(':checked')
      val = parseInt($('#slider-monthly').val())

      days = []
      $('input[name="dayOfMth"]:checked').each ->
        days.push parseInt(@value)

      startdate = moment().toDate()
      dates = new RRule(
        freq: RRule.MONTHLY
        interval: val
        bymonthday: days
        dtstart: startdate
        until: enddate
        )

      console.log dates.toString()
      console.log dates.all()

    else if $('#dayOfWk-radio').is(':checked')
      days = $('select[name="dayOfWk-monthly"]').val()
      val = parseInt($('select[name="numOfWk"]').val())
      startdate = new Date

      recur = 'BYDAY=+' + val + days + ';'
      dates = new RRule(
        freq: RRule.MONTHLY
        dtstart: startdate
        until: enddate
        )

      dates = dates.toString()
      format = [
        dates.slice(0, 13)
        recur
        dates.slice(13)
        ].join('')

      dates = RRule.fromString(output)
      # dates = output;  -- This will be the string we want to pass on
      console.log dates.all()

  else
    console.log 'error'

  $('div.recurrence').html('<p><h4>Repeating:</h4> ' + dates.toText() + '</p>')
  $('input[name="recurString"]').val(dates.toString())


Template.event_list.events
  'click #delete': (event) ->
    collection = Session.get 'collectionName'
    Mongo.Collection.get(collection).remove @_id
    addText = Session.get 'addText'
    toastr.success(addText + ' sucessfully removed', 'Deleted!', {
      "positionClass": "toast-bottom-right"
      "timeOut": "4000"
      } )

Template.admin_add_event.rendered = ->
  sliders()
  labelMove()

Template.admin_add_event.events
  'click #generate': ->
    generateRecurrence()

Template.admin_edit_event.rendered = ->
  sliders()
  labelMove()

Template.admin_edit_event.events
  'click #generate': ->
    generateRecurrence()
