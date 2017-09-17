angular.module('mediMeet').controller 'NewCompanyCtrl', (Company, $state) ->

  @form = company: {}

  @submit = =>
    Company.createCompany(@form.company).then (response) =>
      $state.go('root.admin.companylist')
    , (error) =>
      console.log(error)

  this