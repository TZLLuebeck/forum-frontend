angular.module('mediMeet').service 'Helper', ($rootScope, $state) ->

  goBack = (defaultRoute) ->
      prev = $rootScope.lastState
      prevParams = $rootScope.lastStateParams
      console.log(prev)
      console.log(prevParams)
      if prev.name
        $state.go(prev.name, prevParams) 
      else
        $state.go('root.home')
  goBack: goBack