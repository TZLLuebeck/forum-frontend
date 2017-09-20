angular.module('mediMeet').factory 'unauthorizedHandler', ($injector) ->

  handle = (response, deferred) ->
    access  = $injector.get('TokenContainer')
    state = $injector.get('$state')
    console.log(response)
    if response.data.error.name == 'token_expired'
      access.delete()
      state.go('root.home')
    else if response.data.error.name == 'invalid_token'
      access.delete()
      state.go('root.register')

    deferred.reject(response)
    deferred.promise