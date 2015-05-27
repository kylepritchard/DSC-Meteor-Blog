#Front-end
@FrontEndController = RouteController.extend(
    layoutTemplate: 'layout'
    fastRender: true
    # subscriptions: ->
    #     Meteor.subscribe 'sailing-links'
        # Meteor.subscribe 'training-links'
        # Meteor.subscribe 'social-links'
)

Router.route '/wizard',
    name: 'wizard'
    controller: 'FrontEndController'
    template: 'master_payment_wizard'
    waitOn: ->
        Meteor.subscribe 'courses'
    data: ->
        Courses.find {} , sort: startdate: 1

Router.route '/about',
    name: 'about'
    controller: 'FrontEndController'
    template: 'about'
    data: ->
        About.find()

Router.route '/about/more',
    name: 'about-more'
    controller: 'FrontEndController'
    template: 'about-more'

#Back-end

@AdminController = RouteController.extend(
    onBeforeAction: (pause) ->
        if ! Meteor.userId()
            @layout 'layout'
            Router.go '/'
            toastr.warning('You need to be logged in to access this part of the website.', 'You need to be logged in!')
        else
            @layout 'admin_layout'
            @render 'admin_navheader',
                to: 'admin_navheader'
            @render 'admin_navsidebar',
                to: 'admin_navsidebar'
            @next()

    # layoutTemplate: 'admin_layout'
    subscriptions: ->
        Meteor.subscribe 'users'
        Meteor.subscribe 'posts'

    fastRender: true
)

# Router.route 'admin/(.*)',
#     name: 'admin.catch.all'
#     controller: 'AdminController'

Router.route '/images',
    name: 'images',
    controller: 'FrontEndController',
    template: 'imageView',
    # data: ->
    #     pics = Pictures.find().fetch()
    #     newArr = _.map pics, (o) ->
    #         return _.pick(o, '_id')
    #         console.log newArr

Router.route '/image/:id', ->
  id = @params.id
  picture = Images.findOne(_id: id)
  console.log picture
  return


Router.route '/admin/modal',
    name: 'modal'
    controller: 'AdminController'
    template: 'modal'
