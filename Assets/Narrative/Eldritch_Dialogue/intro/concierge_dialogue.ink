//self convo
EXTERNAL spawnChoice(message, knot, time, positionPreset)
EXTERNAL saveState(knot)
EXTERNAL waitNextLine(delaySeconds)
EXTERNAL lose()
EXTERNAL win()
//concierge

->meet_conc

=== meet_conc ===
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
~spawnChoice("Yes","red_str","10","top-left")
~spawnChoice("No","unfortunate","10","top-right")

"..."
"..."
"Perhaps not."
"..."
"..."
//REMOVE RESPONSES HERE
"..."
"This... is awkward..."
"..."
"..."
"Please, say something."
"I don't enjoy people staring at me."
~spawnChoice("Something","ha","10","bottom-left")
~spawnChoice("Yes","thank","10","bottom-right")
"..."
~waitNextLine(1000)
//HOLD HERE AND FORCE PLAYER TO REPLY
"..."


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
~spawnChoice("Why?", "why","10","middle")
"Once you meet an inhabitant you cannot leave unless they allow you to leave."
"They tend to monologue, and some enjoy the interjection while others want to be heard in full."
"Pick your responses carefully; if you take too long, your response will no longer be relavent and you will not be able to reply with the options you were provided."
//REMOVE WHY HERE
"Sometimes not responding is beneficial. Other times, it can be to your detriment."
"And most importantly, your life will be on the line with each inhabitant you meet."
"If you feel your life is in danger, you can 'PLEAD' to go back to the last key point in the conversation."
"Come, give it a try."
//PLEAD OPTION HERE
//GO TO plead



=== rep_ready ===
"Understood."
"Listen carefully, because I will not repeat myself again."
"You can touch, inspect, and ignore the items and furniture in the property, but you cannot take anything with you."
"The estate must remain as it was and as it is."
"Should you choose to inspect and make note of something, make sure to press 'N' to see what you've written down."
"And please, don't drop your pen on the floor."
"There will be no food or refreshments inside, so I hope you've come with a satiated appetite."
~spawnChoice("Why?", "why","10","middle")
"Once you meet an inhabitant you cannot leave unless they allow you to leave."
"They tend to monologue, and some enjoy the interjection while others want to be heard in full."
"Pick your responses carefully; if you take too long, your response will no longer be relavent and you will not be able to reply with the options you were provided."
//REMOVE WHY HERE
"Sometimes not responding is beneficial. Other times, it can be to your detriment."
"And most importantly, your life will be on the line with each inhabitant you meet."
"If you feel your life is in danger, you can 'PLEAD' to go back to the last key point in the conversation."
"Come, give it a try."

//PLEAD APPEARS HERE
//GO TO plead_ag


=== why ===
"I-"
"Please, let me finish."
"I want to make sure you understand the gravity of the situation you are about to enter."
->again



=== again ===
"Once you meet an inhabitant you cannot leave unless they allow you to leave."
"They tend to monologue, and some enjoy the interjection while others want to be heard in full."
"Pick your responses carefully; if you take too long, your response will no longer be relavent and you will not be able to reply with the options you were provided."
"Sometimes not responding is beneficial. Other times, it can be to your detriment."
"And most importantly, your life will be on the line with each inhabitant you meet."
"If you feel your life is in danger, you can 'PLEAD' to go back to the last key point in the conversation."
"Come, give it a try."
///PLEAD HERE
//GO TO 'plead'



=== plead ===
"Good job; when you 'PLEAD' in practice, the inhabitant will repeat themselves."
"You can do this anytime during the conversation, but it comes with a cost: each time you 'PLEAD' you will lose sanity."
"As you get closer to insanity, your responses will reflect that."
"Be wise when you plead - you don't want to find yourself saying things you don't understand."
"Do you understand?"
~spawnChoice("Yes","enter","10","middle-left")
~spawnChoice("No","rep_ready","10","middle-right")
~waitNextLine(1000)
"..."




=== plead_ag ===
"Good job; when you 'PLEAD' in practice, the inhabitant will repeat themselves."
"You can do this anytime during the conversation, but it comes with a cost: each time you 'PLEAD' you will lose sanity."
"As you get closer to insanity, your responses will reflect that."
"Be wise when you plead - you don't want to find yourself saying things you don't understand."
"Now, it is time for you to begin."
"Good luck, and keep your notepoad close."
"Things are known to get lost in the fray."
->END



=== enter ===
"Good."
"Keep your notepad close; things are known to get lost in the fray."
"Best of luck; hopefully you'll see the sun again."
