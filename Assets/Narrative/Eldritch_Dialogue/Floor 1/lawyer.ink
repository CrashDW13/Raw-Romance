//eldritch main dialogue
EXTERNAL spawnChoice(message, knot, time, positionPreset)
EXTERNAL saveState(knot)
EXTERNAL waitNextLine(delaySeconds)
EXTERNAL lose()
EXTERNAL win()
EXTERNAL doPlaySFX(soundName)
EXTERNAL toggleSanity()
EXTERNAL doPlayBGM(bgmsoundName)
EXTERNAL doStopBGM(bgmsoundName)
EXTERNAL sceneTransition(transitionPreset, sceneName)

->core_start

=== core_start ===
~toggleSanity()
~saveState("core_start")
~waitNextLine(2)
"..."#Speaker:lawyer
"What is it now?"
"..."
//remove greet options here
"Well? I don't have all day."
"..."
"..."
"You know I do not like silence, Bernard."
~spawnChoice("Who's Bernard?", "bernard", 10, "bottom-left")
~spawnChoice("Sorry", "speak", 10, "bottom-right")
~waitNextLine(6)
"..."
"..."
"If you're not going to say anything, then get out."
//kick player back to lawyer lounge area
~sceneTransition("TestTransition", "slime_room")


=== bernard ===
//CHANGE LAWYER SPRITE TO LOOK AT PLAYER
"Clearly not you."
"Who are you? State your business."
"..."
~spawnChoice("I'm here to talk to you", "interview", 10, "bottom-left")
~spawnChoice("I'm looking for a will?", "will", 10, "top-right")
~waitNextLine(3)
"..."
"..."
"Well? Out with it."
"..."
~waitNextLine(2)
"Get out."
~sceneTransition("TestTransition", "slime_room")


=== interview ===
"Oh? And why is that?"
"I've heard murmurs about monsters living here - finally got the courage to actually check it out."#Speaker: kai
"How peculiar - the family tried so hard to hide our existence, yet here you are."#Speaker: lawyer
"Goes to show how effective shoving us in a closet was."



=== will ===
"Oh? A will?"
"Well, you're in luck. I have it with me."
"Come, I can give it to you."
//CHANGE SCENE SO PLAYER GETS CLOSER
"Let me just..."
//RUMMAGING SOUND
//CHANGE TO RUMMAGING SPRITE
"..."
~waitNextLine(3)
"Aha! Here it is."
"I haven't needed this document in decades."
//RETURN TO LOOKING AT PLAYER SPRITE
"Come, take it. It's yours."
//CONTRACT SPRITE ON DESK
"..."
~spawnChoice("Thanks", "take", 10, "bottom-left")
~spawnChoice("It's that easy?", "easy", 10, "top-right")
~waitNextLine(6)
"Don't worry, it won't bite."
"..."
"..."
~waitNextLine(6)
//DEATH SPRITE?
"But I will."
->law_death


=== take ===
~doPlaySFX("addnote")
"Of course."
"Though, I must ask."
(...)
"Did you really think it would be that easy?"
->take_death


=== easy ===
"Hmph..."
"Only if you want it to be."
"Come, take it."
"..."
"..."
~waitNextLine(5)
~spawnChoice("Thanks", "take", 10, "top-left")
~spawnChoice("I think I'll pass", "pass", 10, "top-right")
"Come now, I don't have all day."

=== speak ===
->END



=== take_death ===
The paper in your hand starts to glow as the temperature rises.#Speaker: null
//FIRE HISSING SOUND
Despite your efforts it sticks to you, smoke emitting from your hand.
Cackling and the smell of burnt skin engulf the room; your vision darkens as you collapse to the floor.
"Dinner is served."#Speaker: lawyer
~lose()
