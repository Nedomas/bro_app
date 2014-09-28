angular.module 'ionicstarter'

.controller 'InvisionappEmailController', ($scope, $state, $stateParams, $http) ->
  $scope.save = (invisionapp_email_form) ->
    $http.post(GLOBALS.API_URL + '/users/update'
        invisionapp_email: invisionapp_email_form.email
    ).then ->
      $state.go('send_invisionapp', conversion_id: $stateParams.conversion_id)
