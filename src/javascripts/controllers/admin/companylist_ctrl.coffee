angular.module('mediMeet').controller 'CompanyListCtrl', ($state, Company, $scope) ->

  @resetSettings = =>
    @finishedLoading = false
    @companyList = []

  @resetSettings()

  @init = =>
    Company.getAll().then(@compsReceived, () ->
      console.log("Couldn't retrieve companies.")
      )
     
  @compsReceived = (comps) =>
    @finishedLoading = true
    @companyList = angular.copy(comps)
    console.log(@companyList)

  @getCompany = (id) =>
    $state.go('root.companies.company', {id: id})

  @approveCompany = (cmp) =>
    Company.approve(cmp.id).then (response) =>
      cmp.validated = true
    , (error) =>
      console.log(error)

  @deleteCompany = (cmp) =>
    Company.destroy(cmp.id).then (response) =>
      @companyList.splice(@companyList.indexOf(cmp), 1)
    , (error) =>
      console.log(error)

  @init()

  this