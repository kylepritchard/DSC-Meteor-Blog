Template.admin_list.events
  'click #delete': (event) ->
    collection = Session.get 'collectionName'
    Mongo.Collection.get(collection).remove @_id
    addText = Session.get 'addText'
    toastr.success(addText + ' sucessfully removed', 'Deleted!', {
      "positionClass": "toast-bottom-right"
      "timeOut": "4000"
      } )

Template.admin_event_list.events
  'click #delete': (event) ->
    collection = Session.get 'collectionName'
    Mongo.Collection.get(collection).remove @_id
    addText = Session.get 'addText'
    toastr.success(addText + ' sucessfully removed', 'Deleted!', {
      "positionClass": "toast-bottom-right"
      "timeOut": "4000"
      } )

Template.admin_add.events
  # 'submit form': (event) ->
  #     goWhere = Session.get 'path'
  #     Router.go '/admin/' + goWhere

Template.admin_edit.events
  # 'submit form': (event) ->
  #     goWhere = Session.get 'path'
  #     Router.go '/admin/' + goWhere
