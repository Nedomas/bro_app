angular.module 'ionicstarter'

.controller 'PhotoController', ($scope, $state, $auth, Camera) ->
  $scope.takePhoto = ->
    if typeof FileTransfer == 'undefined'
      successfulUpload(conversion: { id: 95 })
    else
      ft = new FileTransfer()
      options = new FileUploadOptions()
      options.fileKey = 'image'
      options.headers = $auth.retrieveData('auth_headers')
      options.fileName = 'page.jpg'
      options.mimeType = 'image/jpeg'

      Camera.getPicture().then (imageURI) ->
        ft.upload(imageURI, GLOBALS.API_URL + '/conversions',
          successfulUpload, failedUpload, options)
      , (err) ->
        debugger

  successfulUpload = (resp) ->
    if _.isString(resp.response)
      conversion_id = JSON.parse(resp.response).conversion.id
      $state.go('screens', conversion_id: conversion_id)
    else
      # mocked
      $state.go('screens', conversion_id: resp.conversion.id)


  failedUpload = (resp) ->
    debugger

  #   $scope.upload = new Dropzone '#upload',
  #     url: GLOBALS.API_URL + '/conversions'
  #     paramName: 'image'
  #     previewTemplate: "<div class='hidden'></div>"
  #     headers: $auth.retrieveData('auth_headers')

  #   $scope.upload.on 'success', (file, resp) ->
  #     $state.go('screens', conversion_id: resp.conversion.id)

  #   $scope.upload.on 'error', (file, resp) ->
  #     debugger
