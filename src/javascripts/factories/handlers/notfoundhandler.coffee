angular.module('mediMeet').factory 'notfoundHandler', ($injector) ->

  handle = (response, deferred) ->




    deferred.reject(response)
    deferred.promise