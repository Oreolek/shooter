###
--- Intro dialogue ---
I believe a dialogue is always a mini-game in itself.
Undum's implicit choice system is perfect for "floating modules"-type of dialogue
BUT it also means that every phrase should be a separate situation.
###

situation 'answer1',
  optionText: "answer1_option".l(),
  choices: ['#answer1'],
  tags: "start",
  canView: () -> !is_visited(this.name),
  content: "answer1".l()

situation 'branch1-a',
  optionText: "branch1_a_option".l()
  choices: ['#start'],
  tags: "answer1",
  canView: () -> !is_visited(this.name),
  content: "branch1_a".l()

situation 'branch1-b',
  optionText: "branch1_b_option".l()
  choices: ['#start'],
  tags: "answer1",
  canView: () -> !is_visited(this.name),
  content: "branch1_b".l()

situation 'dlg-intro-finale1',
  optionText: "dlg_finale1_option".l(),
  choices: ['#stage3'],
  tags: "answer2",
  canView: () -> !is_visited(this.name),
  content: (character) -> "dlg_finale1".l()(cycle(this, character)),
  cycle_gallery: () -> "dlg_finale1_cycle".l(),
  writers:
    cyclewriter: (character) -> cycle(this, character)

situation 'answer2',
  optionText: "answer2_option".l()
  choices: ['#answer2', "#stage2"],
  tags: "start",
  canView: () -> !is_visited(this.name),
  content: "answer2".l()

situation 'lazy',
  optionText: "lazy_option".l()
  choices: ['#lazy', "#stage2"],
  canView: () -> !is_visited(this.name),
  tags: "start",
  content: "lazy".l()

situation 'lazy2',
  optionText: "lazy2_option".l()
  choices: ['#stage2'],
  tags: "lazy",
  canView: () -> !is_visited(this.name),
  content: "lazy2".l()

situation 'lazy3',
  optionText: "lazy3_option".l()
  choices: ['#stage3'],
  tags: "stage2",
  canView: () -> !is_visited(this.name),
  content: "lazy3".l()

situation 'dlg-intro-finale2',
  optionText: "dlg_finale2_option".l()
  choices: ['#intro'],
  tags: "stage3",
  canView: () -> !is_visited(this.name),
  content: "dlg_finale2".l()

situation 'endintro',
  optionText: "endintro_option".l()
  content: "endintro".l()
  choices: ["#shoot"],
  tags: "intro"

## Pacifist event

situation "pacifist",
  choices: ["#pacifist"],
  content: (character, system) ->
    return "pacifist".l()

# An alternative cycle implementation.
situation "shoot_pacifist",
  optionText: "shoot_pacifist_option".l()
  tags: "pacifist",
  choices: ["#shoot"],
  before: (character, system) ->
    character.sandbox.shot_pacifist = 1
    _paq.push(['setCustomDimension', 2, character.sandbox.shot_pacifist])
  content: (character, system) ->
    link = textcycle("head".l(), "leg")
    return "shoot_pacifist".l()(link)
  writers:
    head: textcycle("head".l(), "leg")
    leg: textcycle("leg".l(), "arm")
    arm: textcycle("arm".l(), "head")

situation "spare_pacifist",
  optionText: "spare_pacifist_option".l()
  tags: "pacifist",
  before: (character, system) ->
    character.sandbox.shot_pacifist = 0
    _paq.push(['setCustomDimension', 2, character.sandbox.shot_pacifist])
  choices: ["#shoot"],
  content: (character, system) ->
    return "spare_pacifist".l()

## Finale buildup
play_step = (volume) ->
  rand = Math.random();
  step1 = document.getElementById("step1")
  step2 = document.getElementById("step2")
  audio = step1
  if rand > 0.5
    audio = step2
  audio.currentTime = 0
  audio.volume = volume
  audio.play()

situation "finale",
  before: (character, system) ->
    _paq.push(['setCustomDimension', 1, character.sandbox.shots])
    _paq.push(['setCustomDimension', 2, character.sandbox.shot_pacifist])
    _paq.push(['setCustomDimension', 3, character.sandbox.reloads])
  choices: ["#finale"],
  content: (character, system) ->
    if character.sandbox.shots < 21
      """
        #{"finale_perfect".l()}

        #{"credits".l()}
      """
    """
      #{"finale".l()}

      #{"credits".l()}
    """
