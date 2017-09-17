angular.module('mediMeet').controller('NavCtrl', (mediREST, User, TokenContainer, $state, $rootScope) -> 
  console.log("NavCtrl active.")

  @init = () =>
    @isAuthenticated = false
    @setLoggedIn(TokenContainer.get())

  @setLoggedIn = (isLoggedIn) => 
    @isAuthenticated = !!isLoggedIn
    console.log('Logged In Status: '+@isAuthenticated)

  @login = () =>
    $state.go('root.login')

  @logout = () =>
    User.logout().then () ->
      TokenContainer.delete()
      $state.go('root.home')

  $rootScope.$on 'user:stateChanged', (e, state, params) =>
    @setLoggedIn(TokenContainer.get())

  @init()

  this
)