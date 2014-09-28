angular.module 'ionicstarter'

.controller 'InvisionappNameController', ($scope, $state, $stateParams, $http) ->
  $scope.save = (invisionapp_name_form) ->
    $scope.uploadToInvisionApp(invisionapp_name_form.name).then (resp) ->
      if resp.data.success
        $state.go('successful_upload', conversion_id: $stateParams.conversion_id)
      else
        debugger

  $scope.uploadToInvisionApp = (app_name) ->
    $http.post GLOBALS.API_URL + "/conversions/#{$stateParams.conversion_id}/upload_to_invisionapp",
      invisionapp_name: app_name
