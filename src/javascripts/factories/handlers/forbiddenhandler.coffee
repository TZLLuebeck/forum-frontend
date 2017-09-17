angular.module('mediMeet').factory 'forbiddenHandler', ($injector) ->

  handle = (response, deferred) ->




    deferred.reject(response)
    deferred.promise