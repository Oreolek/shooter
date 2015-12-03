# copyright (c) Alexander Yakovlev 2015.
# This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
# To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0

situation = require('raconteur')
undum = require('undum-commonjs')
oneOf = require('raconteur/lib/oneOf.js')
elements = require('raconteur/lib/elements.js')
qualities = require('raconteur/lib/qualities.js')
md = require('markdown-it')
markdown = new md({
  typographer: true,
  html: true
})
undumloc = require("./ru.coffee").language
undum.language["ru"] = undumloc
undumloc = require("./en.coffee").language
undum.language["en"] = undumloc
$ = require("jquery")

a = elements.a
span = elements.span
img = elements.img

undum.game.id = "7a1aba32-f0fd-4e3b-ba5a-59e3fa9e6012"
undum.game.version = "1.0"

way_to = (content, ref) -> a(content).class('way').ref(ref)
textlink = (content, ref) -> a(content).once().writer(ref)
# The next line doesn't work for whatever reason:
#textcycle = (content, ref) -> span(a(content).replacer(ref)).class("cycle").id(ref)
textcycle = (content, ref) -> "<span id='#{ref}' class='cycle'><a href='./_replacer_#{ref}'>#{content}</a></span>"
is_visited = (situation) -> undum.game.situations[situation].visited == 1
writemd = (system, text) ->
  if typeof text is Function
    text = text()
  system.write(markdown.render(text))
Array.prototype.oneOf = () ->
  oneOf.apply(null, this)

# This is an easy game.
# I'm thinking if you want more harder approach, you can:
# a) remove bullet counter (you don't know how many bullets left in a clip)
# b) remove canChoose restriction (you can shoot any time you want, but if you have no bullets - nothing comes out and you've lost a turn)

kill_enemy = (character, system) ->
  if character.qualities.enemies == 0
    return
  character.sandbox.nicked = 0
  character.sandbox.killed++
  if character.qualities.enemies >= 1
    system.setQuality("enemies", character.qualities.enemies - 1)
  if character.qualities.enemies == 0
    system.doLink("finale")

spend_bullet = (character, system) ->
  bullets = character.sandbox.clips[character.sandbox.current_clip]
  character.sandbox.shots++
  if bullets >= 1
    coin = system.rnd.randomInt(1,2)
    audio = 'shot1'
    if coin == 2
      audio = 'shot2'
    audio = document.getElementById(audio)
    audio.currentTime=0
    audio.play()
    character.sandbox.clips[character.sandbox.current_clip]--
    bullets--
    system.setQuality("bullets", bullets)
    $("#clip img").attr("src", "img/clip"+bullets+".png")

spend_clip = (character, system) ->
  bullets = character.sandbox.clips[character.sandbox.current_clip]
  clips = character.sandbox.clips.length
  if clips < 2
    return
  audio = document.getElementById("reload")
  audio.currentTime=0
  audio.play()
  if bullets == 0
    character.sandbox.clips.splice(character.sandbox.current_clip, 1)
    clips = character.sandbox.clips.length
    writemd(system, "emptyclip".l())
    system.setQuality("clips", clips)
  if character.sandbox.current_clip < clips - 1
    character.sandbox.current_clip++
  else
    character.sandbox.current_clip = 0
  bullets = character.sandbox.clips[character.sandbox.current_clip]
  system.setQuality("bullets", bullets)
  $("#clip img").attr("src", "img/clip"+bullets+".png")
  if character.sandbox.killed > 15 and character.sandbox.seen_pacifist == 0
    system.doLink("pacifist")
    character.sandbox.seen_pacifist = 1

situation 'start',
  content: "intro".l(),
  choices: ["#shoot"],

situation "hit",
  content: (character, system, from) ->
    response = "player_hit".l().oneOf().randomly(system)
    return response()
  choices: ["#shoot"]
  before: (character, system, from) ->
    kill_enemy(character, system)
  choices: ["#shoot"]

situation "nicked",
  content: (character, system, from) ->
    if character.sandbox.nicked == 1
      kill_enemy(character, system)
      response = "player_finished".l().oneOf().randomly(system)
      return response()
    else
      character.sandbox.nicked = 1
      response = "player_nicked".l().oneOf().randomly(system)
      return response()
  choices: ["#shoot"]

situation "miss",
  content: (character, system, from) ->
    response = "player_missed".l().oneOf().randomly(system)
    return response()
  choices: ["#shoot"]

