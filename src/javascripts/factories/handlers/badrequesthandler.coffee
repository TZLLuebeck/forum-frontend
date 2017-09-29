angular.module('mediMeet').factory 'badrequestHandler', ($injector) ->

  handle = (response, deferred) ->

    console.log('Bad Request')
    console.log(response)
    errors = {}
    for error in response.data.error
      for message in error.messages
        s = message.split(":")
        errors[s[0]] = s[1]

    deferred.reject({status: 400, errors: errors})
    deferred.promise