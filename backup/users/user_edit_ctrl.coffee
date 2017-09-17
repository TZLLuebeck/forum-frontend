angular.module('mediMeet').controller 'userEditCtrl', ($stateParams, $state, User) ->

  console.log('userEditCtrl active.')
  @form = user: {}
  @regInProgress = false
  @rest = {}

  @init = =>
    User.getUser($stateParams.id).then(@userReceived, () -> 
      $state.go('root.manage_users')
      )

  @userReceived = (user) =>
    @rest = user
    @form.user = @rest.data
    if(!@form.user)
      $state.go('root.manage_users')
  
  @update = =>
    @regInProgress = true
    User.updateUser(@rest).then (results) =>
      @submittedForm = false
      $state.go('root.profile', {id: $stateParams.id})
    , (error) =>
      @regInProgress = false
      console.log(error)

  @init()

  this