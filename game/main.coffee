# copyright (c) Alexander Yakovlev 2015.
# This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
# To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0

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
undumloc = require("./ru.coffee").language
undum.language["ru"] = undumloc

a = elements.a
span = elements.span
img = elements.img

undum.game.id = "7a1aba32-f0fd-4e3b-ba5a-59e3fa9e6012"
undum.game.version = "0.5"

way_to = (content, ref) -> a(content).class('way').ref(ref)
textlink = (content, ref) -> a(content).once().writer(ref)
is_visited = (situation) -> undum.game.situations[situation].visited == 1
writemd = (system, text) -> 
  if typeof text is Function
    text = text()
  system.write(markdown.render(text))

link_colour = "#B68000"

# This is an easy game.
# I'm thinking if you want more harder approach, you can:
# a) remove bullet counter (you don't know how many bullets left in a clip)
# b) remove canChoose restriction (you can shoot any time you want, but if you have no bullets - nothing comes out and you've lost a turn)

spend_bullet = (character, system) ->
  bullets = character.sandbox.clips[character.sandbox.current_clip]
  if bullets >= 1
    character.sandbox.clips[character.sandbox.current_clip]--
    system.setQuality("bullets", bullets - 1)

spend_clip = (character, system) ->
  bullets = character.sandbox.clips[character.sandbox.current_clip]
  clips = character.sandbox.clips.length
  if clips < 2
    return
  if bullets == 0
    character.sandbox.clips.splice(character.sandbox.current_clip, 1)
    clips = character.sandbox.clips.length
    writemd(system, "Я выбрасываю пустой картридж.")
    system.setQuality("clips", clips)
  if character.sandbox.current_clip < clips - 1
    character.sandbox.current_clip++
  else
    character.sandbox.current_clip = 0
  system.setQuality("bullets", character.sandbox.clips[character.sandbox.current_clip])

check_distance = (character, system) ->
  if character.sandbox.distance == 0
    system.setQuality("health", character.qualities.health - 1)
    system.writemd("Один из андроидов доходит до меня и кусает!")

situation 'start',
  content: """
  -- Проклятье, они продолжают идти!

  Узкий коридор, я и непрекращающаяся очередь сверкающих белоснежной кожей андроидов.
  Я уверен, что я представлял этот Новый Год совершенно не так.

  Один ящик андроидов содержит тридцать пять машин.
  Это будет длинная битва.
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
    character.sandbox.nicked = 0
    if character.qualities.enemies > 1
      system.setQuality("enemies", character.qualities.enemies - 1)
    if character.qualities.enemies == 0
      system.doLink("finale")
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
    return oneOf(
      "Выстрел",
      "Бдыщь!",
      "Выстрелить",
      "Нажать на курок",
      "Атака",
      "Стрельба",
      "СТРЕЛЯТЬ!",
      "УБИТЬ ИХ ИЗ ПИСТОЛЕТА",
      "НЕНАВИЖУ АНДРОИДОВ",
      "АННИГИЛЯЦИЯ МЕХАНОИДОВ",
      "Уничтожить механоидов",
      "Отправить пулю в андроида",
      "Послать пулю взрывом",
      "Нажать на курок во имя ЧЕЛОВЕЧЕСТВА",
      "Прыгнуть к стене и выстрелить из пистолета в полёте",
      "Присесть и выстрелить с колена",
      "Взять пистолет в обе руки и нажать на курок",
      "Не спеша прицелиться и выстрелить"
    ).randomly(system)
  canChoose: (character, system) ->
    return character.qualities.bullets > 0
  before: (character, system, from) ->
    spend_bullet(character, system)
    character.sandbox.distance = 3
    system.clearContent()
  after: (character, system, from) ->
    roll = system.rnd.dice(1,20) # d20 roll
    hit_threshold = 15
    miss_threshold = 18
    if character.qualities.health < 2
      hit_threshold = 18
    switch
      when roll < hit_threshold then system.doLink("hit")
      when roll > miss_threshold then system.doLink("miss")
      else system.doLink("nicked")

situation "reload",
  tags: ["shoot"],
  choices: ["#shoot"],
  optionText: "Перезарядить пистолет",
  canView: (character, system) ->
    return character.sandbox.seen_reload || character.qualities.bullets < 6
  canChoose: (character, system) ->
    return character.qualities.bullets < 6 and character.sandbox.clips.length > 1
  before: (character, system) ->
    character.sandbox.seen_reload = 1
    system.clearContent()
    character.sandbox.distance--
  after: (character, system) -> 
    spend_clip(character, system)
    writemd(system, "Я вставляю другой картридж в пистолет. Надеюсь, в нём есть патроны.")
    return true

situation "search",
  tags: ["shoot"],
  optionText: "Искать чужие картриджи",
  canView: (character, system) ->
    return character.sandbox.seen_search || character.qualities.clips < 5
  canChoose: (character, system) ->
    return character.qualities.clips < 5
  before: (character, system) ->
    system.clearContent()
    character.sandbox.seen_search = 1
    character.sandbox.distance--
  after: (character, system) ->
    response = oneOf(
      "Я в спешке шарю по полу, пытаясь найти хотя бы один целый картридж.",
      "Я быстро оглядываюсь в поисках картриджей на полу."
    ).randomly(system)
    writemd(system, response())
    roll = system.rnd.dice(1,20) # d20 roll
    find_threshold = 10
    if character.qualities.health < 2
      find_threshold += 2
    if character.sandbox.distance < 2
      find_threshold += 2
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
    response = oneOf(
      "Ага! Есть один. Надеюсь, в нём есть патроны.",
      "А, вот какой-то. На вес тяжёлый -- надеюсь, в нём есть патроны."
    ).randomly(system)
    return response()

situation "not_found",
  choices: ["#shoot"],
  content: (character, system, from) ->
    response = oneOf(
      "Нет, ничего нет.",
      "Ну хотя бы один! Нет, не нашёл."
    ).randomly(system)
    return response()

situation "finale",
  content: """
  Ба-бах!
  
  Последний андроид внезапно взрывается, как будто нашпигованный взрывчаткой.
  А, впрочем, с этими машинами никогда не знаешь наверняка.
  Я отворачиваюсь и ухожу прочь, не обращая внимания на взрыв.

  Моя работа сделана.

  <center><h3>КОНЕЦ</h3></center>
  """,

qualities
  head:
    bullets: qualities.integer('Патронов в картридже'),
    clips: qualities.integer('Картриджей с патронами'),
    enemies: qualities.integer('Врагов впереди'),
    health: qualities.fudgeAdjectives('Здоровье'),

undum.game.init = (character, system) ->
  system.setQuality("bullets", 6)
  system.setQuality("clips", 6)
  system.setQuality("enemies", 35)
  system.setQuality("health", 3)
  character.sandbox.clips = [5,5]#[6,6,6,6,6,6]
  character.sandbox.current_clip = 0
  character.sandbox.nicked = 0
  character.sandbox.distance = 3
  character.sandbox.seen_reload = 0
  character.sandbox.seen_search = 0

window.onload = undum.begin
