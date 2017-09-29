angular.module('mediMeet').controller 'UserListCtrl', ($state, User, $scope, users) ->

  @resetSettings = =>
    @finishedLoading = false
    @userList = users

  @resetSettings()

  @init = =>
    @reverse = false
    #@predicate = 'id'
    User.getAll().then(@usersReceived, () ->
      console.log("Couldn't retrieve userlist.")
      )
     
  @usersReceived = (users) =>
    @finishedLoading = true
    @userList = angular.copy(users)

  @getUser = (id) =>
    $state.go('root.profile', {id: id})

  @editUser = (id) =>
    $state.go('root.profile.edit', {id: id})

  @deleteUser = (user) =>
    User.deleteUser(user.id).then (response) =>
      index = @userList.indexOf(user)
      @userList.splice(index, 1)

  #@init()

  this