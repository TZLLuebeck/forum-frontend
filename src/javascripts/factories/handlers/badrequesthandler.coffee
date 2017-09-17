angular.module('mediMeet').factory 'badrequestHandler', ($injector) ->

  handle = (response, deferred) ->




    deferred.reject(response)
    deferred.promise