angular.module 'ionicstarter'

.controller 'PhotoController', ($scope, $state, Camera) ->
  $scope.takePhoto = ->
    Camera.getPicture().then (imageURI) ->
      debugger
    , (err) ->
      debugger
