
qualities
  head:
    bullets: qualities.integer("bullets".l()),
    clips: qualities.integer("clips".l()),
    enemies: qualities.integer("enemies".l()),

undum.game.init = (character, system) ->
  system.setQuality("bullets", 6)
  # Number of enemies. More enemies means the game will be longer.
  system.setQuality("enemies", 25)
  system.setQuality("clips", Math.floor(character.qualities.enemies / 6))
  character.sandbox.search_clip_threshold = character.qualities.clips - 2
  # Sound volume multiplicator. 0 means the game is muted.
  character.sandbox.volume = 1
  character.sandbox.clips = []
  for i in [1 .. character.qualities.clips]
    character.sandbox.clips.push(6)
  character.sandbox.current_clip = 0
  character.sandbox.nicked = 0
  character.sandbox.seen_reload = 0
  character.sandbox.seen_search = 0
  character.sandbox.trick_shot = 0
  character.sandbox.shots = 0
  character.sandbox.reloads = 0
  character.sandbox.killed = 0
  character.sandbox.seen_pacifist = 0
  character.sandbox.shot_pacifist = undefined
  character.sandbox.steps = false
  character.sandbox.steps_volume = 0
  $("#title").click(() ->
    $("#clip").fadeIn()
  )
  setInterval( () ->
    play_steps(character)
  , 2400 );

window.onload = undum.begin
