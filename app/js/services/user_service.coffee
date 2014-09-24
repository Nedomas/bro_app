angular.module('ionicstarter')

.factory 'UserService', ($http, $q) ->
  _this = this

  @innerCurrentUser = null

  @fillCurrentUser = (user_data) ->
    debugger
    @currentUser = user_data

  @toStorage = ->
    saved_attributes = [
      'email'
      'access_token'
      'last_project_name'
    ]

    debugger
    json = JSON.stringify(_.pick(this, saved_attributes))


  currentUser: null
  register: (email, password) ->
    $http.post(GLOBALS.API_URL + '/users/create', user:
      email: email
      password: password
    ).
    success((resp) ->
      _this.fillCurrentUser(resp.user)
      _this.toStorage()
      debugger
    ).
    error (resp) ->
      debugger
