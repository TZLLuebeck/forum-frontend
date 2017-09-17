angular.module('mediMeet').controller('HomeCtrl', ($state, Interests) -> 
  console.log("HomeCtrl active.")

  @keywords = []

  @init = =>
    Interests.getKeywords().then (response) =>
      console.log(response)
      @keywords = response
    , (error) ->
      console.log(error)

  @searchPage = (category) =>
    $state.go('root.explore', {category: category})

  @init()

  this
)