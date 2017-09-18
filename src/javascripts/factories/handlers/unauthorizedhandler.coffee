angular.module('mediMeet').factory 'unauthorizedHandler', ($injector) ->

  handle = (response, deferred) ->
    access  = $injector.get('TokenContainer')
    state = $injector.get('$state')
    console.log(response)
    if response.error == 'token_expired'
      access.delete()
      state.go('root.home')
    else if response.error == 'invalid_token'
      state.go('root.register')

    deferred.reject(response)
    deferred.promise