angular.module('mediMeet').controller 'RegistrationCtrl', (TokenContainer, User, $state, $scope) ->

  console.log('RegistrationCtrl active.')
  @form = user: {}
  @regInProgress = false

  @goBack = =>
    $state.go('root.manage_users')

  @register = =>
    @regInProgress = true
    User.registerUser(@form.user).then (results) =>
      @submittedForm = false
      console.log('Registration Data')
      console.log(results)
      User.user = results.user
      TokenContainer.set(results.token)
      $state.go('root.manage_users')
    , (error) =>
      console.log('Register Error')
      console.log(error)
      if error.status == 404
        console.log('Email not found')
      @regInProgress = false

  this