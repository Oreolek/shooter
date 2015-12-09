# This is an easy game.
# I'm thinking if you want more harder approach, you can:
# a) remove bullet counter (you don't know how many bullets left in a clip)
# b) remove canChoose restriction (you can shoot any time you want, but if you have no bullets - nothing comes out and you've lost a turn)

# Scripted events. Called *after* every shot.
scripted_events = (character, system) ->
  if character.sandbox.shots == 1
    writemd(system, "firstmove".l())
  # Finale buildup
  if character.qualities.enemies < 9
    character.sandbox.steps = true
    character.sandbox.steps_volume = 0.1 + (9 - character.qualities.enemies) * 0.1
  if character.qualities.enemies == 7
    writemd(system, "firststeps".l())
  if character.qualities.enemies == 5
    writemd(system, "secondsteps".l())
  if character.qualities.enemies == 3
    writemd(system, "thirdsteps".l())
  if character.qualities.enemies == 1
    writemd(system, "boss".l())
  if character.qualities.enemies == 0
    character.sandbox.steps = false
    system.doLink("finale")

# Finale buildup - steps sound
play_steps = (character) ->
  console.log(character.sandbox.steps)
  if character.sandbox.steps == false
    return
  coin = Math.random()
  audio = 'step1'
  if coin > 0.5
    audio = 'step2'
  audio = document.getElementById(audio)
  audio.currentTime=0
  audio.volume = character.sandbox.steps_volume
  audio.play()

kill_enemy = (character, system) ->
  if character.qualities.enemies == 0
    return
  character.sandbox.nicked = 0
  character.sandbox.killed++
  if character.qualities.enemies >= 1
    system.setQuality("enemies", character.qualities.enemies - 1)

spend_bullet = (character, system) ->
  bullets = character.sandbox.clips[character.sandbox.current_clip]
  character.sandbox.shots++
  if bullets >= 1
    coin = system.rnd.randomInt(1,2)
    audio = 'shot1'
    if coin == 2
      audio = 'shot2'
    audio = document.getElementById(audio)
    audio.currentTime=0
    audio.play()
    character.sandbox.clips[character.sandbox.current_clip]--
    bullets--
    system.setQuality("bullets", bullets)
    $("#clip img").attr("src", "img/clip"+bullets+".png")

spend_clip = (character, system) ->
  bullets = character.sandbox.clips[character.sandbox.current_clip]
  clips = character.sandbox.clips.length
  if clips < 2
    return
  audio = document.getElementById("reload")
  audio.currentTime=0
  audio.play()
  if bullets == 0
    character.sandbox.clips.splice(character.sandbox.current_clip, 1)
    clips = character.sandbox.clips.length
    writemd(system, "emptyclip".l())
    system.setQuality("clips", clips)
  if character.sandbox.current_clip < clips - 1
    character.sandbox.current_clip++
  else
    character.sandbox.current_clip = 0
  bullets = character.sandbox.clips[character.sandbox.current_clip]
  system.setQuality("bullets", bullets)
  $("#clip img").attr("src", "img/clip"+bullets+".png")
  # Pacifist event
  if character.sandbox.killed > 15 and character.sandbox.seen_pacifist == 0
    system.doLink("pacifist")
    character.sandbox.seen_pacifist = 1

situation "hit",
  content: (character, system, from) ->
    response = "player_hit".l().oneOf().randomly(system)
    return response()
  choices: ["#shoot"]
  before: (character, system, from) ->
    kill_enemy(character, system)
  after: (character, system, from) ->
    scripted_events(character, system, from)
  choices: ["#shoot"]

situation "nicked",
  after: (character, system, from) ->
    scripted_events(character, system, from)
  content: (character, system, from) ->
    if character.sandbox.nicked == 1
      kill_enemy(character, system)
      response = "player_finished".l().oneOf().randomly(system)
      return response()
    else
      character.sandbox.nicked = 1
      response = "player_nicked".l().oneOf().randomly(system)
      return response()
  choices: ["#shoot"]

