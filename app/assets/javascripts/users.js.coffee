jQuery( ($) ->
  $('#name').bind('input', (evt) ->
    form = $(this.form)
    if /\W|^\s*$/.test($(this).val())
      return if form.find('.error').length

      form.find('input[type="submit"]').prop('disabled', true)
      $(this).after('<span class="error">the name was invalid</span>')
    else
      form.find('input[type="submit"]').prop('disabled', false)
      form.find('.error').remove()
  )
)
