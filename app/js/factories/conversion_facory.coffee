angular.module 'ionicstarter'

.factory 'ConversionFactory', ($http) ->
  url_base = "#{GLOBALS.API_URL}/conversions"

  get: (id) ->
    $http.post "#{url_base}/#{id}"

  getScreenUrls: (id) ->
    $http.post "#{url_base}/#{id}/screens"
