Template.registerHelper 'pageTitle', ( input ) ->
  Session.get 'pageTitle'

Template.registerHelper 'addText', ( input ) ->
  Session.get 'addText'

Template.registerHelper 'path', ( input ) ->
  Session.get 'path'

Template.registerHelper 'addPath', ( input ) ->
  Session.get 'addPath'

Template.registerHelper 'icon', ( input ) ->
  Session.get 'icon'

Template.registerHelper 'collection', ( input ) ->
  Session.get 'collection'

Template.registerHelper 'formInsertId', ( input ) ->
  Session.get 'formInsertId'

Template.registerHelper 'formUpdateId', ( input ) ->
  Session.get 'formUpdateId'

Template.registerHelper 'formFields', ( input ) ->
  Session.get 'formFields'


# Formatting
Template.registerHelper 'formatDate', (date) ->
  moment(Date.parse(date)).format('Do MMMM YYYY, H:mm')
Template.registerHelper 'eventDate', (date) ->
  moment(Date.parse(date)).format('Do MMMM YYYY')
