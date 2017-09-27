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
  @categories = Keywords.relations
  @category = null

  @subcategories = []
  @subcategory = null

  @keywords = []

  @form = interest: {}

  @changeOffer = =>
    if @form.interest.offer == "search"
      @categories.push(@anyCat)
      if @category
        @subcategories.push(@anySubCat)
    else
      if @category && @category.category == 'Beliebig'
        @category = null
        @subcategories = []
      if @subcategory && @subcategory.subcategory == 'Beliebig'
        @subcategory = null
      cindex = @categories.indexOf(@anyCat)
      scindex = @subcategories.indexOf(@anySubCat)
      if cindex > -1
        @categories.splice(cindex, 1)
      if scindex > -1
        @subcategories.splice(scindex, 1)

  @changeCategory = =>
    @subcategories = @category.subcategories
    if @form.interest.offer == "search"
      if @category.category != 'Beliebig'
        @subcategories.push(@anySubCat)
      else
        @subcategory = @anySubCat
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