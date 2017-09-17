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
  ############################
  #
  #   Common Routes   
  #     Homepage 
  #
  ############################

  .state 'root.home',
    url: '/home'
    views:
      'notheader@':
          templateUrl: 'assets/views/common/home.html'
          controller: 'HomeCtrl'
          controllerAs: 'home'
  
  #
  #   User Routes
  #     Registration
  #
  #

  .state 'root.register',
    url: '/registration'
    views:
      'notheader@':
        templateUrl: 'assets/views/users/register.html'
        controller: 'RegistrationCtrl'
        controllerAs: 'reg'

  .state 'root.login',
    url: '/login'
    views:
      'notheader@':
        templateUrl: 'assets/views/users/login.html'
        controller: 'LoginCtrl'
        controllerAs: 'login'

  .state 'root.profile',
    url: '/user'
    params:
      id: null
    views:
      'notheader@':
        templateUrl: 'assets/views/users/profile.html'
        controller: 'ProfileCtrl'
        controllerAs: 'prfl'
  .state 'root.profile.edit',
    url: '/edit'
    params:
      id: null
    views:
      'notheader@':
        templateUrl: 'assets/views/users/user_edit.html'
        controller: 'userEditCtrl'
        controllerAs: 'usred'

  #
  #  Interest Routes
  #  Interest creation
  #
  #

  .state 'root.createpost',
    url: '/newpost'
    views:
      'notheader@':
        templateUrl: 'assets/views/interests/new_post.html'
        controller: 'newPostCtrl'
        controllerAs: 'npost'




  #
  #  Admin Routes
  #   User Management
  #
  #

  .state 'root.manage_users',
    url: '/manage/users'
    views:
      'notheader@':
        templateUrl: 'assets/views/admin/user_manager.html'
        controller: 'usermngCtrl'
        controllerAs: 'mng'
    data:
      permissions:
        only: 'newuser'
        redirectTo: 'root.home'

  .state 'root.manage_posts',
    url: '/manage/posts'
    views:
      'notheader@':
        templateUrl: 'assets/views/admin/post_manager.html'
        controller: 'postmngCtrl'
        controllerAs: 'pmng'
    data:
      permissions:
        only: 'newuser'
        redirectTo: 'root.home'