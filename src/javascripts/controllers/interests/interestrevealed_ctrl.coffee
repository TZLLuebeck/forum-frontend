angular.module('mediMeet').controller 'InterestRevealedCtrl', (contact) ->

  @user = contact

  @init = =>
    Interests.makeContact($stateParams.id).then (response) =>
      @user = angular.copy(response.data)
      console.log(@user)

  this