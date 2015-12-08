###
--- Intro dialogue ---
I believe a dialogue is always a mini-game in itself.
Undum's implicit choice system is perfect for "floating modules"-type of dialogue
BUT it also means that every phrase should be a separate situation.
###

situation 'answer1',
  optionText: "Милая, я просто за тебя беспокоюсь.",
  choices: ['#answer1'],
  tags: "start",
  canView: () -> !is_visited(this.name),
  content: """
    -- Милая, я просто за тебя беспокоюсь.

    -- Почему?
    Я не на работе.
    Ты не на работе.
    Вокруг дома стоит надёжная защита.
  """

situation 'branch1-a',
  optionText: "Защиты недостаточно.",
  choices: ['#start'],
  tags: "answer1",
  canView: () -> !is_visited(this.name),
  content: """
    -- Защиты недостаточно. -- я кладу руку на рукоять пистолета.

    -- Антоша, это -- наш романтический вечер. Ты можешь оставить пистолет в доме.
  """

situation 'branch1-b',
  optionText: "Я всегда держу его при себе.",
  choices: ['#start'],
  tags: "answer1",
  canView: () -> !is_visited(this.name),
  content: """
    -- Я всегда держу его при себе. Это нормально.

    -- Антон!
    Я три недели ждала, когда у нас наконец-то будет вечер на двоих.
    Положи пистолет и расслабься.
  """

situation 'dlg-intro-finale1',
  optionText: "Я и так расслаблен.",
  choices: ['#stage3'],
  tags: "answer2",
  canView: () -> !is_visited(this.name),
  content: () -> """
    -- О чём ты говоришь?
    Я и так расслаблен.
    Смотри, какой красивый закат, эти #{this.writers.birds}.
    Только ты и я, как ты и хотела.

    -- Да, но я не хочу ни в кого стрелять!
  """,
  writers:
    birds: textcycle("птички поют", "flowers"),
    flowers: textcycle("цветочки растут", "trees"),
    trees: textcycle("деревья так похожи на магические руны", "birds")

situation 'answer2',
  optionText: "Я его даже не трогаю.",
  choices: ['#answer2', "#stage2"],
  tags: "start",
  canView: () -> !is_visited(this.name),
  content: """
  -- Я его даже не трогаю.

  -- Да, но ты держишь его рядом.
  Ты не можешь расслабиться, я чувствую.
  """

situation 'lazy',
  optionText: "Я просто не вынимал его из кобуры.",
  choices: ['#lazy', "#stage2"],
  canView: () -> !is_visited(this.name),
  tags: "start",
  content: """
  -- Я просто не вынимал его из кобуры.
  Какое это имеет значение?

  -- Только не говори мне, что ты и на предохранитель поленился его поставить.
  """

situation 'lazy2',
  optionText: "Конечно, он на предохранителе.",
  choices: ['#stage2'],
  tags: "lazy",
  canView: () -> !is_visited(this.name),
  content: """
  -- Конечно, он на предохранителе.
  Видишь, ничего страшного. -- я вытащил пистолет, чтобы показать ей.

  -- Антон!
  Ты вообще меня слушаешь?!
  Не трогай пистолет!

  Я со вздохом возращаю оружие в кобуру.
  """

situation 'lazy3',
  optionText: "Я не собираюсь стрелять.",
  choices: ['#stage3'],
  tags: "stage2",
  canView: () -> !is_visited(this.name),
  content: """
  -- Я не собираюсь стрелять.

  -- Тогда зачем ты его взял?!
  """

situation 'dlg-intro-finale2',
  optionText: "Это просто мой пистолет.",
  choices: ['#intro'],
  tags: "stage3",
  canView: () -> !is_visited(this.name),
  content: """
  -- Это просто мой пистолет.
  Лучше посмотри на эти розовые облака в небе.
  Вон то похоже на зайчика, правда?

  -- О Великие Боги, у тебя и патроны с собой?!
  """,

situation 'endintro',
  optionText: "Объясниться и помириться"
  content: () ->
    return "endintro".l()
  choices: ["#shoot"],
  tags: "intro"

## Pacifist event

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
  content: (character, system) ->
    if character.sandbox.shots < 36
      return "finale_perfect".l()
    return "finale".l()
