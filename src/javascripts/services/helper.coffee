angular.module('mediMeet').service 'Helper', ($rootScope, $state) ->

  goBack = (defaultRoute) ->
      prev = $rootScope.lastState
      prevParams = $rootScope.lastStateParams
      if !!prev
        $state.go(prev.name, prevParams) 
      else
        #$state.go('root.home')
  goBack: goBack