situation "trick",
  before: (character, system, from) ->
    kill_enemy(character, system)
    kill_enemy(character, system)
  content: (character, system, from) ->
    response = "player_trickshot".l().oneOf().randomly(system)
    return response()
  choices: ["#shoot"]

situation "shoot",
  tags: ["shoot"],
  optionText: (character, system, from) ->
    return "shoot".l().oneOf().randomly(system)
  canChoose: (character, system) ->
    return character.qualities.bullets > 0
  before: (character, system, from) ->
    spend_bullet(character, system)
    system.clearContent()
  after: (character, system, from) ->
    roll = system.rnd.dice(1,20) # d20 roll
    hit_threshold = 15
    miss_threshold = 18
    switch
      when roll < hit_threshold then system.doLink("hit")
      when roll > miss_threshold then system.doLink("miss")
      else system.doLink("nicked")

situation "trick_shot",
  tags: ["shoot"],
  optionText: (character, system, from) ->
    return "trick_shot".l()
  canView: (character, system) ->
    return character.sandbox.trick_shot == 1
  canChoose: (character, system) ->
    return character.qualities.bullets > 0
  before: (character, system, from) ->
    spend_bullet(character, system)
    system.clearContent()
  after: (character, system, from) ->
    roll = system.rnd.dice(1,20) # d20 roll
    trick_threshold = 5
    hit_threshold = 12
    miss_threshold = 16
    switch
      when roll < trick_threshold then system.doLink("trick")
      when roll < hit_threshold then system.doLink("hit")
      when roll > miss_threshold then system.doLink("miss")
      else system.doLink("nicked")

situation "reload",
  tags: ["shoot"],
  choices: ["#shoot"],
  optionText: "reload".l(),
  canView: (character, system) ->
    return character.sandbox.seen_reload || character.qualities.bullets < 6
  canChoose: (character, system) ->
    return character.qualities.bullets < 6 and character.sandbox.clips.length > 1
  before: (character, system) ->
    character.sandbox.seen_reload = 1
    system.clearContent()
  after: (character, system) ->
    spend_clip(character, system)
    writemd(system, "reload_response".l())
    if character.sandbox.trick_shot == 0 and character.sandbox.clips.length == 4
      character.sandbox.trick_shot = 1
      writemd(system, "trick_shot_discover".l()(character))
    return true

situation "search",
  tags: ["shoot"],
  optionText: "search".l(),
  canView: (character, system) ->
    return character.sandbox.seen_search || character.qualities.clips < 5
  canChoose: (character, system) ->
    return character.qualities.clips < 5
  before: (character, system) ->
    system.clearContent()
    character.sandbox.seen_search = 1
  after: (character, system) ->
    response = "search_response".l().oneOf().randomly(system)
    writemd(system, response())
    roll = system.rnd.dice(1,20) # d20 roll
    find_threshold = 10
    if roll < find_threshold
      system.doLink("found")
    else
      system.doLink("not_found")

situation "found",
  choices: ["#shoot"],
  before: (character, system, from) ->
    bullets = system.rnd.randomInt(2,4)
    character.sandbox.clips[character.sandbox.clips.length] = bullets
    system.setQuality("clips", character.sandbox.clips.length)
  content: (character, system, from) ->
    response = "clips_found".l().oneOf().randomly(system)
    return response()

situation "not_found",
  choices: ["#shoot"],
  content: (character, system, from) ->
    response = "clips_not_found".l().oneOf().randomly(system)
    return response()

situation "finale",
  content: (character, system) ->
    if character.sandbox.shots < 36
      return "finale_perfect".l()
    return "finale".l()

situation "pacifist",
  choices: ["#pacifist"],
  content: (character, system) ->
    return "pacifist".l()

situation "shoot_pacifist",
  optionText: "Убить пацифиста",
  tags: "pacifist",
  choices: ["#shoot"],
  before: (character, system) ->
    character.sandbox.shot_pacifist = 1
  content: (character, system) ->
    link = textcycle("head".l(), "leg")
    console.log(link)
    return "shoot_pacifist".l()(link)
  writers:
    head: textcycle("head".l(), "leg")
    leg: textcycle("leg".l(), "arm")
    arm: textcycle("arm".l(), "head")

situation "spare_pacifist",
  optionText: "Опустить оружие",
  tags: "pacifist",
  before: (character, system) ->
    character.sandbox.shot_pacifist = 0
  choices: ["#shoot"],
  content: (character, system) ->
    return "spare_pacifist".l()

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
  $("#title").click(() ->
    $("#clip").fadeIn()
  )

window.onload = undum.begin
