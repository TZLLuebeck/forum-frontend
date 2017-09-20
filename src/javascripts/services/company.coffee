angular.module('mediMeet').service 'Company', (mediREST, $q, Upload, Rails) ->

  createCompany = (company) ->
    defer = $q.defer()
    Upload.upload({
      url: '/api/v1/companies/'
      data: {data: company}
      }).then (response) =>
      defer.resolve(response.data)
    , (error) =>
      defer.reject(error)
    defer.promise

#  createCompany = (company) ->
#    defer = $q.defer()
#    packet = mediREST.one('companies')
#    packet.data = company
#    packet.post().then (response) =>
#      defer.resolve(response.data)
#    , (error) =>
#      defer.reject(error)
#    defer.promise

  getAll = () ->
    defer = $q.defer()
    packet = mediREST.one('companies')
    packet.get().then (response) =>
      defer.resolve(response.data)
    , (error) =>
      defer.reject(error)
    defer.promise

  getApproved = () ->
    defer = $q.defer()
    packet = mediREST.one('companies').one('approve')
    packet.get().then (response) =>
      defer.resolve(response.data)
    , (error) =>
      defer.reject(error)
    defer.promise

  getOne = (id) ->
    defer = $q.defer()
    packet = mediREST.one('companies')
    packet.id = id
    packet.get().then (response) =>
      defer.resolve(response)
    , (error) =>
      defer.reject(error)
    defer.promise

  update = (company) ->
    defer = $q.defer()
    Upload.upload({
      url: '/api/v1/companies/'+company.id
      data: {data: company}
      method: 'PUT'
      }).then (response) =>
        defer.resolve(response.data)
      , (error) =>
        defer.reject(error)
    defer.promise

  approve = (id) ->
    defer = $q.defer()
    packet = mediREST.one('companies').one('approve')
    packet.id = id
    packet.put().then (response) =>
      defer.resolve(response)
    , (error) =>
      defer.reject(error)
    defer.promise

  destroy = (id) ->
    defer = $q.defer()
    packet = mediREST.one('companies')
    packet.id = id
    packet.remove().then (response) =>
      defer.resolve(response)
    , (error) =>
      defer.reject(error)
    defer.promise

  createCompany: createCompany
  getAll: getAll
  getApproved: getApproved
  getOne: getOne
  update: update
  approve: approve
  destroy: destroy