angular.module('mediMeet').controller 'SearchCtrl', (Interests, $stateParams, $state, Keywords, initials, category) ->

  @list = initials
  @category = category
  @subcategories = []
  @subfilter
  @page = 1

  @init = =>
    for rel in Keywords.relations
      if rel.category == $stateParams.category
        @subcategories = rel.subcategories
        break

  @viewPost = (id) =>
    $state.go('root.interest.hidden', {id: id})

  @loadMore = =>
    console.log("Loading more content")
    @page++

  @init()

  this