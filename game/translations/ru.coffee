module.exports.language =
  terrible: "ужасно",
  poor: "бедно",
  mediocre: "средне",
  fair: "нормально"
  good: "хорошо"
  great: "прекрасно"
  superb: "идеально"
  yes: "да"
  no: "нет"
  no_group_definition: "Невозможно найти определение группы {id}."
  link_not_valid: "Ссылка '{link}' не  выглядит  правильной."
  link_no_action: "Ссылка с ситуацией '.' должна иметь действие."
  unknown_situation: "Вы не можете переместиться в неизвестную ситуацию {id}."
  no_current_situation: "Я не могу отобразить, потому что у нас нет текущей ситуации."
  no_local_storage: "Локальное хранилище недоступно."
  random_seed_error: "Вы должны задать верное случайное зерно."
  random_error: "Проинициализируйте Random с непустым зерном перед использованием."
  dice_string_error: "не могу интерпретировать вашу cтроку кубиков: '{string}'."
  erase_message: "Это навсегда удалит вашего персонажа и немедленно вернёт вас на старт игры. Вы уверены?"
  start: (link) -> """
  -- Антоша, тебе правда сейчас нужен пистолет?

  Мы сидим, обнявшись, во дворе нашего дома.
  Кристина #{link}.
  Я поправляю кобуру на поясе.
  """
  endintro: """
  Раньше, чем я успеваю открыть рот, перед нами открывается большой зелёный портал,
  из которого выходит высокий металлический человекоподобный робот с хромированным телом.
  Он поднимает руку и наставляет её на Кристину.

  Я выхватываю пистолет раньше, чем я успеваю увидеть короткую палочку в руке робота.
  """
  firstmove: """
    То, что я принял за робота, при попадании пули превращается в столб воды.
    Он разливается по земле, потеряв палочку.

    Кристина вскидывает руки в знак <i>Фитнаг.</i>

    -- Стреляй во всё!

    Как по команде, зелёная поверхность портала дрожит, и оттуда шагает хромированная нога.
  """
  emptyclip: "Я выбрасываю пустой картридж."
  player_hit:[
    """
    Пуля прошивает голову существа, и оно превращается в воду, проливаясь на землю.
    Но из портала уже выходит следующее.
    """,
    """
    Робот пытается увернуться, но попадает точнёхонько под пулю.
    Он падает, разливаясь на землю.
    """,
    """
    Пуля разрывает жидкого робота на капли.

    -- Слишком чистое небо для дождя, тебе не кажется?
    """,
    """Враг разлетается на мелкие жидкие кусочки.""",
    """
      Пуля пролетает сквозь робота и исчезает внутри портала.
      На этой стороне остаётся только лужица жидкого хрома.
      Судя по новому смертнику, выходящему из зелёной двери,
      на той стороне я был не настолько точен.
    """
  ]
  player_finished:[
    "Я добиваю робота выстрелом в сердце.",
    "Я добиваю врага точным выстрелом",
    "Пуля пробивает голову робота, и он наконец разливается на пол.",
  ]
  player_nicked:[
    "Я отстреливаю ногу врага. Он падает, но продолжает медленно царапать путь ко мне руками."
    "Я простреливаю руку робота. Он пошатывается и капает на землю, но продолжает идти."
  ]
  shoot:[
    "Выстрел",
    "Бдыщь!",
    "Выстрелить",
    "Нажать на курок",
    "Атака",
    "Стрельба",
    "СТРЕЛЯТЬ!",
    "УБИТЬ ИХ ИЗ ПИСТОЛЕТА",
    "НЕНАВИЖУ РОБОТОВ",
    "АННИГИЛЯЦИЯ МЕХАНОИДОВ",
    "Уничтожить механоидов",
    "Отправить пулю в робота",
    "Послать пулю взрывом",
    "Нажать на курок во имя ЧЕЛОВЕЧЕСТВА",
    "Присесть и выстрелить с колена",
    "Взять пистолет в обе руки и нажать на курок",
    "Не спеша прицелиться и выстрелить",
  ]
  reload: "Перезарядить пистолет"
  reload_response: "Я вставляю другой картридж в пистолет. Надеюсь, в нём есть патроны."
  search: "Попросить Кристину поискать картриджи"
  search_response:[
    """
      -- Кристина! Патроны!

      -- Ищу!
    """
    "Я быстро оглядываюсь. Кристина бегает по дому в поисках моих заначек с патронами.",
    "Я быстро оглядываюсь. Кристина уже ищет патроны.",
    "Я надеюсь, она может держать барьер и искать патроны одновременно.",
    """
      -- Кристина! Посмотри в морозилке!

      -- Я клянусь, что ты и твои заначки...

      Я надеюсь, она найдёт хотя бы наполовину потраченный картридж.
    """,
    """
      -- Кристина! В туалете, под сливным бачком!

      -- Кто хранит патроны под сливным бачком?!

      -- Ну я не помню, может, там уже их нет. Посмотри, прошу!
    """,
    """
      -- Кристина! Мне нужны патроны!

      -- Ищу!
    """,
  ]
  finale:
    """
    Ко мне подходит Кристина.
    Она обнимает меня и целует.

    -- Мой герой.

    -- Тебе помочь закрыть портал?

    -- Я сама виновата.
    Не вспомнила про такую простую защиту.

    -- Ну, ты могла бы в другой раз не унижать так много волшебников сразу.
    Возможно, они бы не прислали своих големов или как это называется.

    -- Конструкты. А ты мог бы быть лапушкой и держать свои патроны вместе с
    оружием где-нибудь в оружейном сейфе.

    -- А если...

    -- А ты поставь второй секретный сейф.

    -- Сделаю. Так что, мы ещё успеваем закончить романтический вечер?

    -- Ты обещаешь быть жестоким и безоружным?

    -- Я буду чист и многозаряден.

    Я поцеловал Кристину и оставил её рядом с зелёным порталом.
    Думаю, мне не надо беспокоиться за её безопасность.
    Она может остановить любые пули и заклинания.

    И всё-таки я оставлю тайник на чердаке с ракетами на всякий случай.
    """
  finale_perfect: """
    25 выстрелов.
    Вот всё, что потребовалось.
    Была ли это невероятная удача, или вмешательство высшей силы, но ещё осталось много времени.

    Моя работа сделана.
    А теперь наш вечер вдвоём будет таким, каким он должен быть.
  """
  credits: """
    <h3>КОНЕЦ</h3>

    В игре использованы следующие звуковые эффекты и изображения в общественном достоянии и под лицензией CC-BY:

    * SpartanX109 - [Desert Eagle Fire](http://freesound.org/people/SpartanX109/sounds/89147/)
    * ngphil22 - [DEagle wCasing](http://freesound.org/people/ngphil22/sounds/233322/)
    * watupgroupie - [gunshots](http://freesound.org/people/watupgroupie/sounds/36815/)
    * Yoyodaman234 - [metal footstep 1](http://freesound.org/people/Yoyodaman234/sounds/223168/)
    * qubodup - [Bullet silhoettes](https://openclipart.org/detail/29029/bullet-silhouettes)
  """
  clips_not_found:[
    "-- Не могу найти!",
    """
      -- Ничего нет!

      -- Ну хотя бы один!

      -- Я держу барьер! Экономь патроны!
    """,
    """
      -- Пусто!

      -- Ты посмотрела...

      -- Да я везде уже посмотрела, нет больше твоих картриджей!

      -- Ладно, дай тогда вспомню, где ещё были заначки.
    """,
    "-- Пусто!",
    "-- Ничего!",
    "-- Вспоминай лучше! Тут чисто!",
    """
      -- Ты не можешь хранить все патроны в одном месте?!
      Их не найти!

      -- Это система!

      -- Это мания!
    """,
  ]
  enemies: 'Врагов впереди'
  clips: 'Картриджей с патронами'
  bullets: 'Патронов в картридже'
  clips_found:[
    "Ага! Есть один. Надеюсь, в нём есть патроны.",
    "А, вот какой-то. На вес тяжёлый -- надеюсь, в нём есть патроны."
  ]
  player_missed:[
    "Пуля пролетает над левым плечом робота.",
    "Робот вовремя уворачивается от выстрела. Ничего, в следующий раз я не промахнусь.",
    "Чёрт! Промазал.",
    "Мимо! Ну что за невезение.",
    "На заметку: надо чаще упражняться в стрельбе. Часто промахиваюсь.",
    "Чёрт! Почему я промазал именно сейчас?!",
  ]
  trick_shot: "Попробовать хитрый выстрел",
  trick_shot_discover: (character) ->
    """
      Я пересчитываю картриджи.
      Осталось всего четыре.
      Я убил #{character.sandbox.killed} роботов, то есть, впереди ещё... ой.
      ОЙ.
      Надо экономить патроны.
      Я могу попробовать хитрые выстрелы, но это -- большой риск.
    """
  player_trickshot: [
    """
      Я разбегаюсь и прыгаю, стреляя в полёте.
      Пуля пролетает сквозь голову робота прямо в следующего, вырубая обоих.
    """,
    """
      Я замечаю шевеление в портале.
      Пуля пронзает робота и улетает сквозь портал.
      Через зелёную дверь падает тело робота, растекаясь в полёте.
    """
  ]
  christine: [
    "пахнет сладким мёдом",
    "смотрит вдаль, о чём-то задумавшись",
    "крепко обнимает меня, впиваясь ногтями в плечо",
  ]
  pacifist: """
    -- Не стреляйте! Я пацифист!

    Один из роботов поднимает руки вверх.
    На его лице написана мольба.
  """
  shoot_pacifist: (link) -> """
    Я простреливаю его блестящую металлическую #{link}.
    Из портала выходит другой робот, который ударом ноги валит на землю товарища.
    Затем он наступает на его голову.
    Странный робот стекает в лужу, но его место уже занял другой, более нормальный.
  """
  head: "голову"
  arm: "руку"
  leg: "ногу"
  spare_pacifist: """
    Я опускаю пистолет.

    -- Спасибо! -- кричит странный робот. -- Я обязательно...

    Тут его толкают сзади, и он падает на землю лицом вниз.

    -- Директива А028. Девиантное поведение. Уничтожить.

    Робот, следующий за ним, наносит пацифисту мощный удар в затылок.
    После этого он перешагивает через свежую лужицу и смотрит на меня злым взглядом.
    Похоже, битва продолжается.
  """
  firststeps: "Это шаги? Похоже, что-то приближается по ту сторону портала."
  secondsteps: "Шаги становятся громче. Оно большое."
  thirdsteps: "Уже близко. Совсем близко."
  boss: """
    Из портала вылезает гигантская блестящая Рука.
    Она цепляется за край портала и начинает его растягивать.

    Кристина кричит:
    -- Оно слишком большое! Я не смогу удержать!

    Из растянутого портала показывается ведро.
    Это голова робота-титана, который мог бы таранить города.
    Я точно не хочу впускать его на задний двор своего дома.
  """
  shoot_boss: "Успокоить титана свинцом"
  answer1_option: "Милая, я просто за тебя беспокоюсь."
  answer1: """
    -- Милая, я просто за тебя беспокоюсь.

    -- Почему?
    Я не на работе.
    Ты не на работе.
    Вокруг дома стоит надёжная защита.
  """
  branch1_a_option: "Защиты недостаточно."
  branch1_a: """
    -- Защиты недостаточно. -- я кладу руку на рукоять пистолета.

    -- Антоша, это -- наш романтический вечер. Ты можешь оставить пистолет в доме.
  """
  branch1_b_option: "Я всегда держу его при себе."
  branch1_b: """
    -- Я всегда держу его при себе. Это нормально.

    -- Антон!
    Я три недели ждала, когда у нас наконец-то будет вечер на двоих.
    Положи пистолет и расслабься.
  """
  dlg_finale1_option: "Я и так расслаблен."
  dlg_finale1: (link) -> """
    -- О чём ты говоришь?
    Я и так расслаблен.
    Смотри, какой красивый закат, эти #{link}.
    Только ты и я, как ты и хотела.

    -- Да, но я не хочу ни в кого стрелять!
  """
  dlg_finale1_cycle: [
    "птички поют",
    "цветочки растут",
    "деревья так похожи на магические руны",
  ]
  answer2_option: "Я его даже не трогаю."
  answer2: """
    -- Я его даже не трогаю.

    -- Да, но ты держишь его рядом.
    Ты не можешь расслабиться, я чувствую.
  """
  lazy_option: "Я просто не вынимал его из кобуры."
  lazy: """
    -- Я просто не вынимал его из кобуры.
    Какое это имеет значение?

    -- Только не говори мне, что ты и на предохранитель поленился его поставить.
  """
  shoot_pacifist_option: "Убить пацифиста"
  spare_pacifist_option: "Опустить оружие"
  endintro_option: "Объясниться и помириться"
  lazy2_option: "Конечно, он на предохранителе."
  lazy2: """
    -- Конечно, он на предохранителе.
    Видишь, ничего страшного. -- я вытащил пистолет, чтобы показать ей.

    -- Антон!
    Ты вообще меня слушаешь?!
    Не трогай пистолет!

    Я со вздохом возращаю оружие в кобуру.
  """
  lazy3_option: "Я не собираюсь стрелять."
  lazy3: """
    -- Я не собираюсь стрелять.

    -- Тогда зачем ты его взял?!
  """
  dlg_finale2_option: "Это просто мой пистолет."
  dlg_finale2: """
    -- Это просто мой пистолет.
    Лучше посмотри на эти розовые облака в небе.
    Вон то похоже на зайчика, правда?

    -- О Великие Боги, у тебя и патроны с собой?!
  """
