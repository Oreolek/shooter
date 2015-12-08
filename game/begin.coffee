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
Array.prototype.oneOf = () ->
  oneOf.apply(null, this)

undum.game.id = "7a1aba32-f0fd-4e3b-ba5a-59e3fa9e6012"
undum.game.version = "2.0"

a = require('raconteur/lib/elements.js').a
way_to = (content, ref) -> a(content).class('way').ref(ref)
textlink = (content, ref) -> a(content).once().writer(ref)
textcycle = (content, ref) -> a(content).replacer(ref).class("cycle").id(ref).toString()
writemd = (system, text) ->
  if typeof text is Function
    text = text()
  system.write(markdown.render(text))

situation "start",
  content: () ->
    return "start".l()(this.writers.smell)
  choices: ["#start"],
  writers:
    smell: textcycle("пахнет сладким мёдом", "look")
    look: textcycle("смотрит вдаль, о чём-то задумавшись", "touch")
    touch: textcycle("крепко обнимает меня, впиваясь ногтями в плечо", "smell")

is_visited = (situation) ->
  situations = undum.game.situations[situation]
  if situations
    return Boolean situations.visited
  return 0