situation "miss",
  after: (character, system, from) ->
    scripted_events(character, system, from)
  content: (character, system, from) ->
    response = "player_missed".l().oneOf().randomly(system)
    return response()
  choices: ["#shoot"]

situation "trick",
  after: (character, system, from) ->
    scripted_events(character, system, from)
  before: (character, system, from) ->
    kill_enemy(character, system)
    kill_enemy(character, system)
  content: (character, system, from) ->
    response = "player_trickshot".l().oneOf().randomly(system)
    return response()
  choices: ["#shoot"]

situation "shoot",
  tags: ["shoot"],
  optionText: (character, system, from) ->
    if character.qualities.enemies > 1
      return "shoot".l().oneOf().randomly(system)
    return "shoot_boss".l()
  canChoose: (character, system) ->
    return character.qualities.bullets > 0
  before: (character, system, from) ->
    system.clearContent()
    spend_bullet(character, system)
  after: (character, system, from) ->
    if character.sandbox.shots == 1 # guaranteed first hit
      return system.doLink("hit")
    roll = system.rnd.dice(1,20) # d20 roll
    hit_threshold = 15
    miss_threshold = 18
    switch
      when roll < hit_threshold then system.doLink("hit")
      when roll > miss_threshold then system.doLink("miss")
      else system.doLink("nicked")

situation "trick_shot",
  tags: ["shoot"],
  optionText: (character, system, from) ->
    return "trick_shot".l()
  canView: (character, system) ->
    return character.sandbox.trick_shot == 1
  canChoose: (character, system) ->
    return character.qualities.bullets > 0
  before: (character, system, from) ->
    spend_bullet(character, system)
    system.clearContent()
  after: (character, system, from) ->
    roll = system.rnd.dice(1,20) # d20 roll
    trick_threshold = 5
    hit_threshold = 12
    miss_threshold = 16
    switch
      when roll < trick_threshold then system.doLink("trick")
      when roll < hit_threshold then system.doLink("hit")
      when roll > miss_threshold then system.doLink("miss")
      else system.doLink("nicked")

situation "reload",
  tags: ["shoot"],
  choices: ["#shoot"],
  optionText: "reload".l(),
  canView: (character, system) ->
    return character.sandbox.seen_reload || character.qualities.bullets < 6
  canChoose: (character, system) ->
    return character.qualities.bullets < 6 and character.sandbox.clips.length > 1
  before: (character, system) ->
    character.sandbox.seen_reload = 1
    system.clearContent()
  after: (character, system) ->
    spend_clip(character, system)
    writemd(system, "reload_response".l())
    if character.sandbox.trick_shot == 0 and character.sandbox.clips.length == 4
      character.sandbox.trick_shot = 1
      writemd(system, "trick_shot_discover".l()(character))
    return true

situation "search",
  tags: ["shoot"],
  optionText: "search".l(),
  canView: (character, system) ->
    return character.sandbox.seen_search || character.qualities.clips < 5
  canChoose: (character, system) ->
    return character.qualities.clips < 5
  before: (character, system) ->
    system.clearContent()
    character.sandbox.seen_search = 1
  after: (character, system) ->
    response = "search_response".l().oneOf().randomly(system)
    writemd(system, response())
    roll = system.rnd.dice(1,20) # d20 roll
    find_threshold = 10
    if roll < find_threshold
      system.doLink("found")
    else
      system.doLink("not_found")

situation "found",
  choices: ["#shoot"],
  before: (character, system, from) ->
    bullets = system.rnd.randomInt(2,4)
    character.sandbox.clips[character.sandbox.clips.length] = bullets
    system.setQuality("clips", character.sandbox.clips.length)
  content: (character, system, from) ->
    response = "clips_found".l().oneOf().randomly(system)
    return response()

situation "not_found",
  choices: ["#shoot"],
  content: (character, system, from) ->
    response = "clips_not_found".l().oneOf().randomly(system)
    return response()
