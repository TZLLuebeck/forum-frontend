angular.module('mediMeet').controller 'ProfileEditCtrl', ($stateParams, $state, User, Helper) ->

  console.log('userEditCtrl active.')
  @form = user: {}
  @regInProgress = false
  @rest = {}

  @init = =>
    User.getUserPacket($stateParams.id).then(@userReceived, () -> 
      $state.go('root.admin.users')
      )

  @userReceived = (user) =>
    console.log(user)
    @rest = user
    @form.user = angular.copy(@rest.data)
  
  @update = =>
    @regInProgress = true
    @rest.data = @form.user
    User.updateUser(@rest).then (results) =>
      @submittedForm = false
      $state.go('root.profile', {id: $stateParams.id})
    , (error) =>
      @regInProgress = false

  @abort = ->
    Helper.goBack()

  @deleteAccount = ->
    User.deleteUser(@form.user.id).then () ->
      $state.go('root.home')
      User.unauthorized = true
      TokenContainer.delete()
      $rootScope.$broadcast('user:stateChanged')
    , (error) ->


  @init()

  this