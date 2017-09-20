angular.module('mediMeet').controller 'NavCtrl', ($timeout, $scope, mediREST, User, TokenContainer, $state, $rootScope, toaster) -> 

  @form = {}

  @username = "default"

  @admin = false

  @init = () =>
    @isAuthenticated = false
    @setLoggedIn(TokenContainer.get())
    @setUsername()
    @isAdmin()

  @login = () =>
    packet = mediREST.one('users').one('login')
    packet.data = {
      username: @form.user.username
      password: @form.user.password
    }
    console.log(packet.data)
    packet.post().then (response) =>
      @form = {}
      User.user = response.data.user
      TokenContainer.set(response.data.token)
      $rootScope.$broadcast('user:stateChanged')
    , (error) =>
      if error.status == 404
        @form.user.password = ""
        toaster.pop('error', "Nicht vorhanden.", "Es wurde kein Account mit diesem Accountnamen gefunden.");
      if error.status == 401 && error.data.error.name == 'wrong_password'
        @form.user.password = ""
        toaster.pop('error', "Falsches Passwort", "Das eingegebene Passwort war falsch.");
  @setUsername = () =>
    console.log(@isAuthenticated)
    if @isAuthenticated
      User.retrieveUser().then (response) =>
        @username = angular.copy(response.username)
      , (error) ->
        @username = "Angemeldet"
        console.log("setUsername: error")

  @setLoggedIn = (isLoggedIn) => 
    @isAuthenticated = !!isLoggedIn
    console.log('Logged In Status: '+@isAuthenticated)

  @logout = () =>
    User.logout().then () ->
      TokenContainer.delete()
      $state.go('root.home')

  @isAdmin = () =>
    console.log(User.user)
    if User.user
      console.log(User.user.roles)
      if 'admin' in User.user.roles
        @admin = true
      else
        @admin = false
    else
      @admin = false

  $rootScope.$on 'user:stateChanged', (e, state, params) =>
    @setLoggedIn(TokenContainer.get())
    @setUsername()
    @isAdmin()

  @init()

  this
