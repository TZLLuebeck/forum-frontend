angular.module('mediMeet').controller 'ProfileCtrl', (User, $state, $stateParams, mydata, posts) ->

  console.log('Profile Controller Active')
  @user = mydata
  @interestList = posts
  @id = $stateParams.id
  @canEdit = false

  @init = =>
    if User.user.id == @user.id || 'admin' in User.user.roles
      @canEdit = true

  @editProfile = () =>
    $state.go('root.profile.edit', {id: @id})

  @getInterests = () =>
    unless @interestList.length
      User.getInterests(@id).then(@gotInterests, () ->
        console.log("Error")
        )

  @gotInterests = (interests) =>
    @interestList = angular.copy(interests.data)

  @viewInterest = (id) =>
    $state.go('root.interest.hidden', {id: id})
  
  @init()          
  
  this