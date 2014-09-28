angular.module 'ionicstarter'

.controller 'CutPageController', ($scope, $state, $stateParams, $http, ConversionFactory, PageDrawer) ->
  $scope.init = ->
    $scope.getData()

  $scope.cut = ->
    $http.post(
      GLOBALS.API_URL + "/conversions/#{$stateParams.conversion_id}/cut_page",
      adjusted_coords: $scope.page_coords
    ).then ->
      $state.go('screens', conversion_id: $stateParams.conversion_id)

  $scope.getData = ->
    ConversionFactory.get($stateParams.conversion_id).then (resp) ->
      $scope.setData(resp.data.conversion)

  $scope.setData = (conversion) ->
    $scope.small_full_url = GLOBALS.BACKEND_URL + conversion.small_full_url
    $scope.page_coords = conversion.predicted_page_coords
    PageDrawer.draw($scope.small_full_url, $scope.page_coords)

  $scope.init()
