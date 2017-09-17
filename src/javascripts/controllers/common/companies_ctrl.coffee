angular.module('mediMeet').controller 'CompaniesCtrl', (Company, list) ->

  @companyList = list
  console.log(@companyList)

  this