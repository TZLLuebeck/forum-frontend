angular.module('mediMeet').filter 'interestFilter', () =>
  (input, filter) ->
    output = []
    if !filter
      return input
    for i in input
      flag = false
      if filter.subcategory
        if i.subcategory != filter.subcategory && i.subcategory != 'Beliebig'
          flag = true
      if filter.offer
        if i.offer != filter.offer
          flag = true
      if filter.typus
        if i.typus != filter.typus
          flag = true
      if !flag
        output.push(i)
    output