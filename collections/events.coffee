Schemas = {}

@Events = new Mongo.Collection('events')

Events.attachSchema new SimpleSchema(

  title:
    type: String
    optional: false

  startDate:
    type: Date
    label: 'Start Date'
    optional: true
    autoform:
      type: "bootstrap-datepicker"

  endDate:
    type: Date
    label: 'End Date'
    optional: true
    autoform:
      type: "bootstrap-datepicker"

  startTime:
    type: String
    label: 'Start Time'
    optional: true
    autoform:
      type: "bs-timepicker"

  endTime:
    type: String
    label: 'Start Time'
    optional: true
    autoform:
      type: "bs-timepicker"

  eventDetails:
    type: String
    label: 'Event Details'
    optional: true

  postDate:
    type: Date
    label: 'Post Date'
    optional: true

  recurSelect:
    type: Boolean
    optional: true
    autoform:
      type: "boolean-checkbox"

  recurString:
    type: String
    optional: true
    autoform:
      type: 'hidden'

  parent:
    type: Boolean
    optional: true

  parentId:
    type: String
    optional: true
  )
