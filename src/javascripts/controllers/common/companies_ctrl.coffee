angular.module('mediMeet').controller 'CompaniesCtrl', (Company, list, $state) ->

  @companyList = list

  @viewCompany = (id) =>
  	$state.go('root.companies.company', {id: id})

  this