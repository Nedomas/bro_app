angular.module 'ionicstarter'

.controller 'PhotoController', ($scope, $state, $auth, Camera) ->
  debugger
  $scope.takePhoto = ->
    $scope.upload = new Dropzone '#upload',
      url: GLOBALS.API_URL + '/conversions'
      paramName: 'image'
      previewTemplate: "<div class='hidden'></div>"

    $scope.upload.on 'success', (file, resp) ->
      debugger

    $scope.upload.on 'error', (file, resp) ->
      debugger

    # Camera.getPicture().then (imageURI) ->
    #   debugger
    # , (err) ->
    #   debugger

#       @upload = new Dropzone '#upload',
#         url: App.options.api + '/conversions'
#         paramName: 'image'
#         previewTemplate: "<div class='hidden'></div>"
#         params: Core.currentUser().authData()
#
#       @upload.on 'success', (file, resp) ->
#         m.route '/cut_page/' + resp.conversion.id
#
#       @upload.on 'error', (file, resp) ->
#         debugger
#         m.route '/login'
