angular.module('mediMeet').controller('HomeCtrl', ($state, Interests) -> 
  console.log("HomeCtrl active.")

  @keywords = []
  @ints = []

  @getTargetedInterests = =>
    Interests.getRandom().then (response) =>
      @ints = response.data
    , (error) ->
      console.log(error)

  @init = =>
    Interests.getKeywords().then (response) =>
      console.log(response)
      @keywords = response
    , (error) ->
      console.log(error)
    @getTargetedInterests()

  @searchPage = (category) =>
    $state.go('root.explore', {category: category})

  @init()

  this
)