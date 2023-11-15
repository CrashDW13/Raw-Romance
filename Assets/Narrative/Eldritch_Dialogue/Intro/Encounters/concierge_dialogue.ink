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
(Ew... There's... I don't even know what that is on the stairs.)
(They look a little too shiny for my liking... I'll have to go up them carefully.)
(I-...)
(I have to be hallucinating.)
//GHOST SPRITE ELNARGE, GET CLOSER; WAIT FOR SPRITE TO ENLARGE
#Speaker:con,def
"Welcome to my estate."
"..."
(I must be crazy.)#Speaker:BLANK
"... *ahem* I said, welcome to my estate."#Speaker:con,def
"..."
"Ok then..."
(There's no way this is real.)#Speaker:BLANK,def
"I hope you made preparations for your disappearance;  I've yet to see someone walk out of these doors."#Speaker:con,def
"But, nevermind that."
"You've crossed the threshold, so there's no turning back for you now."
(Wait... what?)#Speaker:BLANK,clear
"Are you ready?"#Speaker:con,def
"..."
"*Ahem*"
"Do you hear me? If you give everyone you meet the cold shoulder, you won't make it far in this place."
"You'd ought to remember to give someone an answer when they ask you a question."
"Now, I'll ask you again... Are you ready for what's behind these doors?"
~spawnChoice("I need to make a call","call",20,"middle")
~spawnChoice("Yes","red_str",20,"top-left")
~spawnChoice("No","unfortunate",20,"top-right")

"..."
~waitNextLine(2)
"..."
"Perhaps not."
~waitNextLine(5)
"..."
(cough)
~waitNextLine(10)
"..."
//REMOVE RESPONSES HERE
"This... is awkward..."
"Please, say something."
"I don't enjoy people staring at me."
"..."
~spawnChoice("I need to make a call","call",20,"middle")
~spawnChoice("Something","ha",20,"bottom-right")
~spawnChoice("Ok","thank",20,"bottom-left")
"..."
->END

=== call ===
"Do as you need."
~sceneTransition("TestTransition", "Call_Fam")
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
+["I don't get it..."] -> plead_explain
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
"Once you meet an inhabitant you cannot leave unless they allow you to leave."
"They tend to monologue, and some enjoy the interjection while others want to be heard in full."
"Pick your responses carefully; if you take too long, you'll lose the opportunity to make your remark."
~saveState("plead_ag")
"Sometimes not responding is beneficial. Other times, it can be to your detriment."
"And most importantly, your life will be on the line with each inhabitant you meet."
"If you feel your life is in danger, you can 'PLEAD' to go back to the last key point in the conversation."
~toggleSanity()
"Come, give it a try."
+["I don't get it..."] -> plead_explain
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
+["I don't get it."] -> plead_explain
"..."
->END

=== plead_explain ===
"If you feel like the conversation has gone awry, you can 'PLEAD' to go back to the previous topic of discussion."
"Try doing so now."
+["I still don't get it."] -> plead_explain



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
"Keep your notepad close; I've come to find many an entrant's items scattered amongst the rooms."
"Best of luck; hopefully you'll see the sun again."
~toggleSanity()
-> final

=== final ===
(That was... something out of a movie.) #Speaker:BLANK,clear
(He made himself pretty clear, at least... I'll need to watch my mouth while I'm here.)
(Come on, this isn't the time to get scared. It's not like I can turn back.)
(Plus, $10,000 would be great to have if I make it out alive.)
~doStopBGM("rainBGM")
~doPlayBGM("mansionAmb")
~sceneTransition("TestTransition", "slime_room")
->END
