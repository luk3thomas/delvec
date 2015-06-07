curry = require 'light-curry'

delvec = curry (str = "", object) ->
  return unless object?
  [str, object] = [object, str] if typeof object is "string"
  steps = str.toString().split(".")
  if steps.length is 1
    object[str]
  else
    delvec(steps.slice(1).join("."), object[steps[0]])

delvec.or = curry (alternative, str, object) ->
  delvec(str, object) ? alternative

((root, factory) ->
  if typeof define is 'function' and define.amd
    define([], factory)
  else if typeof exports is 'object'
    module.exports = factory()
  else
    root.delvec = factory()
)(@, -> delvec)
