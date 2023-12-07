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
VAR suspicion = 0
VAR val = 3

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
~waitNextLine(2)
"You know I do not like silence, Bernard."#Speaker:lawyer
"..."
~waitNextLine(1)
~spawnChoice("Who's Bernard?", "bernard", 10, "bottom-left")
~spawnChoice("Sorry", "speak", 10, "bottom-right")
~waitNextLine(5)
"..."
"..."
"Bern-"
You lock eyes.#Speaker:BLANK
"Oh!"
->speak


=== bernard ===
//CHANGE LAWYER SPRITE TO LOOK AT PLAYER
"Clearly not you."
"Who are you? State your business."
"..."
~spawnChoice("I'm here to talk to you", "interview", 7, "bottom-left")
~spawnChoice("I'm looking for a will?", "will", 7, "top-right")
"..."
~waitNextLine(4)
"Well? Out with it."
"..."
~waitNextLine(3)
"I don't appreciate it when someone wastes my time."
"..."
->law_death


=== interview ===
"Oh? And why is that?"#Speaker:lawyer
"I've heard murmurs about monsters living here - finally got the courage to actually check it out."#Speaker:kai
"How peculiar - the family tried so hard to hide our existence, yet here you are."#Speaker:lawyer
"Goes to show how effective shoving us in a closet was."
"Are we meeting expectations?"
"Well..."#Speaker:kai
"I don't know what I expected, but so far it's been... interesting?"
"I'm glad the estate amuses you."#Speaker:lawyer
"I've come to find it mundane, though I have a half-century of existing here to blame for that."
~spawnChoice("You've been here for 50 years?!", "century", 5, "bottom-left")
"*Sigh* If I could go back in time, I would have stopped myself from signing that contract."
~waitNextLine(2)
~spawnChoice("About that...", "cont_look", 10, "bottom-left")
"Such a waste, working a soul contract with a soulless family."
~spawnChoice("Soul contract?", "contract", 10, "bottom-left")
"But alas, I cannot change my mistake."
->END



=== century ===
->END

=== cont_look ===
~suspicion++
"I've been looking for a soul contract, and I was told it was here."#Speaker:kai
"Have you seen it?"
{suspicion + val}
"Hm... elaborate on this 'soul contract.' What purpose does it serve?"
~spawnChoice("I don't know... (truth)", "know_truth", 10, "bottom-left")
~spawnChoice("I don't know... (lie)", "know_lie", 10, "bottom-right")

=== contract ===
~suspicion++
"Yes, a soul contract. Does that interest you?"
~spawnChoice("Actually, yeah...", "cont_look", 10, "bottom-left")
->END


=== know_truth ===
->END


=== know_lie ===
->END




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
~waitNextLine(2)
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
~waitNextLine(5)
"..."
~spawnChoice("Thanks", "take", 10, "top-left")
~spawnChoice("I think I'll pass", "pass", 10, "top-right")
"Come now, I don't have all day."
"..."
"You've wasted enough of my time."
->law_death


=== pass ===
"A smart decision."
"Now, why are you here?"
"I came here to talk to you, actually."#Speaker:kai
->interview 


=== speak ===
"And who might you be?"#Speaker:lawyer
"I'm Kai."#Speaker:kai 
"Well, Kai, I wasn't expecting visitors."#Speaker:lawyer
"At least, not of the human variety."
"...surprise?"#Speaker:kai 
"Ha. What brings you into my office?"#Speaker:lawyer
~spawnChoice("I'm here to talk to you", "interview", 10, "bottom-left")
~spawnChoice("I'm looking for a will?", "will", 10, "top-right")
~waitNextLine(3)
"..."
"Well?
~waitNextLine(2)
"..."
"I don't have time for this."
->law_death



=== take_death ===
The paper in your hand starts to glow as the temperature rises.#Speaker: null
//FIRE HISSING SOUND
Despite your efforts it sticks to you, smoke emitting from your hand.
Cackling and the smell of burnt skin engulf the room; your vision darkens as you collapse to the floor.
"Dinner is served."#Speaker: lawyer
~lose()


=== law_death ===
You jump back as the monster swipes its pointed fingers across the desk.
As your fingers meet the door handle you find it locked.
"Like fish in a barrel."#Speaker:lawyer
~lose()


=== law_end ===
~win()

=== law_win ===
(That was intense... but at least I'm alive.)#Speaker:kai
(I don't know how I managed to go that entire time without asking what the hell it was.)
(Then again, I don't know what any of the... 'people'... here are.)
(I can't let myself dwell on this - I have to figure out where that stupid will is.)
->END

