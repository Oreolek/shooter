
qualities
  head:
    bullets: qualities.integer("bullets".l()),
    clips: qualities.integer("clips".l()),
    enemies: qualities.integer("enemies".l()),

undum.game.init = (character, system) ->
  system.setQuality("bullets", 6)
  system.setQuality("clips", 6)
  system.setQuality("enemies", 35)
  character.sandbox.clips = [6,6,6,6,6,6]
  character.sandbox.current_clip = 0
  character.sandbox.nicked = 0
  character.sandbox.seen_reload = 0
  character.sandbox.seen_search = 0
  character.sandbox.trick_shot = 0
  character.sandbox.shots = 0
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
