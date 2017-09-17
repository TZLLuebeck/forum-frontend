angular.module('mediMeet').controller 'InterestListCtrl', ($state, User, Interests, $scope, interest) ->

  @posts = interest

# Initalization Deprecated, now in Routes

#  @init = =>
#    @reverse = false
#    @predicate = 'id'
#    Interests.getAll().then(@postsReceived, () ->
#      $state.go('root.admin.users')
#      )

#  @postsReceived = (posts) =>
#    @finishedLoading = true
#    console.log('Arranging Posts')
#    @posts = angular.copy(posts)
#    console.log(@posts)


  @edit = (id) =>
    $state.go('root.interest.editinterest', {id: id})

  @viewPost = (id) =>
    $state.go('root.interest.hidden', {id: id})

  @getUser = (id) =>
    $state.go('root.interest', {id: id})

  @deletePost = (post) =>
    Interests.deleteInterest(post.id).then (response) =>
      index = @posts.indexOf(post)
      @posts.splice(index, 1)
    , (error) ->
      console.log('Error while deleting Post.')

 
  this