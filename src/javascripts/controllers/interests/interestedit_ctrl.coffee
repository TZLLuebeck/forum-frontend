angular.module('mediMeet').controller 'InterestEditCtrl', (Interests, $state, $stateParams, Keywords, Helper) ->

  @categories = Keywords.relations
  @category = null

  @subcategories = []
  @subcategory = null

  @keywords = []

  @form = interest: {}
  @rest = {}

  @reason = ""

  @init = =>
    Interests.getInterest($stateParams.id).then(@postReceived, () -> 
      $state.go('root.admin.users')
      )

  @postReceived = (response) =>
    @rest = response
    @form.interest = angular.copy(@rest.data)
    for category in @categories
      if category.category == @form.interest.category
        @category = category
        @subcategories = @category.subcategories
        break
    for subcategory in @subcategories
      if subcategory.subcategory == @form.interest.subcategory
        @subcategory = subcategory
        @keywords = @subcategory.keywords
        break

  @changeCategory = =>
    @subcategories = @category.subcategories
    @subcategory = null
    @keywords = []
    @form.interest.keywords = []

  @changeSubcategory = =>
    @keywords = @subcategory.keywords
    @form.interest.keywords = []

  @update = =>
    @form.interest.category = @category.category
    @form.interest.subcategory = @subcategory.subcategory
    @rest.data = @form.interest
    Interests.editInterest(@form.interest).then (results) =>
      Helper.goBack()
    , (error) =>
      console.log(error)

  @abort = ->
    Helper.goBack()

  @deleteInterest = () ->
    Interests.deleteInterest(@form.interest.id).then () ->
      $state.go('root.profile')
    , (error) ->
      

  @init()

  this