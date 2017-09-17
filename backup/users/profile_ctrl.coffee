angular.module('mediMeet').controller 'ProfileCtrl', (User, $state, $stateParams) ->

  console.log('Profile Controller Active')

  @init = =>
    User.getUser($stateParams.id).then(@userReceived, () -> 
      $state.go('root.manage_users')
      )

  @userReceived = (user) =>
    console.log(user)
    @user = angular.copy(user.data)
    if(!@user)
      $state.go('root.manage_users')

  @editProfile = () =>
    $state.go('root.profile.edit', {id: $stateParams.id})
            

  @init()

  this