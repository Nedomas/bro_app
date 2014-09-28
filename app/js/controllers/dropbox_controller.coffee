angular.module 'ionicstarter'

.controller 'DropboxController', ($scope, $http, $state, $stateParams, dropstoreClient) ->
  $scope.authorize = ->
    # client = dropstoreClient.create(k
    # client = new Dropbox.Client(key: 'o0jzp4u5kmw5fcx')
    # driver = client.authDriver(new Dropbox.AuthDriver.Cordova())
    token = 'ioxfPIxYRf0AAAAAAAAE94i2pO2efAxcroX2H6lpRbweudSpEn9icIl-T2lw5dJ3'

    $http.post(GLOBALS.API_URL + '/dropbox/save_token'
      token: token
    ).then($scope.success)

  $scope.success = (resp) ->
    if resp.data.success
      $state.go('send_invisionapp', conversion_id: $stateParams.conversion_id)
    else
      debugger
