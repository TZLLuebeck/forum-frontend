angular.module('mediMeet').config ($stateProvider, $urlRouterProvider, $locationProvider) ->
  console.log("Configuring Routes.")
  $urlRouterProvider.otherwise ($injector) -> 
    $state = $injector.get("$state");
    $state.go('root.home');


  $locationProvider.html5Mode(true)
  $locationProvider.hashPrefix('')
  
  $stateProvider
  .state 'root',
    url: ''
    abstract: true
    views:
      'header@':
        templateUrl: 'assets/views/common/nav.html'
        controller: 'NavCtrl'
        controllerAs: 'nav'
      'footer@':
        templateUrl: 'assets/views/common/footer.html'
    resolve:
      identity: (TokenContainer, User, $rootScope) ->
        if TokenContainer.get()
          User.retrieveUser().then (user) ->
            User.user = user
            console.log('User Retrieved from Token')
            $rootScope.$broadcast('user:stateChanged')

  .state 'match',
    url: '/match/{id}'
    onEnter: ($state, $stateParams) -> 
      console.log($stateParams.id)
      $state.go('root.interest.hidden', {id: $stateParams.id})
    #resolve: 
    #  direct: ($stateParams, $state) ->
    #    $state.go('root.home') unless $stateParams.id
    #    $state.go('root.interest.hidden', {id: $stateParams.id})

  ############################
  #
  #   Common Routes   
  #     Homepage
  #     Search Page
  #     Company Overview 
  #
  ############################

  .state 'root.home',
    url: '/'
    views:
      'body@':
        templateUrl: 'assets/views/common/home.html'
        controller: 'HomeCtrl'
        controllerAs: 'home'

  .state 'root.explore',
    url: '/explore'
    params:
      category: null
    views:
      'body@':
        templateUrl: 'assets/views/common/search.html'
        controller: 'SearchCtrl'
        controllerAs: 'search'
    resolve:
      category: ($stateParams, $state) ->
        if $stateParams.category
          return $stateParams.category

      initials: (Interests, $stateParams, $state) ->
        if not $stateParams.category
          $state.go('root.home') 
          return null
        Interests.getByCategory($stateParams.category).then (response) =>
          return response
        , (error) ->
          $state.go('root.home')

  .state 'root.impressum',
    url: '/impressum'
    views:
      'body@':
        templateUrl: 'assets/views/common/impressum.html'
  .state 'root.kontakt',
    url: '/kontakt'
    views:
      'body@':
        templateUrl: 'assets/views/common/kontakt.html'
  .state 'root.agb',
    url: '/nutzungsbedingungen'
    views:
      'body@':
        templateUrl: 'assets/views/common/agb.html'
  .state 'root.antimaas',
    url: '/datenschutz'
    views:
      'body@':
        templateUrl: 'assets/views/common/datenschutz.html'

  ############################
  #
  #   User Routes
  #     Registration
  #     Login
  #     View Profile
  #       Edit Profile
  #     ViewInterests
  #       View Interest
  #         Edit Interest
  #
  ############################

  .state 'root.register',
    url: '/registration'
    views:
      'body@':
        templateUrl: 'assets/views/users/register.html'
        controller: 'RegistrationCtrl'
        controllerAs: 'reg'
    resolve:
      companies: (Company) =>
        Company.getAll().then (response) ->
          return response
        , (error) ->
          return error

  .state 'root.login',
    url: '/login'
    views:
      'body@':
        templateUrl: 'assets/views/users/login.html'
        controller: 'LoginCtrl'
        controllerAs: 'login'

  .state 'forgot_password',
    url: '/password_reset'
    views:
      'body@':
        templateUrl: 'assets/views/users/password.html'
        controller: 'PasswordResetCtrl'
        controllerAs: 'reset'

  .state 'root.profile',
    url: '/account'
    params:
      id: null
    views:
      'body@':
        templateUrl: 'assets/views/users/profile.html'
        controller: 'ProfileCtrl'
        controllerAs: 'profile'
    resolve:
      mydata: (User, $stateParams, $state) ->
        User.getUserPacket($stateParams.id).then (response) -> 
          return response.data
        , (error) ->
          $state.go('root.home')

      posts: (User, $stateParams) ->
        User.getInterests($stateParams.id).then (response) ->
          return response.data
        , (error) ->
          return error

  .state 'root.profile.edit',
    url: '/edit'
    params:
      id: null
    views:
      'body@':
        templateUrl: 'assets/views/users/edit.html'
        controller: 'ProfileEditCtrl'
        controllerAs: 'predit'
    data:
      permissions:
        except: 'anonymous'
        redirectTo: 'root.home'

  ##################################
  #
  #   Interest Routes
  #     Profile Interests
  #     View Interest
  #     Edit Interest
  #
  ##################################


  .state 'root.profile.interests',
    url: '/profiles'
    views:
      'subbody@':
        templateUrl: 'assets/views/interests/list.html'
        controller: 'InterestsCtrl'
        controllerAs: 'interests'

  .state 'root.company.cmpinterests',
    url: '/companies/view/interests'
    params:
      id: null
    views:
      'subbody@':
        templateUrl: 'assets/views/interests/company.html'
        controller: 'CompanyInterestCtrl'
        controllerAs: 'cmpint'

  .state 'root.interest',
    url: ''
    abstract: true
    params:
      id: null
    views:
      'body@':
        templateUrl: 'assets/views/interests/view.html'
        controller: 'InterestCtrl'
        controllerAs: 'intrst'
    resolve:
      info: (Interests, $stateParams, $state) ->
        if($stateParams.id == null)
          $state.go('root.home')
          return 0
        Interests.getInterest($stateParams.id).then (response) =>
          return response.data
        , (error) ->
          if error.status == 401
            $state.go('root.register')
          else
            $state.go('root.home')

  .state 'root.interest.hidden',
    url: '/profile'
    templateUrl: 'assets/views/interests/hidden.html'
    controller: 'InterestHiddenCtrl'
    controllerAs: 'ctrl'

  .state 'root.interest.revealed',
    url: '/profile/contact'
    data:
      permissions:
        except: 'anonymous'
        redirectTo: 'root.interest.hidden'
    templateUrl: 'assets/views/interests/revealed.html'
    controller: 'InterestRevealedCtrl'
    controllerAs: 'ctrl'
    resolve:
      contact: (Interests, $stateParams) ->
        Interests.makeContact($stateParams.id).then (response) =>
          return response.data
        , (error) ->
          return error

  .state 'root.createinterest',
    url: '/create'
    views:
      'body@':
        templateUrl: 'assets/views/interests/create.html'
        controller: 'NewPostCtrl'
        controllerAs: 'npost'
    data:
      permissions:
        except: 'anonymous'
        redirectTo: 'root.register'

  .state 'root.interest.editinterest',
    url: '/edit'
    params:
      id: null
    data:
      permissions:
        except: 'anonymous'
        redirectTo: 'root.home'
    views:
      'body@':
        templateUrl: 'assets/views/interests/edit.html'
        controller: 'InterestEditCtrl'
        controllerAs: 'intedit'

  ##################################
  #
  #   Company Routes
  #
  #
  #
  #
  ##################################

  .state 'root.companies',
    url: '/companies'
    views:
      'body@':
        templateUrl: 'assets/views/companies/companies.html'
        controller: 'CompaniesCtrl'
        controllerAs: 'cmps'
    resolve:
      list: (Company) ->
        Company.getApproved().then (result) ->
          return result
        , (error) ->
          return []

  .state 'root.companies.company',
    url: '/view'
    views:
      'body@':
        templateUrl: 'assets/views/companies/company.html'
        controller: 'CompanyCtrl'
        controllerAs: 'cmp'
    params:
      id: null
    resolve:
      comp: (Company, $state, $stateParams) ->
        $state.go('root.companies') unless $stateParams.id
        Company.getOne($stateParams.id).then (result) ->
          return result.data
        , (error) ->
          $state.go('root.companies')

  .state 'root.companies.newcomp',
    url: '/create'
    data:
      permissions:
        only: 'admin'
        redirectTo: 'root.home'
    views:
      'body@':
        templateUrl: 'assets/views/companies/create.html'
        controller: 'NewCompanyCtrl'
        controllerAs: 'ncomp'

  .state 'root.companies.editcomp',
    url: '/edit'
    data:
      permissions:
        except: 'anonymous'
        redirectTo: 'root.home'
    views:
      'body@':
        templateUrl: 'assets/views/companies/edit.html'
        controller: 'EditCompanyCtrl'
        controllerAs: 'ecomp'
    params:
      id: null
    resolve:
      comp: (Company, Helper, $stateParams) ->
        Helper.goBack() unless $stateParams.id
        Company.getOne($stateParams.id).then (result) ->
          return result.data
        , (error) ->
          Helper.goBack()

  ##################################
  #
  #   Admin Routes
  #     User List
  #     Interest List
  #     Company List
  #     Statistics
  #
  ##################################

  .state 'root.admin',
    url: '/admin'
    abstract: true
    data:
      permissions:
        only: 'admin'
        redirectTo: 'root.home'

  .state 'root.admin.userlist',
    url: '/users'
    views:
      'body@':
        templateUrl: 'assets/views/admin/users.html'
        controller: 'UserListCtrl'
        controllerAs: 'users'
    resolve:
      users: (User) ->
        User.getAll().then (response) ->
          return response
        , (error) ->
          return error

  .state 'root.admin.usercreate',
    url: '/user/new'
    views:
      'body@':
        templateUrl: 'assets/views/admin/newuser.html'
        controller: 'AdminUserCtrl'
        controllerAs: 'usrcrt'
    resolve:
      companies: (Company) =>
        Company.getAll().then (response) ->
          return response
        , (error) ->
          return error

  .state 'root.admin.interestlist',
    url: '/profiles'
    views:
      'body@':
        templateUrl: 'assets/views/admin/interests.html'
        controller: 'InterestListCtrl'
        controllerAs: 'interests'
    resolve:
      interest: (Interests) ->
        Interests.getAll().then (response) ->
          return response
        , (error) ->
          return error

  .state 'root.admin.interestcreate',
    url: '/profiles/new'
    views:
      'body@':
        templateUrl: 'assets/views/admin/newinterest.html'
        controller: 'AdminInterestCtrl'
        controllerAs: 'intrcrt'
    resolve: 
      users: (User) ->
        User.getAll().then (response) ->
          console.log(response)
          return response
        , (error) ->
          console.log(error)
          return error

  .state 'root.admin.companylist',
    url: '/companies'
    views:
      'body@':
        templateUrl: 'assets/views/admin/companies.html'
        controller: 'CompanyListCtrl'
        controllerAs: 'companies'

  .state 'root.admin.statistics',
    url: '/statistics'
    views:
      'body@':
        templateUrl: 'assets/views/admin/statistics.html'
        controller: 'StatisticsCtrl'
        controllerAs: 'stats'