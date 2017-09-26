angular.module('mediMeet').controller 'RegistrationCtrl', (TokenContainer, User, $state, $scope, $rootScope, companies, Helper) ->

  console.log('RegistrationCtrl active.')
  @form = {
    user: {}
    contact_data: {}
    company: {}
  }
  @regInProgress = false
  @errors = {}
  @serverside = {}
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
        User.user = results.data.user
        TokenContainer.set(results.data.token)
        User.unauthorized = false
        $rootScope.$broadcast('user:stateChanged')
        Helper.goBack()
      , (error) =>
        switch error.status
          when 409
            if error.data.error == "email_exists"
              @errors.email.msg = "Ein Account mit dieser Email-Addresse existiert bereits."
            else if error.error == "username_exists"
              @errors.username.msg = "Ein Account mit diesem Namen existiert bereits." 
          when 400
            for e in error.data.error
              for m in e.messages
                warning = m.split(":")
                @serverside[warning[0]] = warning[1]
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