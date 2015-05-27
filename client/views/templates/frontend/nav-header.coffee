Template.nav_header.created = ->
  Meteor.call 'links', (error, response) ->
    if error
      alert 'fuck'
    else
      console.log 'done'
      Session.set 'sailingLinks', response[0].sailing
      Session.set 'trainingLinks', response[1].training

Template.nav_header.rendered = ->

  # # ADD SLIDEDOWN ANIMATION TO DROPDOWN //
  # $('.dropdown').on 'show.bs.dropdown', (e) ->
  #   $(@).find('.dropdown-menu').first().stop(true, true).slideDown()
  #   return
  #
  # # ADD SLIDEUP ANIMATION TO DROPDOWN //
  # $('.dropdown').on 'hide.bs.dropdown', (e) ->
  #   $(@).find('.dropdown-menu').first().stop(true, true).slideUp 1, ->
  #     $('.dropdown').removeClass 'open'
  #     $('.dropdown').find('.dropdown-toggle').attr 'aria-expanded', 'false'
  #     return
  #   return

  # Add slideDown animation to dropdown
  $('.dropdown').on 'show.bs.dropdown', (e) ->
    $(this).find('.dropdown-menu').first().stop(true, true).slideDown()
    return
  # Add slideUp animation to dropdown
  $('.dropdown').on 'hide.bs.dropdown', (e) ->
    $(this).find('.dropdown-menu').first().stop(true, true).slideUp()
    return


Template.nav_header.helpers
  sailingLinks: ->
    return Session.get 'sailingLinks'
  trainingLinks: ->
    return Session.get 'trainingLinks'
