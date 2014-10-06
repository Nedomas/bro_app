angular.module 'ionicstarter'

.controller 'PhotoController', ($scope, $state, $auth, Camera) ->
  $scope.takePhoto = ->
    $scope.upload = new Dropzone '#upload',
      url: GLOBALS.API_URL + '/conversions'
      paramName: 'image'
      previewTemplate: "<div class='hidden'></div>"
      headers: $auth.retrieveData('auth_headers')

    $scope.upload.on 'success', (file, resp) ->
      $state.go('screens', conversion_id: resp.conversion.id)

    $scope.upload.on 'error', (file, resp) ->
      debugger

    # Camera.getPicture().then (imageURI) ->
    #   debugger
    # , (err) ->
    #   debugger
