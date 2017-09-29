angular.module('mediMeet').controller 'AdminInterestCtrl', (Interests, Keywords, users, $state) ->

  @anyCat = {
    category: "Beliebig"
    subcategories: [{
      subcategory: "Beliebig"
      }]
  }

  @anySubCat = {
    subcategory: "Beliebig"
  }

  @userlist  = users
  @categories = angular.copy(Keywords.relations)
  @category = null

  @subcategories = []
  @subcategory = null

  @keywords = []

  @form = interest: {}

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

  @create_post = () =>
    @form.interest.category = @category.category
    if @category.category == 'Beliebig'
      @form.interest.subcategory = 'Beliebig'
      @form.interest.keywords = []
    else 
      @form.interest.subcategory = @subcategory.subcategory
    Interests.assignInterest(@form.interest).then (response) ->
      $state.go('root.admin.interestlist')

  @abort = ->
    Helper.goBack()

  this




  this