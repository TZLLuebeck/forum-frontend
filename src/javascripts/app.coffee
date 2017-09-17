dependencies = ['ui.router', 'restangular', 'ngStorage', 'permission', 'permission.ui', 'ngFileUpload', 'toaster']

app = angular.module('mediMeet', dependencies)


app.config ($httpProvider) ->
  $httpProvider.interceptors.push('tokenInterceptor')
  $httpProvider.interceptors.push('responseInterceptor')


app.run (User, TokenContainer, $rootScope, $state, $stateParams, Rails, $transitions) ->
  $rootScope.$state = $state
  $rootScope.$stateParams = $stateParams

  $transitions.onBefore {}, (transition) ->
    $rootScope.lastState = transition.from()
    $rootScope.lastStateParams = transition.params('from')