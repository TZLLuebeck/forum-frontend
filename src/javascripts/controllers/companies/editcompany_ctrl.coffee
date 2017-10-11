angular.module('mediMeet').controller 'EditCompanyCtrl', (Company, Helper, comp) ->

  console.log(comp)

  @form = {company: comp.company}
  if !@form.company.parent
    delete @form.company.parent
  delete @form.company.logo

  @submit = =>
    Company.update(@form.company).then (response) =>
      Helper.goBack()
    , (error) =>
      console.log(error)

  @goBack = ->
    Helper.goBack()

  this