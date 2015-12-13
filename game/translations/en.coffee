module.exports.language =
  emptyclip: "I get rid of empty cartridge."
  player_hit: [
    """
      The bullet pierces the creature's head, and it becomes water, spilling on the soil.
      But the next one is already coming out of the portal.
    """,
    """
      Robot tries to dodge but comes square under the bullet.
      He falls, spilling on soil.
    """,
    """
      The bullet tears the liquid robot apart to droplets.

      „It's a clear sky for a rain like that, don't you think?”
    """,
    """
      The enemy blows up to a little liquid droplets.
    """,
    """
      The bullet pierces the robot and vanishes inside the portal.
      There is only a pool of liquid chrome on this side.
      I see a new suicidal coming out of the green door.
      Seems like I wasn't very precise on the other side.
    """
  ]
  player_finished: [
    "I finish the robot with a shot to his heart.",
    "I finish the robot with a precise shot.",
    "The bullet pierces robot's head and he finally spills on the floor.",
  ]
  player_nicked: [
    """
      I shoot the enemy's leg off.
      He falls but keeps slowly scratch his way with his hands.
    """,
    "I shoot through the robots' arm. He stumbles but keeps going.",
  ]
  shoot: [
    "Shoot",
    "BAM!",
    "BLAM!",
    "BANG!",
    "Take a shot",
    "Push the trigger",
    "Attack",
    "Shoot 'em",
    "KILL THEM WITH PISTOL",
    "I HATE ROBOTS",
    "I. Hate. Machines.",
    "MECHANOID ANNIHILATION",
    'Destroy the mechanoids',
    "Send a bullet to robot",
    "Send a bullet with explosion",
    "Push the trigger FOR THE HUMANITY",
    "Sit down and shoot from a hip",
    "Take the pistol in both hands and push the trigger",
    "Slowly take aim and shoot",
  ]
  reload: "Reload the pistol",
  reload_response: """
    I put another clip in the pistol.
    I hope it has some ammo.
  """
  search: "Ask Christine to search for a clip"
  clips_not_found: [
    "No, nothing here.",
    "Come on, at least one! No, didn't find any.",
  ]
  enemies: 'Enemies ahead'
  clips: 'Cartridges'
  bullets: 'Bullets in clip'
  clips_found: [
    'Aha! Got one. I hope it has some ammo.',
    "Eh, here's one. Looks heavy -- I hope it has some ammo.",
  ]
  player_missed: [
    "The bullet flies over android's left arm.",
    "Android dodges the shot. It's alright, next time I won't miss.",
    "Damn! Missed.",
  ]
  trick_shot: "Try a trick shot"
  player_trickshot: [
    "
      I run against a wall and jump, shooting while flying.
      The bullet flies through android's head into another one, knocking them both out.
    ",
    "
      I notice a weak spot in the ceiling.
      A single shot there - and a section collapses, taking two enemies out.
    ",
  ]
  start: (link) -> """
    -- Tony, do you really need the pistol now?

    We are sitting together, hugging each other, on our backyard.
    Christine #{link}.
    I adjust the holster on my hip.
  """
  endintro: """
    Before I have time to open my mouth, a big green portal opens before us,
    and a large metallic humanlike robot with chrome body steps out.
    He raises his hand and aims it on Christine.

    I snatch the pistol from the holster before I comprehend a short wand in the robot's hand.
  """
  firstmove: """
    The bullet turns the thing I took for a robot in a water pillar.
    It spills on the ground, losing the wand.

    Christine tosses up her hands in *Fitnag* sign.

    „Shoot everything!”

    Almost on cue the green portal surface flickers and a chrome leg steps out.
  """
  search_response:[
    """
      „Christine! Ammo!”

      „I'm searching!”
    """
    """
      I quickly look around.
      Christine runs around the house searching for my ammo stashes.
    """,
    """
      I quickly look around.
      Christine is already searching for ammo.
    """,
    """
      I hope she can hold the barrier and search for ammo at the same time.
    """,
    """
      „Christine! Look in the freezer!”

      „I swear you and your stashes...”

      I hope she'll find at least a half-spent clip.
    """,
    """
      „Christine! In the toilet, under the cistern!”

      „Who keeps his ammo under the cistern?!”

      „Well, I don't remember, it might not be there. Please take a look!“

    """,
    """
      „Christine! I need ammo!”

      „I'm searching!”
    """,
  ]
  christine: [
    "smells like sweet, sweet honey",
    "looks far ahead, thinking about something",
    "hugging me tight, sinking her nails in my shoulder",
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
  finale_perfect:
    """
      25 выстрелов.
      Вот всё, что потребовалось.
      Была ли это невероятная удача, или вмешательство высшей силы, но ещё осталось много времени.

      Моя работа сделана.
      А теперь наш вечер вдвоём будет таким, каким он должен быть.
    """
  credits:
    """
      ### THE END

      The game uses the following public domain and CC-BY assets:

      * SpartanX109 - [Desert Eagle Fire](http://freesound.org/people/SpartanX109/sounds/89147/)
      * ngphil22 - [DEagle wCasing](http://freesound.org/people/ngphil22/sounds/233322/)
      * watupgroupie - [gunshots](http://freesound.org/people/watupgroupie/sounds/36815/)
      * Yoyodaman234 - [metal footstep 1](http://freesound.org/people/Yoyodaman234/sounds/223168/)
      * qubodup - [Bullet silhoettes](https://openclipart.org/detail/29029/bullet-silhouettes)
    """
  stats:
    """
      Thank you for finishing my game.
      Want to compare yourself against other players?
    """
  clips_not_found: [
    """
      -- Не могу найти!
    """,
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
  player_trickshot: [
    """
      Я разбегаюсь к стене и прыгаю, стреляя в полёте.
      Пуля пролетает сквозь голову робота прямо в следующего, вырубая обоих.
    """,
    """
      Я замечаю слабое место в потолке.
      Один выстрел туда -- и секция разваливается, убирая под собой двух врагов.
    """
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
  trick_shot_discover: (character) ->
    """
      I count the clips.
      Only four left.
      I've killed #{character.sandbox.killed} robots, so there are still... oh.
      OH.
      I gotta conserve the ammo.
      I can try trick shots but these are big risk.
    """
  pacifist: """
    -- Don't shoot! I'm a pacifist!

    One of the androids raises hands.
    His face is a mask of pleading.
  """
  shoot_pacifist: (link) -> """
    I shoot through his shiny metal #{link}.
    His comrades push him forward and knock him on the floor.
    The next in the corridor steps on his head and stomps on his torso.
    The weird android lies motionless, but his place is already taken by other, a normal one.
  """
  head: "head"
  arm: "arm"
  leg: "leg"
  spare_pacifist: """
    I put down the pistol.

    -- Thank you! -- cries the weird android. -- I'll surely...

    He gets knocked from behind and falls on the floor, face down.

    -- Directive A028. Deviant behaviour. Destroy.

    The following android delivers a hard blow to pacifist's nape.
    He walks over the motionless body and looks at me with his evil eyes.
    I guess the battle continues.
  """
