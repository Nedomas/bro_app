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
    controller: 'HomeController'

  # if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise '/home'
