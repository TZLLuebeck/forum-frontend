angular.module('mediMeet').service 'SharedData', () ->

  content = {}

  setValue = (key, value) =>
    content[key] = value

  getValue = (key) =>
    return content[key]

  deleteValue = (key) =>
    content[key] = null


  setValue: setValue
  getValue: getValue
  deleteValue: deleteValue