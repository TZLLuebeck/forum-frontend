angular.module('mediMeet').controller 'InterestHiddenCtrl', ($state, $stateParams, $scope) ->

  @mine = $scope.myint

  @reveal = ->
    console.log('Click')
    $state.go('root.interest.revealed')
    
  @edit = ->
    $state.go('root.interest.editinterest', {id: $stateParams.id})

  this