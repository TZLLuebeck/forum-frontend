angular.module('mediMeet').service 'TokenContainer', ($localStorage, Rails, $rootScope, $timeout) ->

  ###*
   *
   *
   * @param {[type]} token [description]
  ###
  set = (response) ->
    token =
      token: response.access_token
      expiresIn: response.expires_in
      refreshToken: response.refresh_token
    currDate = +new Date()
    expiresAt = currDate + (token.expiresIn * 1000)
    $localStorage.token = angular.extend(token, { expiresAt: expiresAt })

  ###*
   *
   *
   * @return {[type]} [description]
  ###
  get = ->
    if token = _stillValid()
      token.token
    else
      null

  getRaw = ->
    if token = _stillValid()
      token
    else
      null

  _stillValid = ->
    #currDate = +new Date()
    token = $localStorage.token
    if token
      token
    else
      null

  deleteToken = ->
    delete $localStorage.token
    $timeout -> #timeout to overcome controller instantiating problem
      $rootScope.$broadcast('user:token_invalid')
      $rootScope.$broadcast('user:stateChanged')

  get: get
  getRaw: getRaw
  set: set
  delete: deleteToken
