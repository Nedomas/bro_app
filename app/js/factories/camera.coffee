angular.module 'ionicstarter'

.factory 'Camera', ($q) ->
  return getPicture: (options) ->
    q = $q.defer()
    navigator.camera.getPicture ((result) ->
      # Do any magic you need
      q.resolve result
      return
    ), ((err) ->
      q.reject err
      return
    ), options

    q.promise
