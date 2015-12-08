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
