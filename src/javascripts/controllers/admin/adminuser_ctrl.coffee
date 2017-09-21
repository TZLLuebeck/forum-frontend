angular.module('mediMeet').controller 'AdminUserCtrl', (User, $state, companies) ->
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
      if @form.user.typus != 'Data' || @form.user.typus != 'Statistics'
        @form.user.contact_data = @form.contact_data
      User.adminReg(@form.user).then (results) =>
        @regInProgress = false
        $state.go('root.admin.userlist')
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
    unless u.typus == "Data" || u.typus == "Statistics"
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
        @errors.company = true
        valid = false
    return valid
  this