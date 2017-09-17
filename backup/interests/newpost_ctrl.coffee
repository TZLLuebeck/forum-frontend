angular.module('mediMeet').controller 'newPostCtrl', (User, Interests, $state) ->

  @form = interest: {}

  @create_post = () =>
    console.log(@form)
    Interests.createInterest(@form.interest).then (response) ->
      console.log(response)
      $state.go('root.manage_users')

  this