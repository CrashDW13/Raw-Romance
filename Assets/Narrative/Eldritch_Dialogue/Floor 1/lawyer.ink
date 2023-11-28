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
~waitNextLine(6)
"..."
"..."
"Well? Out with it."


=== interview ===
"Oh? And why is that?"
"I've heard murmurs about monsters living here, and I've always wanted to see if it's real."#Speaker: kai
"How peculiar - the family tried so hard to hide our existence, and yet here you are."#Speaker: lawyer
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
~waitNextLine(5)
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
->END


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



=== law_death ===
~lose()
