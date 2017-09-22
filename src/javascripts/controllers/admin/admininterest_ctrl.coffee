angular.module('mediMeet').controller 'AdminInterestCtrl', (Interests, Keywords, users, $state) ->

  @userlist  = users
  @categories = Keywords.relations
  @category = null

  @subcategories = []
  @subcategory = null

  @keywords = []

  @form = interest: {}

  @changeCategory = =>
    @subcategories = @category.subcategories
    @subcategory = null
    @keywords = []
    @form.interest.keywords = []

  @changeSubcategory = =>
    @keywords = @subcategory.keywords
    @form.interest.keywords = []

  @create_post = () =>
    @form.interest.category = @category.category
    @form.interest.subcategory = @subcategory.subcategory
    Interests.assignInterest(@form.interest).then (response) ->
      $state.go('root.admin.interestlist')

  @abort = ->
    Helper.goBack()

  this




  this