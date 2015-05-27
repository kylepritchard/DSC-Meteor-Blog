# Rendered

Template.admin_add.rendered = ->
  labelMove()
  buttonChange()
  radioButtons()

Template.admin_edit.rendered = ->
  labelMove()
  buttonChange()
  radioButtons()

Template.master_payment_wizard.rendered = ->
  $('#wizard').bootstrapWizard
    onTabShow: (tab, navigation, index) ->
      total = navigation.find('li').length
      current = index + 0
      percent = current / (total - 1) * 100
      percentWidth = 100 - (100 / total) + '%'
      navigation.find('li').removeClass 'done'
      navigation.find('li').removeClass 'next'
      navigation.find('li.active').prevAll().addClass 'done'
      navigation.find('li.active').next().addClass 'next'
      $('#wizard').find('.progress-bar').css width: percent + '%'
      $('.form-wizard-horizontal').find('.progress').css 'width': percentWidth
      return

  fields = []

  $('li#formSummary').on('click', ->
    fields = $(':input').serializeArray()
    console.log fields
    )

  $('li#formSummary').bind('cssClassChanged', ->
    fields = $(':input').serializeArray()
    console.log fields
    )

  # summarize = ->
  #     console.log fields
  #
  # summarize()
  # setInterval summarize, 5 * 1000
