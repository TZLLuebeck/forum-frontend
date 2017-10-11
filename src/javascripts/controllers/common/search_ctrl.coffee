angular.module('mediMeet').controller 'SearchCtrl', (Interests, $stateParams, $state, Keywords, initials, category) ->

  @list = initials
  @category = category
  @subcategories = []
  @subfilter
  @typefilter
  @searchfilter
  @filter = null
  @page = 1

  @checkFilter = =>
    if @subfilter || @typefilter || @searchfilter
      @filter = {}
      if @subfilter
        @filter.subcategory = @subfilter
      if @typefilter
        @filter.typus = @typefilter
      if @searchfilter
        @filter.offer = @searchfilter
    else
      @filter = null

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