angular.module('mediMeet').controller 'usermngCtrl', ($state, User, $scope) ->

  @resetSettings = =>
    @finishedLoading = false
    @userList = []

  @resetSettings()

  @init = =>
    @reverse = false
    #@predicate = 'id'
    User.getAll().then(@usersReceived)
     
  @usersReceived = (users) =>
    @finishedLoading = true
    @userList = angular.copy(users)
    console.log(@userList)

  @getUser = (id) =>
    $state.go('root.profile', {id: id})

  @deleteUser = (email) =>
    User.deleteUser(email).then (response) =>
      @init()

  @init()

  this