angular.module('ionicstarter')

.controller 'ScreensController', ($scope, $state, $stateParams, $http,
  ConversionFactory, $ionicSlideBoxDelegate, $timeout) ->

  $scope.screens = []

  Screen = new CRUD 'screens',
    conversion_id: $stateParams.conversion_id
  Screen.computed = (screen) ->
    full_url: "#{GLOBALS.BACKEND_URL}#{screen.url}"

  $scope.init = ->
    $scope.downloadScreens()

  $scope.downloadScreens = ->
    Screen.where().then (screens) ->
      $scope.screens = _.sortBy(screens, 'id')
      $scope.$watch('screens', (-> Screen.sync()), true)

      $timeout(->
        $ionicSlideBoxDelegate.update()
      , 0)

  $scope.sendToInvisionApp = ->
    $state.go('send_invisionapp', conversion_id: $stateParams.conversion_id)

  $scope.init()
