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
EXTERNAL syncUnity()
EXTERNAL setCalledFam(val)
EXTERNAL getCalledFam()
EXTERNAL setConcFinish(val)
EXTERNAL getConcFinish()


//concierge

->meet_conc


=== meet_conc ===
VAR called = false
VAR conc = false
~ called = getCalledFam()

~ conc = getConcFinish()
~syncUnity()
{conc: ->final}
{called:
    ->call_ready
    -else:
    "..."
}


~saveState(ready)
//{called}

(Ew... There's... I don't even know what that is on the stairs.)#Speaker:kai
(They look a little too shiny for my liking... I'll have to go up them carefully.)

(I-...)
(I have to be hallucinating.)
//GHOST SPRITE ELNARGE, GET CLOSER; WAIT FOR SPRITE TO ENLARGE
#Speaker:con,conc
"Welcome to the Richardson estate. I am the concierge of the property, and will be guiding you through your... journey."
(I must be crazy.)#Speaker:kai
"... *ahem* I said, welcome to the Richardson estate."#Speaker:con,conc
(There's no way this is real.)#Speaker:kai
"Ok then..."#Speaker:con,conc
"I hope you made preparations for your disappearance;  I've yet to see one of you walk out of these doors."
"But, nevermind that."
"You've crossed the threshold, so there's no turning back for you now."
(Wait... what?)#Speaker:kai
"Are you ready?"#Speaker:con,conc
(What threshold?)#Speaker:kai
"*Ahem*"#Speaker:con,conc
"Do you hear me? If you give everyone you meet the cold shoulder, you won't make it very far."
(Maybe I should call the woman and back out...)#Speaker:kai 
"You'd ought to remember to give someone an answer when asked a question."#Speaker:con
"Now, I'll ask you again... Are you ready for what's behind these doors?"
~spawnChoice("I need to make a call","call",10,"middle")
~spawnChoice("Yes","red_str",10,"top-left")
~spawnChoice("No","unfortunate",10,"top-right")
~waitNextLine(4)
"..."
"Perhaps not."
~waitNextLine(4)
"..."
//COUGH SFX
"*Cough*"
~waitNextLine(2)
"..."
//REMOVE RESPONSES HERE
"This... is awkward..."
"Please, say something."
"I don't enjoy people staring at me."
~spawnChoice("I need to make a call","call",8,"middle")
~spawnChoice("Something","ha",8,"bottom-right")
~spawnChoice("Ok","thank",8,"bottom-left")
~waitNextLine(5)
"..."
"I think you should take some more time outside..."
"..."
~sceneTransition("TestTransition", "Courtyard")
->END



=== call ===
"Do as you need."
~waitNextLine(2)
~called = true
~setCalledFam(true)
~syncUnity()
//{called}
~sceneTransition("TestTransition", "Call_Fam")


->DONE
=== call_ready===
#Speaker:con,conc
"Welcome back."
->ready


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

=== return_call ===
{conc:->final}
"Welcome back."
->ready


=== ready ===

{called:
    - else:
    ~spawnChoice("I need to make a call","call",5,"top-right")
    }
"You can touch, inspect, and ignore the items and furniture in the property, but you cannot take anything with you."
"The estate must remain as it is."
"I see you have a notebook with you - should you choose to inspect and make note of something make sure to press 'N' to see what you've written down."
"And please, don't drop your pen on the floor."
"There will be no food or refreshments inside, so I hope you've come with a satiated appetite."
~spawnChoice("Why?", "why",10,"bottom-left")
"Once you meet an inhabitant you cannot leave unless they allow you to leave."
"They tend to monologue, and some enjoy the interjection while others want to be heard in full."
"Pick your responses carefully; if you take too long, you'll lose the opportunity to make your remark."
~saveState("plead")
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
{called:
    - else:
    ~spawnChoice("I need to make a call","call",5,"middle")
    }
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
{called:
    - else:
    ~spawnChoice("I need to make a call","call",5,"middle")
    }
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
~saveState("plead")
"Try doing so now."
+["I still don't get it."] -> plead_explain
"..."
->END


=== plead ===
"Good job; when you 'PLEAD' in practice, the inhabitant will repeat themselves."
"You can do this anytime during the conversation, but it comes with a cost: each time you 'PLEAD' you will lose sanity."
"As you get closer to insanity, your responses will reflect that."
"Be wise when you plead - you don't want to find yourself saying things you don't understand."
"Do you understand?"
*["Yes."] -> enter
*["I don't get it..."] -> rep_ready
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
{called:
    -> final
- else:
    -> call_push
}



=== enter ===
"Good."
"Keep your notepad close; I've come to find many an entrant's items scattered amongst the rooms."
"Best of luck; hopefully you'll see the sun again."
~toggleSanity()
{called:
    -> final
- else:
    -> call_push
}


=== call_push ===
(...)#Speaker:BLANK,clear
(What the hell was that?)#Speaker:kai,clear
(I need to get myself out of this mess.)
~setConcFinish(true)
~sceneTransition("TestTransition", "Call_Fam")
->DONE

=== final ===
(...)#Speaker:BLANK,clear
(That was... something out of a movie.)#Speaker:kai
(Things are pretty clear, at least... I'll need to watch my mouth while I'm here.)
(Come on, this isn't the time to get scared. It's not like I can turn back.)
(Plus, $10,000 would be great to have if I make it out alive.)
~doStopBGM("rainBGM")
~doPlayBGM("mansionAmb")
->slime_rm


=== slime_rm ===
(...)
~sceneTransition("TestTransition", "slime_room")
->END
