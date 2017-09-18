angular.module('mediMeet').controller 'RegistrationCtrl', (TokenContainer, User, $state, $scope, $rootScope, companies, Helper) ->

  console.log('RegistrationCtrl active.')
  @form = {
    user: {}
    contact_data: {}
    company: {}
  }
  @regInProgress = false
  @errors = {}
  @companies = companies

  @goBack = =>
    Helper.goBack()

  @register = =>
    if @validate()
      @regInProgress = true
      if @form.user.typus != 'Student'
        @form.user.contact_data = @form.contact_data
        if !@form.contact_data.company_id
          delete @form.contact_data.company_id
          @form.company.typus = @form.user.typus
          @form.company.web = @form.user.web
          @form.user.company = @form.company
      User.registerUser(@form.user).then (results) =>
        @regInProgress = false
        User.user = results.user
        TokenContainer.set(results.token)
        User.unauthorized = false
        $rootScope.$broadcast('user:stateChanged')
        $state.go('root.interest.createinterest')
      , (error) =>
        console.log('Register Error')
        console.log(error)
        if error.status == 404
          console.log('Email not found')
        @regInProgress = false
    else
      console.log("Validation failed.")

  @validate = =>
    valid = true
    @errors = {}
    u = @form.user
    c = @form.contact_data
    cp = @form.company
    unless u.typus
      @errors.typus = true
      valid = false
    unless u.username && u.email && u.password && (u.password_confirmation == u.password)
      unless u.username
        @errors.username = true
      unless u.email
        @errors.email = true
      unless u.password
        @errors.password = true
      unless u.password_confirmation && (u.password == u.password_confirmation)
        @errors.password_confirmation = true
      valid = false
    unless u.typus == "Student"
      unless c.firstname && c.lastname && c.plz && c.ort && (c.web || c.fon)
        unless c.firstname
          @errors.firstname = true
        unless c.lastname
          @errors.lastname = true
        unless c.plz
          @errors.plz = true
        unless c.ort
          @errors.ort = true
        unless c.web || c.fon
          @errors.web = true
          @errors.fon = true
        valid = false
      unless c.company_id
        unless cp.name
          @errors.company.name = true
          valid = false
        unless cp.description
          @errors.company.description = true
          valid = false
    return valid
  this