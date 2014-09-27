angular.module 'ionicstarter'

.controller 'TrialController', ($scope, $auth, $state) ->
  $scope.$on 'auth:registration-email-success', (ev, resp) ->
    $state.go('photo')

  $scope.$on 'auth:registration-email-error', (ev, reason) ->
    debugger
