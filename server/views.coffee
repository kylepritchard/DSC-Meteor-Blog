Meteor.methods
  updateViews: (id) ->
    post = Posts.findOne _id: id
    views = post.views
    newview = views + 1
    Posts.update id, $set: views: newview
