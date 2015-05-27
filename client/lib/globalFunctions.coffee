# Move labels for formatting
@labelMove = ->
  $('label').each(->
    $(@).siblings('input').after(@)
    )

# Change buttons to blue
@buttonChange = ->
  $('button.btn-primary').attr('class', 'btn btn-raised btn-info')

# Setup datepicker if required
@datePicker = ->
  $('input[type=date]').prop("type", "text")
  $('.datepicker').datepicker()

# Change radio buttons
@radioButtons = ->
  # $('div.af-radio-group > label').addClass('radio').append('<span class="outer"><span class="inner"></span></span>')

# Active noUI sliders
@sliders = ->
  $('#slider-daily').noUiSlider
    start: [ 1 ]
    range:
      'min': [ 1 ]
      'max': [ 365 ]
    step: 1
    format: wNumb(decimals: 0)
  $('#slider-daily').Link('lower').to $('#slider-daily-value')

  $('#slider-weekly').noUiSlider
    start: [ 1 ]
    range:
      'min': [ 1 ]
      'max': [ 52 ]
    step: 1
    format: wNumb(decimals: 0)
  $('#slider-weekly').Link('lower').to $('#slider-weekly-value')

  $('#slider-monthly').noUiSlider
    start: [ 1 ]
    range:
      'min': [ 1 ]
      'max': [ 12 ]
    step: 1
    format: wNumb(decimals: 0)
  $('#slider-monthly').Link('lower').to $('#slider-monthly-value')

  # Datepicker
  $('#end-date').datepicker
    format: 'dd MM yyyy'
