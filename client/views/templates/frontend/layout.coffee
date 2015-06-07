Template.homepage_layout.rendered = ->
  $(window).scroll ->
    y_scroll_pos = window.pageYOffset
    scroll_pos_test = 150
    # set to whatever you want it to be
    if y_scroll_pos > scroll_pos_test
      $('nav.navbar').addClass 'beyond-carousel'
    else
      $('nav.navbar').removeClass 'beyond-carousel'
    return

  $(document).smoothSlides
    navigation: false
    pagination: false
  return

Template.layout.rendered = ->
  $(window).unbind().scroll()
  $('nav.navbar').addClass 'beyond-carousel'
