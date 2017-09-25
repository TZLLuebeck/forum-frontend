angular.module('mediMeet').service 'Interests', (mediREST, $q, Upload) ->


  #CREATE

  createInterest = (interest) ->
    defer = $q.defer()
    Upload.upload({
      url: '/api/v1/interests/'
      data: {data: interest}
      arrayKey: '[]'
      }).then (response) =>
      defer.resolve(response.data)
    , (error) =>
      defer.reject(error)
    defer.promise

    #packet = mediREST.one('interests')
    #packet.data = interest
    #packet.post().then (response) ->
    #  console.log('Interest posted')
    #  defer.resolve(response.data)
    #, (error) ->
    #  defer.reject(error.data.error)
    #defer.promise

  assignInterest = (interest) ->
    defer = $q.defer()
    Upload.upload({
      url: '/api/v1/interests/create/'
      data: {data: interest}
      arrayKey: '[]'
      }).then (response) =>
      defer.resolve(response.data)
    , (error) =>
      defer.reject(error)
    defer.promise

    #packet = mediREST.one('interests').one('create')
    #packet.data = interest
    #packet.post().then (response) ->
    #  console.log('Interest posted')
    #  defer.resolve(response.data)
    #, (error) ->
    #  defer.reject(error.data.error)
    #defer.promise

  #READ

  getAll = ->
    defer = $q.defer()
    packet = mediREST.one('interests')
    packet.get().then (response) ->
        console.log('Got Interests')
        defer.resolve(response.data)
    , (error) ->
        console.log('Interest Error')
        defer.reject(error.data.error)
    defer.promise

  getByCategory = (category) ->
    defer = $q.defer()
    packet = mediREST.one('interests').one('category')
    params = {category: category}
    packet.customGET("", params).then (response) ->
      defer.resolve(response.data)
    , (error) ->
      defer.reject(error.data)
    defer.promise

  getInterest = (id) ->
    defer = $q.defer()
    packet = mediREST.one('interests')
    packet.id = id
    packet.get().then (response) ->
      defer.resolve(response)
    , (error) ->
      defer.reject(error)
    defer.promise

  makeContact = (id) ->
    defer = $q.defer()
    packet = mediREST.one('interests').one('contact')
    packet.id = id
    packet.get().then (response) ->
      defer.resolve(response)
    , (error) ->
      defer.reject(error)
    defer.promise

  getKeywords = () ->
    defer = $q.defer()
    packet = mediREST.one('interests').one('keywords')
    packet.get().then (response) ->
      defer.resolve(response.data)
    , (error) ->
      defer.reject(error)
    defer.promise

  #UPDATE
  editInterest = (interest) ->
    defer = $q.defer()
    Upload.upload({
      url: '/api/v1/interests/'
      data: {data: interest}
      arrayKey: '[]'
      method: 'PUT'
      }).then (response) =>
        defer.resolve(response.data)
      , (error) =>
        defer.reject(error)
    defer.promise

    #packet = interest
    #packet.put().then (response) ->
    #  console.log('editInterest')
    #  defer.resolve(response)
    #, (error) ->
    #  defer.reject(error)
    #defer.promise

  #DELETE
  deleteInterest = (id) ->
    defer = $q.defer()
    packet = mediREST.one('interests')
    packet.id = id
    packet.remove().then (response) ->
      defer.resolve(response)
    , (error) ->
      defer.reject(error)
    defer.promise

  createInterest: createInterest
  assignInterest: assignInterest
  getAll: getAll
  getInterest: getInterest
  makeContact: makeContact
  getKeywords: getKeywords
  getByCategory: getByCategory
  editInterest: editInterest
  deleteInterest: deleteInterest