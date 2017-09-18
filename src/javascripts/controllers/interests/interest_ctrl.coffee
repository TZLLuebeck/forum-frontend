angular.module('mediMeet').controller 'InterestCtrl', (info, $scope, User, $state) ->

  @interest = info

  @init = =>
    if @interest.user_id == User.user.id
      $scope.myint = true
    else
      $scope.myint = false

  @back = =>
  	$state.go('root.explore', {category: @interest.category})

  @init()

  this