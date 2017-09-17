angular.module('mediMeet').service 'Helper', ($rootScope, $state) ->

  goBack = (defaultRoute) ->
      prev = $rootScope.lastState
      prevParams = $rootScope.lastStateParams
      console.log(prev.name)
      $state.go(prev.name, prevParams)

  goBack: goBack