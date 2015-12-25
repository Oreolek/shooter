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
    "Send a round to robot",
    "Send a bullet with explosion",
    "Push the trigger FOR THE HUMANITY",
    "Sit down and shoot from a hip",
    "Take the pistol in both hands and push the trigger",
    "Slowly take aim and shoot",
  ]
  reload: "Reload the pistol",
  reload_response: """
    I put another cartridge in the pistol.
    I hope it has some ammo.
  """
  search: "Ask Christine to search for a cartridge"
  clips_not_found: [
    "No, nothing here.",
    "Come on, at least one! No, didn't find any.",
  ]
  enemies: 'Enemies ahead'
  clips: 'Cartridges'
  bullets: 'Rounds in cartridge'
  clips_found: [
    'Aha! Got one. I hope it has some ammo.',
    "Eh, here's one. Looks heavy -- I hope it has some ammo.",
  ]
  trick_shot: "Try a trick shot"
  player_trickshot: [
    """
      I run against a wall and jump, shooting while flying.

      The bullet flies through robot's head into another one, knocking them both out.
    """,
    """
      I notice a stir in the portal.
      The bullet pierces the robot and flies in the portal.
      A robot body falls through the green door, turning into water during the fall.
    """,
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

      I hope she'll find at least a half-spent cartridge.
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
  answer1_option: "Honey, I'm just worried about you."
  finale:
    """
      Christine comes to me.
      She hugs me and kisses.

      „My hero.“

      “Do you need help closing the portal?”

      “I'm to blame for all of this.
      I didn't reckon this simple safeguard.”

      “Well, next time you could not to humiliate so many wizards at once.
      Perhaps they wouldn't send their golems or how that's called.”

      „Constructs, my dear.
      And you could be a sweetheart and keep your ammo together with weapons
      somewhere in a gun safe.“

      „But what if...“

      „Oh, you just put a second secret safe.“

      “Will do.
      So, do we still have time to end our romantic evening?”

      “Do you promise to be violent and unarmed?”

      “I will be clean and multiсharged.”

      I kissed Christine and left her near the green portal.
      I think I don't need to worry about her safety.
      She can stop any bullets and spells.

      But still I will leave a rocket stash on the attic just in case.
    """
  finale_perfect:
    """
      25 shots.

      It's all that took.
      Was it an extraordinary luck or higher being's meddling but we still have a lot of time.

      My job is done.
      And now our evening for two will be just as it should have been.
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
  clips_not_found: [
    """
      “Can't find it!”
    """,
    """
      “Nothing here!”

      “Come on, at least one!”

      “I'm watching the shield! Conserve your shots!”
    """,
    """
      “It's empty!”

      “Did you check...”

      “Yes, I did check everything, there's no damn clip left!”

      “Okay, let me remember any more stashes.”
    """,
    "“Empty!”",
    "“Nothing!”",
    "“It's empty! Jog your memory better!”",
    """
      “Can't you keep every cartridge in one place?!
      I can't find them!”

      “It's a system!”

      “It's a mania!”
    """,
  ]
  clips_found:[
    "Aha! Here's one. I hope it's not empty.",
    "Eh, here's something. It's heavy -- there must be shells inside."
  ]
  player_missed:[
    "The bullet flies over robot's left shoulder.",
    "Robot dodges the shot. Okay, next time I won't miss."
    "Damn! Missed.",
    "Drat it! Missed.",
    "Missed! What a bad luck.",
    "Note to self: need more shooting practice. I miss a lot.",
    "Damn! Why did I miss now?!",
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
    -- Don't shoot! I'm a pacifist!

    One of the robots raises hands.
    His face is a mask of pleading.
  """
  shoot_pacifist: (link) -> """
    I shoot through his shiny metal #{link}.
    Another robot comes out the portal and knock him on the floor with a leg kick.
    Then it stomps on his head.
    The weird robot is turning into a puddle but his place is already taken by other, a normal one.
  """
  spare_pacifist: """
    I put down the pistol.

    “Thank you!” -- cries the weird robot. -- “I'll surely...”

    He gets knocked from behind and falls on the floor, face down.

    ”Directive A028. Deviant behaviour. Destroy.”

    The following robot delivers a hard blow to pacifist's nape.
    He walks over the fresh puddle and looks at me with his evil eyes.
    I guess the battle continues.
  """
  firststeps: "Are those steps? It looks like something is approaching on the other side of the portal."
  secondsteps: "The steps are getting louder. It's big."
  thirdsteps: "It's close. Very close."
  boss: """
    A giant shiny Hand crawls out of the portal.
    It clings to the edge and starts to stretch it.

    Christine shouts: “It's too big! I can't hold it!”

    A bucket comes out the portal.
    It's a head of a titan robot, which could attack the cities with it.
    I definitely don't want to invite THIS to my backyard.
    """
  shoot_boss: "Calm down the titan with lead"
  trick_shot_discover: (character) ->
    """
      I count the cartridges.
      Only four left.
      I've killed #{character.sandbox.killed} robots, so there are still... oh.
      OH.
      I gotta conserve the ammo.
      I can try trick shots but these are big risk.
    """
  head: "head"
  arm: "arm"
  leg: "leg"
  answer1: """
    „Honey, I'm just worried about you.”

    „Why?
    I'm not on a job.
    You're not on a job.
    There's a good protection around the house.”
  """
  branch1_a_option: "It's not enough."
  branch1_a: """
    “It's not enough.“ -- I place my hand on pistol's grip.

    „Tony, it's our romantic evening.
    You can leave the gun at home.”
  """
  branch1_b_option: "I always keep it on me."
  branch1_b: """
    „I always keep it on me. It's okay.“

    „Tony!
    I have been waiting for three weeks to have an evening for two.
    Put the gun down and relax.“
  """
  dlg_finale1_option: "I'm relaxed already."
  dlg_finale1: (link) -> """
    “What are you talking about?
    I'm relaxed already.
    Look at this beautiful sunset, these #{link}.
    Only you and me, just like you wanted.”

    “Yes, but I don't want to shoot anybody!”
  """
  dlg_finale1_cycle: [
    "birds chirping",
    "flowers blooming",
    "trees standing so similar to magic runes",
  ]
  answer2_option: "I'm not even touching it."
  answer2: """
    “I'm not even touching it.”

    “Yes, but you keep it close.
    You can't relax, I feel it.”
  """
  lazy_option: "I just didn't take it out the holster."
  lazy: """
    “I just was too lazy to take it out the holster.
    What difference does it make?”

    “Don't tell me you were too lazy to put the safety on.”
  """
  shoot_pacifist_option: "Shoot pacifist"
  spare_pacifist_option: "Put down the gun"
  endintro_option: "Explain and reconcile"
  lazy2_option: "Sure, it's on safety."
  lazy2: """
    “Sure, it's on safety.
    See, nothing to fear.” -- I took out the pistol to show her.

    “Tony!
    Are you even listening to me?!
    Don't touch the gun!”

    Sighing, I holster the gun.
  """
  lazy3_option: "I don't intend to shoot."
  lazy3: """
    “I don't intend to shoot.”

    “Why did you even took it then?”
  """
  dlg_finale2_option: "It's just my gun."
  dlg_finale2: """
    “It's just my gun.
    Just look at these pink clouds in the sky.
    This one looks like a rabbit, isn't it?”

    “Oh the Great Gods, is that live cartridge on you?!”
  """
