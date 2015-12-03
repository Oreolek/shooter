module.exports.language =
  intro: """
  -- Damn, they keep coming!

  A narrow corridor, me and unstoppable line of pearlskinned shiny androids.
  I'm sure I expected this New Year to be a lot different.

  One crate of androids contains thirty five machines.
  This is going to be a long battle.
  """
  androidattack: "One of androids is so close he bites me!"
  emptyclip: "I get rid of empty cartridge."
  player_hit: [
    "Android's head explodes like a Christmas fireworks.",
    "Android tries to dodge but finds himself right on the bullet's wrong side.
    He falls, flooding the floor with oil."
  ]
  player_finished: [
    "I finish the android with a shot to his heart.",
    "I finish the android with a precise shot.",
    "The bullet pierces android's head and he finally falls on the floor motionless.",
  ]
  player_nicked: [
    """I shoot the enemy's leg off.
    He falls but keeps slowly scratch his way with his hands.""",
    "I shoot through the android's arm. He stumbles but keeps going.",
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
    "I HATE ANDROIDS",
    "I. Hate. Machines.",
    "MECHANOID ANNIHILATION",
    'Destroy the mechanoids',
    "Send a bullet to android",
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
  search: "Search for a clip"
  search_response: [
    "I hastily search the floor, trying to find at least one cartridge intact.",
    "I quickly look around for a clip on the floor.",
  ]
  finale: """
    KABOOM!

    The last android suddenly explodes like larded with dynamite.
    Eh, with these machines you never know.
    I turn around and go away, not looking at the fire.

    My job is done.

    <center><h3>THE END</h3></center>

    The game uses following CC-BY and public domain sound effects and images:

    * SpartanX109 - [Desert Eagle Fire.mp3](http://freesound.org/people/SpartanX109/sounds/89147/)
    * ngphil22 - [DEagle wCasing.mp3](http://freesound.org/people/ngphil22/sounds/233322/)
    * watupgroupie - [gunshots.mp3](http://freesound.org/people/watupgroupie/sounds/36815/)
    * qubodup - [Bullet silhoettes](https://openclipart.org/detail/29029/bullet-silhouettes)
    """
  finale_perfect: """
    35 shots.
    That's all it took.
    Whether by impossible luck or by some higher being's meddling, there's still a lot of time left.

    My job is done.
    Now I can have a good New Year.

    <center><h3>THE END</h3></center>

    The game uses following CC-BY and public domain sound effects and images:

    * SpartanX109 - [Desert Eagle Fire.mp3](http://freesound.org/people/SpartanX109/sounds/89147/)
    * ngphil22 - [DEagle wCasing.mp3](http://freesound.org/people/ngphil22/sounds/233322/)
    * watupgroupie - [gunshots.mp3](http://freesound.org/people/watupgroupie/sounds/36815/)
    * qubodup - [Bullet silhoettes](https://openclipart.org/detail/29029/bullet-silhouettes)
  """
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
  trick_shot_discover: (character) ->
    """
      I count the clips.
      Only four left.
      I've killed #{character.sandbox.killed} androids, meaning, there are still... oh.
      OH.
      I gotta conserve the ammo.
      I can try trick shots but these are big risk.
    """
