angular.module('mediMeet').factory 'tokenInterceptor', (TokenContainer, Rails) ->
  request: (config) ->
    # Send AccessToken only to our API
    if config.url.indexOf("/api/v1/") == 0
      token = TokenContainer.get()
      if token
        config.headers['Authorization'] = "Bearer #{token}"
    config


