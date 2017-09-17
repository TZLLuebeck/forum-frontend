angular.module('mediMeet').factory 'unauthorizedHandler', ($injector) ->

  handle = (response, deferred) ->
    access  = $injector.get('TokenContainer')
    state = $injector.get('$state')
    if access.get()
      access.delete()
      state.go('root.home')
    else
      state.go('root.register')

    deferred.reject(response)
    deferred.promise