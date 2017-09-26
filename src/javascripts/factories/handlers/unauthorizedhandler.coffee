angular.module('mediMeet').factory 'unauthorizedHandler', ($injector) ->

  handle = (response, deferred) ->
    access  = $injector.get('TokenContainer')
    state = $injector.get('$state')
    console.log(response)
    if response.data.error.error.name == 'invalid_token' 
      console.log("Token invalid:")
      if response.data.error.reason = 'expired'
        console.log("Token expired.")
        access.delete()
      else
        console.log("No Token.")
        access.delete()
        state.go('root.register')

    deferred.reject(response)
    deferred.promise