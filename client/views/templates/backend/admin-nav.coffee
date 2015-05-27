Template.admin_navsidebar.helpers(
    username: ->
        user = Meteor.user()
        username = user.profile.realname
        username
)

Template.admin_layout.created = ->
    $('body').addClass('menubar-pin header-fixed')

Template.admin_navsidebar.rendered = ->

    # responsive

    pageSize = ->
        if @matchMedia('(max-width: 768px)').matches
            $('body').removeClass('menubar-visible')
            $('body').alterClass('width-*', 'width-768')
            return
        else if @matchMedia('(max-width: 1200px)').matches
            console.log 'max 1200'
            $('body').removeClass('menubar-visible')
            $('body').alterClass('width-*', 'width-1200')
            $('#menu-expand button').unbind().click( ->
                $('body').toggleClass('menubar-visible')
                )
            $('#sidemenu ul li ul li a').unbind().click( ->
                $('body').toggleClass('menubar-visible')
                )
            return
        else if @matchMedia('(min-width: 1200px)').matches
            console.log 'not 1200'
            $('body').alterClass('width-*', 'width-over-1200')
            $('body').addClass('menubar-visible')
            $('#sidemenu ul li ul li a').unbind().click( ->
                console.log 'clicked'
                )
            return

    # Run on loading page
    pageSize()

    $(window).resize ->
        clearTimeout @resize
        @resize = setTimeout(pageSize, 500)


    $('#sidemenu li.active').addClass('open').children('ul').show()
    $('#sidemenu li.has-sub>a').on('click', ->
        element
        $(@).removeAttr('href')
        element = $(@).parent('li')
        if element.hasClass('open')
            element.removeClass('open')
            element.find('li').removeClass('open')
            element.find('ul').slideUp(200)
        else
            element.addClass('open')
            element.children('ul').slideDown(200)
            element.siblings('li').children('ul').slideUp(200)
            element.siblings('li').removeClass('open')
            element.siblings('li').find('li').removeClass('open')
            element.siblings('li').find('ul').slideUp(200)
    )
