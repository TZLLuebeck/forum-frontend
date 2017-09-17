angular.module('mediMeet').factory('mediREST', (Rails, Restangular) ->
  Restangular.withConfig (RestangularConfigurer) ->
    host = "#{Rails.database}"
    RestangularConfigurer.setBaseUrl('/api/v1')
    RestangularConfigurer.setDefaultHeaders({'Content-Type':'application/json'})
    RestangularConfigurer.setRequestSuffix('.json')
)

