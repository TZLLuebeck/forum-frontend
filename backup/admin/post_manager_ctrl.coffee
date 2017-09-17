angular.module('mediMeet').controller 'postmngCtrl', ($state, User, Interests, $scope) ->

  @resetSettings = =>
    @finishedLoading = false
    @userList = []

  @resetSettings()

  @init = =>
    @reverse = false
    #@predicate = 'id'
    Interests.getAll().then(@postsReceived)
     
  @postsReceived = (posts) =>
    @finishedLoading = true
    @posts = angular.copy(posts)

  @getUser = (id) =>
    $state.go('root.profile', {id: id})

  @deleteUser = (email) =>
    User.deleteUser(email).then (response) =>
      @init()

  @init()

  this