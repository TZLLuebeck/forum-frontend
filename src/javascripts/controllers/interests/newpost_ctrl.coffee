angular.module('mediMeet').controller 'NewPostCtrl', (User, Interests, $state, Keywords, Helper) ->

  @categories = Keywords.relations
  @category = null

  @subcategories = []
  @subcategory = null

  @keywords = []

  @form = interest: {}

  #@keywords = ["e-Health", "medical Apps", "personalisierte Medizin", "EPA", "Telemedizin", "Smart Devices", "Internet of Things", "Datenschutz", "Usability"]

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
    Interests.createInterest(@form.interest).then (response) ->
      $state.go('root.profile')

  @abort = ->
    Helper.goBack()

  this