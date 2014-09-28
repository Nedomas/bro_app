angular.module("ionicstarter")

.config ($stateProvider, $urlRouterProvider) ->

  # Ionic uses AngularUI Router which uses the concept of states
  # Learn more here: https://github.com/angular-ui/ui-router
  # Set up the various states which the app can be in.

  # the pet tab has its own child nav-view and history
  $stateProvider

  .state 'home',
    url: '/home'
    templateUrl: 'templates/home.html'
    controller: ($state, $auth) ->
      $auth.validateUser().then (user) ->
        $state.go('photo')

  .state 'trial',
    url: '/trial'
    templateUrl: 'templates/trial.html'
    controller: 'TrialController'

  .state 'login',
    url: '/login'
    templateUrl: 'templates/login.html'
    controller: 'LoginController'

  .state 'photo',
    url: '/photo'
    templateUrl: 'templates/photo.html'
    controller: 'PhotoController'
    resolve:
      auth: ($auth) ->
        $auth.validateUser()

  .state 'cut_page',
    url: '/cut_page/:conversion_id'
    templateUrl: 'templates/cut_page.html'
    controller: 'CutPageController'
    resolve:
      auth: ($auth) ->
        $auth.validateUser()

  .state 'screens',
    url: '/screens/:conversion_id'
    templateUrl: 'templates/screens.html'
    controller: 'ScreensController'
    resolve:
      auth: ($auth) ->
        $auth.validateUser()

  .state 'send_invisionapp',
    url: '/send_invisionapp/:conversion_id'
    controller: 'SendInvisionappController'
    resolve:
      auth: ($auth) ->
        $auth.validateUser()

  .state 'dropbox',
    url: '/dropbox/:conversion_id'
    controller: 'DropboxController'
    templateUrl: 'templates/dropbox.html'
    resolve:
      auth: ($auth) ->
        $auth.validateUser()

  .state 'invisionapp_email',
    url: '/invisionapp_email/:conversion_id'
    controller: 'InvisionappEmailController'
    templateUrl: 'templates/invisionapp_email.html'
    resolve:
      auth: ($auth) ->
        $auth.validateUser()

  .state 'invisionapp_name',
    url: '/invisionapp_name/:conversion_id'
    controller: 'InvisionappNameController'
    templateUrl: 'templates/invisionapp_name.html'
    resolve:
      auth: ($auth) ->
        $auth.validateUser()

  .state 'successful_upload',
    url: '/successful_upload/:conversion_id'
    templateUrl: 'templates/successful_upload.html'
    resolve:
      auth: ($auth) ->
        $auth.validateUser()

  # if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise '/home'
