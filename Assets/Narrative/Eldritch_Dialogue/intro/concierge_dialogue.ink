//self convo
EXTERNAL spawnChoice(message, knot, time, positionPreset)
EXTERNAL saveState(knot)
EXTERNAL waitNextLine(delaySeconds)
EXTERNAL lose()
EXTERNAL win()
EXTERNAL toggleSanity()
EXTERNAL sceneTransition(transition, sceneName)
EXTERNAL doStopBGM(bgmsoundName)
EXTERNAL doPlayBGM(bgmsoundName)

//concierge

->meet_conc

=== meet_conc ===
~saveState(meet_conc)
'It's... a ghost?'
'Strange; there were only ever murmurs of monsters, never ghosts.'
//GHOST SPRITE ELNARGE, GET CLOSER; WAIT FOR SPRITE TO ENLARGE
#Speaker:con,def
"Welcome to my estate."
"I hope you made preparations for your disappearance."
"It's ineviatable, really."
"I've yet to see someone come out."
"But, nevermind that."
"You've crossed the threshold, so there's no turning back for you now."
"Are you ready?"
~spawnChoice("Yes","red_str",20,"top-left")
~spawnChoice("No","unfortunate",20,"top-right")

"..."
~waitNextLine(2)
"..."
"Perhaps not."
~waitNextLine(5)
"..."
*cough*
~waitNextLine(10)
"..."
//REMOVE RESPONSES HERE
"This... is awkward..."
"Please, say something."
"I don't enjoy people staring at me."
"..."
+ [Ok] -> thank
+ [Something] -> ha
->END

=== thank ===
"Thank you."
->ready

=== ha ===
"Ha. How humorous."
->ready


=== red_str ===
"Good."
->ready


=== unfortunate ===
"Oh my."
"Unfortunately you've already passed through the gates, so leaving is no longer an option."
"No matter; I will prepare you as best as I can."
->ready


=== ready ===
"Before you go in, we have some rules. Listen carefully."
"You can touch, inspect, and ignore the items and furniture in the property, but you cannot take anything with you."
"The estate must remain as it is."
"I see you have a notebook with you - should you choose to inspect and make note of something make sure to press 'N' to see what you've written down."
"And please, don't drop your pen on the floor."
"There will be no food or refreshments inside, so I hope you've come with a satiated appetite."
~spawnChoice("Why?", "why",10,"middle")
"Once you meet an inhabitant you cannot leave unless they allow you to leave."
"They tend to monologue, and some enjoy the interjection while others want to be heard in full."
"Pick your responses carefully; if you take too long, you'll lose the opportunity to make your remark."
~saveState("plead_ag")
"Sometimes not responding is beneficial. Other times, it can be to your detriment."
"And most importantly, your life will be on the line with each inhabitant you meet."
"If you feel your life is in danger, you can 'PLEAD' to go back to the last key point in the conversation."
~toggleSanity()
"Come, give it a try."
+["Plead"] -> plead_explain
"..."
->END


=== rep_ready ===
"Understood."
"Listen carefully, because I will not repeat myself again."
"You can touch, inspect, and ignore the items and furniture in the property, but you cannot take anything with you."
"The estate must remain as it was and as it is."
"Should you choose to inspect and make note of something, make sure to press 'N' to see what you've written down."
"And please, don't drop your pen on the floor."
"There will be no food or refreshments inside, so I hope you've come with a satiated appetite."
~spawnChoice("Why?", "why",10,"middle")
"Once you meet an inhabitant you cannot leave unless they allow you to leave."
"They tend to monologue, and some enjoy the interjection while others want to be heard in full."
"Pick your responses carefully; if you take too long, you'll lose the opportunity to make your remark."
~saveState("plead_ag")
"Sometimes not responding is beneficial. Other times, it can be to your detriment."
"And most importantly, your life will be on the line with each inhabitant you meet."
"If you feel your life is in danger, you can 'PLEAD' to go back to the last key point in the conversation."
~toggleSanity()
"Come, give it a try."
+["Plead"] -> plead_explain
"..."
->END

=== why ===
"I-"
"Please, let me finish."
"I want to make sure you understand the gravity of the situation you are about to enter."
->again



=== again ===
"Once you meet an inhabitant you cannot leave unless they allow you to leave."
"They tend to monologue, and some enjoy the interjection while others want to be heard in full."
"Pick your responses carefully; if you take too long, you'll lose the opportunity to make your remark."
~saveState("plead_ag")
"Sometimes not responding is beneficial. Other times, it can be to your detriment."
"And most importantly, your life will be on the line with each inhabitant you meet."
"If you feel your life is in danger, you can 'PLEAD' to go back to the last key point in the conversation."
~toggleSanity()
"Come, give it a try."
+["Plead"] -> plead_explain
"..."
->END

=== plead_explain ===
"If you feel like the conversation has gone awry, you can 'PLEAD' to go back to the previous topic of discussion."
"Try doing so now."
+["Plead"] -> plead_explain



=== plead ===
"Good job; when you 'PLEAD' in practice, the inhabitant will repeat themselves."
"You can do this anytime during the conversation, but it comes with a cost: each time you 'PLEAD' you will lose sanity."
"As you get closer to insanity, your responses will reflect that."
"Be wise when you plead - you don't want to find yourself saying things you don't understand."
"Do you understand?"
["Yes."] -> enter
["I don't get it..."] -> rep_ready
"..."




=== plead_ag ===
"Good job; when you 'PLEAD' in practice, the inhabitant will repeat themselves."
"You can do this anytime during the conversation, but it comes with a cost: each time you 'PLEAD' you will lose sanity."
"As you get closer to insanity, your responses will reflect that."
"Be wise when you plead - you don't want to find yourself saying things you don't understand."
"Now, it is time for you to begin."
"Good luck, and keep your notepad close."
"Things are known to get lost in the fray."
"Best of luck; hopefully you'll see the sun again."
->final



=== enter ===
"Good."
"Keep your notepad close; things are known to get lost in the fray."
"Best of luck; hopefully you'll see the sun again."
-> final

=== final ===
#Speaker:BLANK,clear
~toggleSanity()
(Just as quickly as he appeared, the ghost vanished. Guess that's all I'm getting out of him.)
(He made himself pretty clear, at least... I'll need to watch my mouth while I'm here.)
(With nothing more waiting for me outside the mansion, I walked up the stairs and pressed onwards...)
~doStopBGM("rainBGM")
~doPlayBGM("mansionAmb")
~sceneTransition("TestTransition", "slime_room")
->END
