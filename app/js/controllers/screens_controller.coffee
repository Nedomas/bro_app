angular.module 'ionicstarter'

.controller 'ScreensController', ($scope, $state, $stateParams, $http, ConversionFactory) ->
  $scope.screen_urls = []

  $scope.init = ->
    $scope.downloadScreens()

  $scope.downloadScreens = ->
    ConversionFactory.getScreenUrls($stateParams.conversion_id).then($scope.setScreenUrls)

  $scope.setScreenUrls = (resp) ->
    $scope.screen_urls = _.map resp.data.conversion.screen_urls, (screen_path) ->
      "#{GLOBALS.BACKEND_URL}#{screen_path}"

  $scope.sendToInvisionApp = ->
    $state.go('send_invisionapp', conversion_id: $stateParams.conversion_id)

  $scope.init()
