angular.module('mediMeet').controller 'InterestEditCtrl', (Interests, $state, $stateParams, Keywords, Helper) ->

  @anyCat = {
    category: "Beliebig"
    subcategories: [{
      subcategory: "Beliebig"
      }]
  }

  @anySubCat = {
    subcategory: "Beliebig"
  }

  @categories = angular.copy(Keywords.relations)
  @category = null

  @subcategories = []
  @subcategory = null

  @keywords = []

  @form = interest: {}
  @rest = {}

  @reason = ""

  @changeOffer = =>
    # We switch to search
    if @form.interest.offer == "search"
      # Any added to categories
      @categories.push(@anyCat)
      if @category
        # if there is already a category selected, add any to subcategories as well
        @subcategories.push(@anySubCat)
    else # We switch to offer
      if @category && @category.category == 'Beliebig' # If a category selected and it's Any
        @category = null # Remove selection
        @subcategories = [] # Clear subcategories
      if @subcategory && @subcategory.subcategory == 'Beliebig' # if subcategory is selected and it's any
        @subcategory = null # remove selection
      #Check if any is in category or subcategory. If so, remove it.
      cindex = @categories.indexOf(@anyCat)
      scindex = @subcategories.indexOf(@anySubCat)
      if cindex > -1
        @categories.splice(cindex, 1)
      if scindex > -1
        @subcategories.splice(scindex, 1)

  @init = =>
    Interests.getInterest($stateParams.id).then(@postReceived, () -> 
      $state.go('root.admin.users')
      )

  @postReceived = (response) =>
    @rest = response
    @form.interest = angular.copy(@rest.data)
    delete @form.interest.attachment
    if @form.interest.offer == "search"
      @categories.push(@anyCat)
    for category in @categories
      if category.category == @form.interest.category
        @category = category
        @subcategories = angular.copy(@category.subcategories)
        break
    if @form.interest.offer = "search"
      @subcategories.push(@anySubCat)
    for subcategory in @subcategories
      if subcategory.subcategory == @form.interest.subcategory
        @subcategory = subcategory
        @keywords = @subcategory.keywords
        break

  @changeCategory = =>
    @subcategories = angular.copy(@category.subcategories)
    if @form.interest.offer == "search" # We're searching
      if @category.category != 'Beliebig' # category is not any
        @subcategories.push(@anySubCat) # add any subcategory to existing
    @subcategory = null
    @keywords = []
    @form.interest.keywords = []

  @changeSubcategory = =>
    @keywords = @subcategory.keywords
    @form.interest.keywords = []

  @update = =>
    @form.interest.category = @category.category
    if @category.category == "Beliebig"
      @form.interest.subcategory = "Beliebig"
    else
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