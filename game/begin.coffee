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
# You are welcome to improve this code.
cycle = (obj, character) ->
  responses = obj.cycle_gallery()
  character.sandbox.cycle_index ?= [] # initialize with empty array
  character.sandbox.cycle_index[obj.name] ?= 0 # initialize with 0
  response = responses[character.sandbox.cycle_index[obj.name]]
  character.sandbox.cycle_index[obj.name]++
  if character.sandbox.cycle_index[obj.name] == responses.length
    character.sandbox.cycle_index[obj.name] = 0
  return textcycle(response, 'cyclewriter')
writemd = (system, text) ->
  if typeof text is Function
    text = text()
  system.write(markdown.render(text))

situation "start",
  cycle_gallery: () -> "christine".l()
  content: (character) ->
    return "start".l()(cycle(this, character))
  choices: ["#start"],
  writers:
    cyclewriter: (character) -> cycle(this, character)

is_visited = (situation) ->
  situations = undum.game.situations[situation]
  if situations
    return Boolean situations.visited
  return 0

# Volume from 0 to 1
get_volume = () ->
  return ($('#slider').slider('value') - 1) / 100
