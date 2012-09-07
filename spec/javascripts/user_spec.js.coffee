###
visit top_path
###
describe "validate", ->
  it "show error message", ->
    $('#name').val('###').trigger('input')
    $('input[type="submit"]').prop('disabled').should.equal(true)

  it "not show error message", ->
    $('#name').val('sss').trigger('input')
    $('input[type="submit"]').prop('disabled').should.equal(false)
