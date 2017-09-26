angular.module('mediMeet').controller 'PasswordResetCtrl', (User, $state, Helper) ->

  @accountname = null
  @ajaxInProgress = false

  @send = () =>
    @ajaxInProgress = true
    if @accountname
      User.resetPassword(@accountname).then (response) ->
        @ajaxInProgress = false
        console.log(response)
        $state.go('root.home')
      , (error) ->
        console.log(error)
        @ajaxInProgress = false

  @abort = () ->
    Helper.goBack()

  this