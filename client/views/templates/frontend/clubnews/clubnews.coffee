Router.route '/clubnews',
  name: 'clubnews'
  controller: 'FrontEndController'
  template: 'clubnews'
  subscriptions: ->
    Meteor.subscribe 'posts'

Template.clubnews.helpers
  main: ->
    Posts.find {},
      sort:
        postdate: - 1
      # limit: 4

  older: ->
    Posts.find {},
      sort:
        postdate: -1
      skip: 4

Template.clubnews.rendered = ->
  html = $('div.sharetotheworld').val()
  console.log html
  $('button.btn-facebook').click ->
    $(@).parent().parent().parent().next('.sharetotheworld').slideUp 'slow', ->
      # Animation complete.
      return
    return


# Single Post

Router.route '/clubnews/:_id',
  name: 'single-clubnews'
  controller: 'FrontEndController'
  template: 'single_clubnews'
  subscriptions: ->
    Meteor.subscribe 'posts'
  data: ->
    Posts.findOne _id : @params._id
  onAfterAction: ->
    # Update the number of views the post has had
    id = @params._id
    # Call update method on server, prevents looping
    Meteor.call 'updateViews', id, (error, result) ->
      if error
        console.log 'Problem updating views'
      return

# Template.single_clubnews.rendered = ->
#   $(document).ready( ->
#     console.log 'ready'
#     num = $('span.views').text()
#     console.log num
#     # $('span.views').val(0)
#     $('span#views').animateNumber number: num
#
#     # $('#lines').animateNumber number: 165
#   )
