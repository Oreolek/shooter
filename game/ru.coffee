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
  intro: (link) -> """
  -- Проклятье, они продолжают идти!

  Узкий коридор, я и непрекращающаяся очередь сверкающих белоснежной кожей андроидов.
  Я уверен, что я представлял этот Новый Год совершенно не так.

  Один ящик андроидов содержит тридцать пять машин.
  Это будет длинная битва.
  """
  androidattack: "Один из андроидов доходит до меня и кусает!"
  emptyclip: "Я выбрасываю пустой картридж."
  player_hit:[
    "Голова андроида взрывается снопом сверкающих искр.",
    "Андроид пытается увернуться, но попадает точнёхонько под пулю. Он падает, разливая масло на пол."
  ]
  player_finished:[
    "Я добиваю андроида выстрелом в сердце.",
    "Я добиваю андроида точным выстрелом",
    "Пуля пробивает голову андроида, и он наконец падает на пол без движения.",
  ]
  player_nicked:[
    "Я отстреливаю ногу врага. Он падает, но продолжает медленно царапать путь ко мне руками."
    "Я простреливаю руку андроида. Он пошатывается, но продолжает идти."
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
    "НЕНАВИЖУ АНДРОИДОВ",
    "АННИГИЛЯЦИЯ МЕХАНОИДОВ",
    "Уничтожить механоидов",
    "Отправить пулю в андроида",
    "Послать пулю взрывом",
    "Нажать на курок во имя ЧЕЛОВЕЧЕСТВА",
    "Прыгнуть к стене и выстрелить из пистолета в полёте",
    "Присесть и выстрелить с колена",
    "Взять пистолет в обе руки и нажать на курок",
    "Не спеша прицелиться и выстрелить",
  ]
  reload: "Перезарядить пистолет"
  reload_response: "Я вставляю другой картридж в пистолет. Надеюсь, в нём есть патроны."
  search: "Искать чужие картриджи"
  search_response:[
    "Я в спешке шарю по полу, пытаясь найти хотя бы один целый картридж.",
    "Я быстро оглядываюсь в поисках картриджей на полу.",
  ]
  finale:
    """
    Ба-бах!

    Последний андроид внезапно взрывается, как будто нашпигованный динамитом.
    А, впрочем, с этими машинами никогда не знаешь наверняка.
    Я отворачиваюсь и ухожу прочь, не обращая внимания на взрыв.

    Моя работа сделана.

    <h3>КОНЕЦ</h3>

    В игре использованы следующие звуковые эффекты и изображения в общественном достоянии и под лицензией CC-BY:

    * SpartanX109 - [Desert Eagle Fire](http://freesound.org/people/SpartanX109/sounds/89147/)
    * ngphil22 - [DEagle wCasing](http://freesound.org/people/ngphil22/sounds/233322/)
    * watupgroupie - [gunshots](http://freesound.org/people/watupgroupie/sounds/36815/)
    * Yoyodaman234 - [metal footstep 1](http://freesound.org/people/Yoyodaman234/sounds/223168/)
    * qubodup - [Bullet silhoettes](https://openclipart.org/detail/29029/bullet-silhouettes)
    """
  finale_perfect: """
    35 выстрелов.
    Вот всё, что потребовалось.
    Была ли это невероятная удача, или вмешательство высшей силы, но ещё осталось много времени.

    Моя работа сделана.
    А теперь Новый Год будет таким, каким он должен быть.

    <h3>КОНЕЦ</h3>

    В игре использованы следующие звуковые эффекты и изображения в общественном достоянии и под лицензией CC-BY:

    * SpartanX109 - [Desert Eagle Fire](http://freesound.org/people/SpartanX109/sounds/89147/)
    * ngphil22 - [DEagle wCasing](http://freesound.org/people/ngphil22/sounds/233322/)
    * watupgroupie - [gunshots](http://freesound.org/people/watupgroupie/sounds/36815/)
    * qubodup - [Bullet silhoettes](https://openclipart.org/detail/29029/bullet-silhouettes)
  """
  clips_not_found:[
    "Нет, ничего нет.",
    "Ну хотя бы один! Нет, не нашёл."
  ]
  enemies: 'Врагов впереди'
  clips: 'Картриджей с патронами'
  bullets: 'Патронов в картридже'
  clips_found:[
    "Ага! Есть один. Надеюсь, в нём есть патроны.",
    "А, вот какой-то. На вес тяжёлый -- надеюсь, в нём есть патроны."
  ]
  player_missed:[
    "Пуля пролетает над левым плечом андроида.",
    "Андроид вовремя уворачивается от выстрела. Ничего, в следующий раз я не промахнусь.",
    "Чёрт! Промазал."
  ]
  trick_shot: "Попробовать хитрый выстрел",
  trick_shot_discover: (character) ->
    """
      Я пересчитываю картриджи.
      Осталось всего четыре.
      Я убил #{character.sandbox.killed} андроидов, то есть, впереди ещё... ой.
      ОЙ.
      Надо экономить патроны.
      Я могу попробовать хитрые выстрелы, но это -- большой риск.
    """
  player_trickshot: [
    """Я разбегаюсь к стене и прыгаю, стреляя в полёте.
    Пуля пролетает сквозь голову андроида прямо в следующего, вырубая обоих.
    """,
    """Я замечаю слабое место в потолке.
    Один выстрел туда -- и секция разваливается, убирая под собой двух врагов.
    """
  ]
  pacifist: """
    -- Не стреляйте! Я пацифист!

    Один из андроидов поднимает руки вверх.
    На его лице написана мольба.
  """
  shoot_pacifist: (link) -> """
    Я простреливаю его блестящую металлическую #{link}.
    Его товарищи толкают вперёд и валят его на пол.
    Следующий в коридоре наступает на его голову и топчет торс.
    Странный андроид лежит без движения, но его место уже занял другой, более нормальный.
  """
  head: "голову"
  arm: "руку"
  leg: "ногу"
  spare_pacifist: """
    Я опускаю пистолет.

    -- Спасибо! -- кричит странный андроид. -- Я обязательно...

    Тут его толкают сзади, и он падает на пол лицом вниз.

    -- Директива А028. Девиантное поведение. Уничтожить.

    Андроид, следующий за ним, наносит пацифисту мощный удар в затылок.
    После этого он перешагивает через обездвиженное тело и смотрит на меня злым взглядом.
    Похоже, битва продолжается.
  """
