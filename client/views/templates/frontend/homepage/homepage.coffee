Router.route '/',
  name: 'homepage'
  controller: 'FrontEndController'
  template: 'home'
  subscriptions: ->
    Meteor.subscribe 'posts'
  #     Meteor.subscribe 'sailingpages'

Template.home.helpers
  yo: ->
    username = Meteor.user().profile.username
  featuredPost: ->
    Posts.find {},
      sort:
        postdate: -1
      limit: 1
  posts: ->
    Posts.find {},
      sort:
        postdate: -1
      limit: 5
      skip: 1
