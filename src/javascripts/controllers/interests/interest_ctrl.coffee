angular.module('mediMeet').controller 'InterestCtrl', (info, $scope, User) ->

  @interest = info

  @init = =>
    if @interest.user_id == User.user.id
      $scope.myint = true
    else
      $scope.myint = false

  @init()

  this