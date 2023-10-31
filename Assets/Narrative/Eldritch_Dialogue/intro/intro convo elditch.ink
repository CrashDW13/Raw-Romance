//self convo

//concierge

->meet_conc

=== meet_conc ===
'It's... a ghost?'
'Strange; there were only ever murmurs of monsters, never ghosts.'
//GHOST SPRITE ELNARGE, GET CLOSER; WAIT FOR SPRITE TO ENLARGE
"Welcome to my estate."
"I hope you made preparations for your disappearance."
"It's ineviatable, really."
"I've yet to see someone come out."
"But, nevermind that."
"You've crossed the threshold, so there's no turning back for you now."
"Are you ready?"
+ ["Yes"] -> red_str
+ ["No"] -> unfortunate
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
+ ["Something"] ->ha
+ ["Sorry"] -> thank
...
//HOLD HERE AND FORCE PLAYER TO REPLY

=== thank ===
"Thank you."
->ready

=== ha ===
"Ha. How humorous."
->ready


=== red_str ===
"Good."
->ready


=== ready ===
"Before you go in, we have some rules. Listen carefully."
"You can touch, inspect, and ignore the items and furniture in the property, but you cannot take anything with you."
"The estate must remain as it is."
"I see you have a notebook with you - should you choose to inspect and make note of something make sure to press 'N' to see what you've written down."
"And please, don't drop your pen on the floor."
"There will be no food or refreshments inside, so I hope you've come with a satiated appetite."
"Once you meet an inhabitant you cannot leave unless they allow you to leave."
"They tend to monologue, and some enjoy the interjection while others want to be heard in full." 
"Pick your responses carefully, as once they are no longer relavent to the conversation they will disappear."
"Some are more easily agitated than others."
"And most importantly, your life will be on the line with each monster you meet."
"Do you understand?"
+ [Yes] -> enter
+ [No] ->rep_ready



=== unfortunate ===
"Oh my."
"Unfortunately you've already passed through the gates, so leaving is no longer an option."
"No matter; I will prepare you as best as I can."
->ready


=== enter ===
"Good."
"It is time I take my leave."
"Make sure to hold onto your notepad tightly."
"Things are known to get lost in the fray."
->END



=== rep_ready ===
"I will repeat myself once more."
"Listen carefully, because I will not repeat myself again."
"You can touch, inspect, and ignore the items and furniture in the property, but you cannot take anything with you."
"The estate must remain as it was and as it is."
"Should you choose to inspect and make note of something, make sure to press 'N' to see what you've written down."
"And please, don't drop your pen on the floor."
"There will be no food or refreshments inside, so I hope you've come with a satiated appetite."
+ [Why?] ->why
"Once you meet an inhabitant you cannot leave unless they allow you to leave."
"They tend to monologue, and some enjoy the interjection while others want to be heard in full." 
"Pick your responses carefully; if you take too long, your response will no longer be relavent and you will not be able to reply with the options you were provided."
//REMOVE WHY HERE
"Sometimes not responding is beneficial. Other times, it can be to your detriment."
"And most importantly, your life will be on the line with each inhabitant you meet."
"Do you understand?"
+ [Yes] -> enter
+ [No] ->rep_ag


=== rep_ag ===
"Too bad."
"It is time for you to enter."
"Good luck, and keep a tight grip on that notepad of yours."
"Things are known to get lost in the fray."
->END


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
"..."
"I hope you are ready, as it is time for me to take my leave."
"Good luck, and keep your notepoad close."
"Things are known to get lost in the fray."
->END

