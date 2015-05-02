toArray = (d) -> Array.prototype.slice.call(d)

currify = (fn, args, remaining) ->
  if remaining < 1
    return fn.apply(null, args)

  ->
    currify(
      fn,
      args.slice(0, fn.length - 1).concat(toArray(arguments)),
      remaining - arguments.length
    )

curry = (fn) ->
  ->
    currify(fn, toArray(arguments), fn.length - arguments.length)

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
