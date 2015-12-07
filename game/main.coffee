# copyright (c) Alexander Yakovlev 2015.
# This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
# To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0

situation = require('raconteur')
undum = require('undum-commonjs')
oneOf = require('raconteur/lib/oneOf.js')
qualities = require('raconteur/lib/qualities.js')

undumloc = require("./ru.coffee").language
undum.language["ru"] = undumloc
undumloc = require("./en.coffee").language
undum.language["en"] = undumloc
$ = require("jquery")
Array.prototype.oneOf = () ->
  oneOf.apply(null, this)

undum.game.id = "7a1aba32-f0fd-4e3b-ba5a-59e3fa9e6012"
undum.game.version = "2.0"

qualities
  head:
    bullets: qualities.integer("bullets".l()),
    clips: qualities.integer("clips".l()),
    enemies: qualities.integer("enemies".l()),

undum.game.init = (character, system) ->
  system.setQuality("bullets", 6)
  system.setQuality("clips", 6)
  system.setQuality("enemies", 35)
  character.sandbox.clips = [6,6,6,6,6,6]
  character.sandbox.current_clip = 0
  character.sandbox.nicked = 0
  character.sandbox.seen_reload = 0
  character.sandbox.seen_search = 0
  character.sandbox.trick_shot = 0
  character.sandbox.shots = 0
  character.sandbox.killed = 0
  character.sandbox.seen_pacifist = 0
  character.sandbox.shot_pacifist = undefined
  window.is_visited = (situation) -> undum.game.situations[situation].visited == 1
  $("#title").click(() ->
    $("#clip").fadeIn()
  )
  # setInterval( () ->
  #  console.log( 'Character object:', character )
  #, 1000 );

require("./gameplay.coffee")
require("./story.coffee")

window.onload = undum.begin
