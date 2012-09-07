jQuery( ($) ->
  $('#name').bind('input', (evt) ->
    if /\W/.test($(this).val())
      $(this.form).find('input[type="submit"]').prop('disabled', true)
      $(this).after('<span class="error">the name was invalid</span>')
    else
      $(this.form).find('input[type="submit"]').prop('disabled', false)
      $(this.form).find('.error').remove()
  )
)
