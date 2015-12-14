# A first person cybertext shooter, written in Raconteur

This game code is interesting because it shows almost every Undum/Raconteur
feature there is (except for the plain action or writer links).

Here's what you can see here:

* Custom SASS styling using Bootstrap v4 framework
* Splitting your game into several CoffeeScript files
* Easy replacer cycling
* International support
* HTML5 sound effects with volume control
* Graphical effects
* Realtime events
* Menu dialogue section

#### International support
Did you know Undum has built-in i18n support?
Well, now you can see how it works in a Raconteur game.
It has about 1500 words, so it's a good example.

#### The custom styling
The default Undum styling is old and clumsy, you're supposed to write responsive CSS yourself.
The default Raconteur scaffold uses LESS preprocessing but doesn't help much.
I use SASS preprocessing + Bootstrap framework.
The UI in this particular game is stripped for simplicity but it's easy to customize.
Just don't use the progress bars.
Please.

#### Splitting your game
See `Gulpfile.js.`
The trick is to concatenate your files before every build.

#### The custom text cycling
A cycling link is a "replacer" hyperlink that replaces its contents with another text.
The game implies that a situation cannot have more than one cycling link.

The basic function for a replacer link is this:
`textcycle = (content, ref) -> a(content).replacer(ref).class("cycle").id(ref).toString()`

The `shoot_pacifist` situation uses only this function to do a text cycle.
But there's also a more advanced version.

The function `cycle` expects your situation to have a replacer action `cyclewriter`
written like this:

    cyclewriter: (character) -> cycle(this, character)

Also it expects your situation to have a `cycle_gallery` function.
This is the function that returns your text strings.

You can see how it's done in the `start` situation.

## MIT License
Copyright © 2015 Alexander Yakovlev, http://en.oreolek.ru

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
