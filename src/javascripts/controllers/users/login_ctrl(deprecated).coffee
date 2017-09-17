angular.module('mediMeet').controller 'LoginCtrl', (User, TokenContainer, mediREST, $q, $rootScope, $state) ->

  @form = {}


  @login = () =>
    packet = mediREST.one('users').one('login')
    packet.data = {
      email: @form.user.email
      password: @form.user.password
    }
    console.log(packet.data)
    packet.post().then (response) =>
      User.user = response.data.user
      TokenContainer.set(response.data.token)
      $rootScope.$broadcast('user:stateChanged')
      $state.go('root.home')
    , (error) ->
      if error.status == 404
        console.log("Account doesn't exist.")

  this