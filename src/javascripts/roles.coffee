angular.module('mediMeet').run ($q, PermRoleStore, User) ->

  PermRoleStore.defineRole 'anonymous', (stateParams) ->
    defer = $q.defer()
    if User.isAuthenticated()
      defer.reject()
    else
      defer.resolve()
    defer.promise

  PermRoleStore.defineRole 'registered', (stateParams) ->
    defer = $q.defer()
    User.getRoles().then (roles) ->
      if !roles
        defer.reject()
      for role in ['admin', 'student', 'institute', 'company', 'klinik']
        if role in roles
          defer.resolve()
          break;
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

  PermRoleStore.defineRole 'klinik', (stateParams) ->
    defer = $q.defer()
    User.getRoles().then (roles) ->
      if !roles
        defer.reject()
      if 'klinik' in roles
        defer.resolve()
      else
        defer.reject()
    , -> #not logged in
      defer.reject()
    defer.promise