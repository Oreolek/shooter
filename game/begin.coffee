# copyright (c) Alexander Yakovlev 2015.
# This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
# To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0

situation = require('raconteur')
undum = require('undum-commonjs')
oneOf = require('raconteur/lib/oneOf.js')
qualities = require('raconteur/lib/qualities.js')

undumloc = require("./translations/ru.coffee").language
undum.language["ru"] = undumloc
undumloc = require("./translations/en.coffee").language
undum.language["en"] = undumloc
$ = require("jquery")
require('jquery-ui/slider');

Array.prototype.oneOf = () ->
  oneOf.apply(null, this)
md = require('markdown-it')
markdown = new md({
  typographer: true,
  html: true
})

undum.game.id = "7a1aba32-f0fd-4e3b-ba5a-59e3fa9e6012"
undum.game.version = "3.3"

a = require('raconteur/lib/elements.js').a
way_to = (content, ref) -> a(content).class('way').ref(ref)
textlink = (content, ref) -> a(content).once().writer(ref)
textcycle = (content, ref) -> a(content).replacer(ref).class("cycle").id(ref).toString()
# Cycling link. It's implied there can be only one per situation.
# Also it saves the current index in the window object, which is not okay for longer games because no saving.
# You are welcome to improve this code.
cycle = (obj) ->
  responses = obj.cycle_gallery()
  window.cycle_index ?= []
  window.cycle_index[obj.name] ?= 0
  if window.cycle_index[obj.name] == responses.length
    window.cycle_index[obj.name] = 0
  response = responses[window.cycle_index[obj.name]]
  window.cycle_index[obj.name]++
  return textcycle(response, 'cyclewriter')
writemd = (system, text) ->
  if typeof text is Function
    text = text()
  system.write(markdown.render(text))

situation "start",
  cycle_gallery: () -> "christine".l()
  content: () ->
    return "start".l()(cycle(this))
  choices: ["#start"],
  writers:
    cyclewriter: () -> cycle(this)

is_visited = (situation) ->
  situations = undum.game.situations[situation]
  if situations
    return Boolean situations.visited
  return 0

# Volume from 0 to 1
get_volume = () ->
  return ($('#slider').slider('value') - 1) / 100
