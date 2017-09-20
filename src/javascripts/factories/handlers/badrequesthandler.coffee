angular.module('mediMeet').factory 'badrequestHandler', ($injector) ->

  handle = (response, deferred) ->

    console.log('Bad Request')
    console.log(response)


    deferred.reject(response)
    deferred.promise