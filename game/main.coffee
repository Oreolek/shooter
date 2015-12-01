# copyright (c) Alexander Yakovlev 2015.
# Distributed under the MIT license. See LICENSE for information.

situation = require('raconteur')
undum = require('undum-commonjs')
$ = require('jquery')
oneOf = require('raconteur/lib/oneOf.js')
elements = require('raconteur/lib/elements.js')
qualities = require('raconteur/lib/qualities.js')
colour = require("color")
md = require('markdown-it')
markdown = new md({
  typographer: true,
  html: true
})

a = elements.a
span = elements.span
img = elements.img

undum.game.id = "7a1aba32-f0fd-4e3b-ba5a-59e3fa9e6012"
undum.game.version = "0.1"

way_to = (content, ref) -> a(content).class('way').ref(ref)
textlink = (content, ref) -> a(content).once().writer(ref)
is_visited = (situation) -> undum.game.situations[situation].visited == 1
writemd = (system, text) -> 
  if typeof text is Function
    text = text()
  system.write(markdown.render(text))

link_colour = "#B68000"

spend_bullet = (character, system) ->
  bullets = character.sandbox.clips[character.sandbox.current_clip]
  if bullets >= 1
    character.sandbox.clips[character.sandbox.current_clip]--
    system.setQuality("bullets", bullets - 1)

spend_clip = (character, system) ->
  clips = character.sandbox.clips.length
  bullets = character.sandbox.clips[character.sandbox.current_clip]
  if clips == 0
    return
  if bullets == 0
    character.sandbox.clips.splice(character.sandbox.current_clip, 1)
    system.setQuality("bullets", character.sandbox.clips[character.sandbox.current_clip])
    system.setQuality("clips", clips - 1)
    writemd(system, "Я выбрасываю пустой картридж.")
  else
    if character.sandbox.current_clip < clips - 1
      character.sandbox.current_clip++
    else
      character.sandbox.current_clip == 0
    system.setQuality("bullets", character.sandbox.clips[character.sandbox.current_clip])

situation 'start',
  content: """
  -- Проклятье, они продолжают идти!

  Узкий коридор, я и непрекращающаяся очередь сверкающих белоснежной кожей андроидов.
  Я уверен, что я представлял этот Новый Год совершенно не так.
  """,
  choices: ["#shoot"],

situation "hit",
  content: (character, system, from) ->
    response = oneOf(
      "Голова андроида взрывается снопом сверкающих искр.",
      "Андроид пытается увернуться, но попадает точнёхонько под пулю. Он падает, разливая масло на пол."
    ).randomly(system)
    return response()
  choices: ["#shoot"]
  before: (character, system, from) ->
    system.setQuality("enemies", character.qualities.enemies - 1)
    character.sandbox.nicked = 0
  choices: ["#shoot"]

situation "nicked",
  content: (character, system, from) ->
    if character.sandbox.nicked == 1
      system.setQuality("enemies", character.qualities.enemies - 1)
      character.sandbox.nicked = 0
      response = oneOf(
        "Я добиваю андроида выстрелом в сердце.",
        "Я добиваю андроида точным выстрелом",
        "Пуля пробивает голову андроида, и он наконец падает на пол без движения.",
      ).randomly(system)
      return response()
    else
      character.sandbox.nicked = 1
      response = oneOf(
        "Я отстреливаю ногу врага. Он падает, но продолжает медленно царапать путь ко мне руками."
        "Я простреливаю руку андроида. Он пошатывается, но продолжает идти."
      ).randomly(system)
      return response()
  choices: ["#shoot"]

situation "miss",
  content: (character, system, from) ->
    response = oneOf(
      "Пуля пролетает над левым плечом андроида.",
      "Андроид вовремя уворачивается от выстрела. Ничего, в следующий раз я не промахнусь."
    ).randomly(system)
    return response()
  choices: ["#shoot"]

situation "shoot",
  tags: ["shoot"],
  optionText: (character, system, from) ->
    response = oneOf(
      "Выстрел",
      "СТРЕЛЯТЬ!",
      "УБИТЬ ИХ ИЗ ПИСТОЛЕТА",
      "НЕНАВИЖУ АНДРОИДОВ"
    ).stopping(system)
    return response()
  canChoose: (character, system) ->
    return character.qualities.bullets > 0
  before: (character, system, from) ->
    spend_bullet(character, system)
    system.clearContent()
  after: (character, system, from) ->
    # d20 roll
    # 1-14 - hit, 15-18 - nicked, 19-20 = miss
    roll = system.rnd.randomInt(1,20)
    switch
      when roll < 15 then system.doLink("hit")
      when roll > 18 then system.doLink("miss")
      else system.doLink("nicked")

situation "reload",
  tags: ["shoot"],
  choices: ["#shoot"],
  optionText: "Перезарядить пистолет",
  canView: (character, system) ->
    return character.qualities.bullets < 6
  before: (character, system) ->
    system.clearContent()
  after: (character, system) -> 
    spend_clip(character, system)
    writemd(system, "Я вставляю другой картридж в пистолет. Надеюсь, в нём есть патроны.")
    return true

# А теперь plot twist: у пистолета есть шанс осечки и промаха. Ты теряешь патрон. Всего патронов у тебя 36, а врагов 35.

situation "finale",
  content: """
  """,

qualities
  head:
    bullets: qualities.integer('Патронов в картридже'),
    clips: qualities.integer('Картриджей с патронами'),
    enemies: qualities.integer('Врагов впереди'),

undum.game.init = (character, system) ->
  system.setQuality("bullets", 6)
  system.setQuality("clips", 6)
  system.setQuality("enemies", 35)
  character.sandbox.clips = [6,6,6,6]
  character.sandbox.current_clip = 0
  character.sandbox.nicked = 0

window.onload = undum.begin
