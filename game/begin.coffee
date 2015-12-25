situation = require('raconteur')
undum = require('undum-commonjs')
oneOf = require('raconteur/lib/oneOf.js')
qualities = require('raconteur/lib/qualities.js')
cookie = require('tiny-cookie')

# load the translations
undumloc = require("./translations/ru.coffee").language
undum.language["ru"] = undumloc
undumloc = require("./translations/en.coffee").language
undum.language["en"] = undumloc

# jQuery is used for showing the custom controls when the player clicks on title
$ = require("jquery")
# jQuery UI is for volume slider
require('jquery-ui/slider');

Array.prototype.oneOf = () ->
  oneOf.apply(null, this)
md = require('markdown-it')
markdown = new md({
  typographer: true,
  html: true
})

# unique UUID
undum.game.id = "7a1aba32-f0fd-4e3b-ba5a-59e3fa9e6012"
# You bump the version each time you make a save-breaking bug, i.e. change the game logic.
# Comment and text changes should be fine.
undum.game.version = "3.8"

a = require('raconteur/lib/elements.js').a
# link to a different situation. Styled differently. Not used in this project.
way_to = (content, ref) -> a(content).class('way').ref(ref)
# link to a writer action. Not used in this project.
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
# usage: writemd( system, "Text to write")
writemd = (system, text) ->
  if typeof text is Function
    text = text()
  system.write(markdown.render(text))

# The first situation. It should be before is_visited because is_visited expects
# the situations array to be already initialized with something.
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
