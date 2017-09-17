angular.module('mediMeet').factory 'conflictHandler', ($injector) ->

  handle = (response, deferred) ->




    deferred.reject(response)
    deferred.promise