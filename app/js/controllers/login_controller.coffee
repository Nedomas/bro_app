angular.module 'ionicstarter'

.controller 'LoginController', ($scope, $auth, $state) ->
#   $scope.handleLoginBtnClick = ->
#     $auth.submitLogin($scope.loginForm)
#
  $scope.$on 'auth:login-success', (ev, resp) ->
    $state.go('photo')

  $scope.$on 'auth:login-error', (ev, reason) ->
    debugger
