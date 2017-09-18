angular.module('mediMeet').factory 'unauthorizedHandler', ($injector) ->

  handle = (response, deferred) ->
    access  = $injector.get('TokenContainer')
    state = $injector.get('$state')
    if response.data.error.error.name == 'token_expired'
      access.delete()
      state.go('root.home')
    else if response.data.error.error.name == 'invalid_token'
      access.delete()
      state.go('root.register')

    deferred.reject(response)
    deferred.promise