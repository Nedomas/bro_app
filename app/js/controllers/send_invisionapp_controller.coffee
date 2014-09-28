angular.module 'ionicstarter'

.controller 'SendInvisionappController', ($scope, $state, $stateParams) ->
  $scope.init = ->
    $scope.reroute()

  $scope.reroute = ->
    unless $scope.user.dropbox_token
      $state.go('dropbox', conversion_id: $stateParams.conversion_id)
      return

    unless $scope.user.invisionapp_email
      $state.go('invisionapp_email', conversion_id: $stateParams.conversion_id)
      return

    $state.go('invisionapp_name', conversion_id: $stateParams.conversion_id)

  $scope.init()
