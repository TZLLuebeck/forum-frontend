angular.module('mediMeet').run ($q, PermRoleStore, User) ->

  PermRoleStore.defineRole 'anonymous', (stateParams) ->
    if User.isAuthenticated()
      false
    else
      true

  PermRoleStore.defineRole 'user', (stateParams) ->
    defer = $q.defer()
    User.getRoles().then (roles) ->
      if !roles
        defer.reject()
      if 'user' in roles
        defer.resolve()
      else
        defer.reject()
    , -> #not logged in
      defer.reject()
    defer.promise

  PermRoleStore.defineRole 'admin', (stateParams) ->
    defer = $q.defer()
    User.getRoles().then (roles) ->
      if !roles
        defer.reject()
      if 'admin' in roles
        defer.resolve()
      else
        defer.reject()
    , -> #not logged in
      defer.reject()
    defer.promise

  PermRoleStore.defineRole 'student', (stateParams) ->
    defer = $q.defer()
    User.getRoles().then (roles) ->
      if !roles
        defer.reject()
      if 'student' in roles
        defer.resolve()
      else
        defer.reject()
    , -> #not logged in
      defer.reject()
    defer.promise

  PermRoleStore.defineRole 'institute', (stateParams) ->
    defer = $q.defer()
    User.getRoles().then (roles) ->
      if !roles
        defer.reject()
      if 'institute' in roles
        defer.resolve()
      else
        defer.reject()
    , -> #not logged in
      defer.reject()
    defer.promise

  PermRoleStore.defineRole 'startup', (stateParams) ->
    defer = $q.defer()
    User.getRoles().then (roles) ->
      if !roles
        defer.reject()
      if 'startup' in roles
        defer.resolve()
      else
        defer.reject()
    , -> #not logged in
      defer.reject()
    defer.promise

  PermRoleStore.defineRole 'company', (stateParams) ->
    defer = $q.defer()
    User.getRoles().then (roles) ->
      if !roles
        defer.reject()
      if 'company' in roles
        defer.resolve()
      else
        defer.reject()
    , -> #not logged in
      defer.reject()
    defer.promise