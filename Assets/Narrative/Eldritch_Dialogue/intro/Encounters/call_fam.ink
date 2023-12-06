EXTERNAL spawnChoice(message, knot, time, positionPreset)
EXTERNAL saveState(knot)
EXTERNAL waitNextLine(delaySeconds)
EXTERNAL lose()
EXTERNAL win()
EXTERNAL toggleSanity()
EXTERNAL sceneTransition(transition, sceneName)
EXTERNAL doStopBGM(bgmsoundName)
EXTERNAL doPlayBGM(bgmsoundName)
VAR called = true

->break_cont

=== call_start ===
//RINGING SOUND EFFECT
(...)
(...)
"Ramina Richardson."#Speaker:ram
"Hey, it's Kai."#Speaker:kai
"Who?"#Speaker:ram
"Um... You hired me to find a document in your house?"#Speaker:kai
"Oh! Yes, Kaya."#Speaker:ram
~spawnChoice("It's Kai...","wtv",1.5,"bottom-left")
"Sorry, there's been so many of you that I'm losing track."#Speaker:ram
"Did you manage to find it?"
"I haven't gone in yet. I think I'm seeing things - I was about to go in and I saw a ghost, and he basically told me I was going to die?"#Speaker:kai
"Oh! Yes, that. It was in the fine print of your contract."#Speaker:ram
(Shit... I was too excited about the money to read the contract.)#Speaker:kai
"But clearly you didn't read it, so let me give you a refresher."#Speaker:ram
"We are not responsible for any injury, trauma, property theft or destruction, or death that may occur while you're under this contract."
"And you will recieve payment upon completion."
(I should have asked for a deposit...)#Speaker:kai
"Give the will directly to me and I'll give you another $10,000."#Speaker:ram
"I-"#Speaker:kai
~spawnChoice("Want to break the contract","break_cont",8,"top-right")
~spawnChoice("Need to know what I'm up against","against", 8, "top-left")
~spawnChoice("Wait - a will?","search",4,"bottom-left")
~waitNextLine(3)
"You...?"#Speaker:ram
~waitNextLine(2)
"Well? I don't have all day."
~waitNextLine(1)
"I don't have time for this."
"Get the will, then get out."
"And don't mention that you're looking for it to the employees - they'll probably kill you like they did the others."
->break_null

=== wtv ===
"Yes, Kyle." #Speaker:ram
~spawnChoice("No, Kai","wtv2",1.5,"top-right")
"Sorry, there's been so many of you that I'm losing track!"
->wtv_cont


=== wtv2 ===
"Uh huh. There's been so many of you that I'm losing track."#Speaker:ram
->wtv_cont


=== wtv_cont ===
"Did you manage to find it?"
"I haven't gone in yet. I think I'm seeing things - I was about to go in and I saw a ghost, and he basically told me I was going to die?"#Speaker:kai
"Oh! Yes, that. It was in the fine print of your contract."#Speaker:ram
(Shit... I was too excited about the money to read it.)#Speaker:kai
"But clearly you didn't read it, so let me give you a refresher."#Speaker:ram
"We are not responsible for any injury, trauma, property theft or destruction, or death that may occur while you're under this contract."
"And you will recieve payment upon completion."
(I should have asked for a deposit...)#Speaker:kai
"Give the will directly to me and I'll give you another $10,000."#Speaker:ram
"I-"#Speaker:kai
~spawnChoice("Wait - a will?","search",4,"bottom_left")
~spawnChoice("Want to break the contract","break_cont",8,"top-right")
~spawnChoice("Need to know what I'm up against","against", 8, "top-left")
~waitNextLine(3)
"You...?"#Speaker:ram
~waitNextLine(2)
"Well? I don't have all day."
~waitNextLine(2)
"I don't have time for this."
"Get the will, then get out."
"And don't mention that you're looking for it to the employees - they'll probably kill you like they did the others."
"Honestly, don't mention that you're there for a job at all. It'll make things easier."
"Wait-"#Speaker:kai
"I'm sure you'll come up with something."#Speaker:ram
->break_null

=== break_cont ===
"Oh, Kim, you can't do that. You're already on the property."#Speaker:ram
"What? What does that have to do with anything?"#Speaker:kai
"Once you're on the property you can't leave until you've fulfilled the contract."#Speaker:ram
"What the hell? No. No way, I'm out."#Speaker:kai
"Cam, like I said before, you can't do that."#Speaker:ram
"And if I do?"#Speaker:kai
"You'll find that you quite literally can't leave the estate. You'll be stopped by an invisible wall. It was in the fine print."#Speaker:ram
"Section 3 line 12 states 'signee will not be able to leave the estate until the completion of the contract"
"Due to the estate requiring at least one human soul be present when the document is not in the posession of a human."
"This... this is insane."#Speaker:kai
"No, this is reality. Better get moving if you want to get out."#Speaker:ram
"Ok, ok. Can you at least tell me-#Speaker:null
~spawnChoice("What I'm getting into?","against",5,"top-right")
~spawnChoice("How I can stay alive?","against",5,"top-left")
~waitNextLine(3)
//SHORT PAUSE FOR PLAYER TO READ
"..."
~waitNextLine(3)
"..."
"Tell you what? I don't have all day."#Speaker:ram
"..."
"Look, I don't have time for this."
"Good luck. And make sure you don't mention that you're looking for the will while you're in there. It'll piss off the employees."
"Honestly, don't mention that you're there for a job at all. It'll make things easier."
"Wait-"#Speaker:kai
"I'm sure you'll come up with something."#Speaker:ram
->break_null

=== break_null ===
//CALL HANGUP SOUND
(I-... What just happened?)#Speaker:kai
(What... What the hell?! A will?!)
(This is crazy... And I can't leave... And I'm probably going to die...)
(Damnit, I should have stopped at the drive through when I had the chance.)
(...)
(Ok, ok, ok. I got this. I've dealt with loan sharks - I can handle anything this creepy house throws at me.)
~sceneTransition("TestTransition","concierge")
(...)
->END
//RETURN TO CONCIERGE





=== against ===
"Inside you'll meet my father's employees. They're... 'different.' Some might describe them as 'otherworldly.'"#Speaker:ram
"Make sure you don't piss them off - they won't hesitate to kill you."
"I'm sorry, what?"#Speaker:kai
"But don't worry about that Kyle, I'm sure you'll do fine."#Speaker:ram
"It's-... How do I make sure I don't die?!"#Speaker:kai
"Well, for starters, don't mention that you're looking for the will."#Speaker:ram
~waitNextLine(2)
"Better yet, don't tell them you're there for a job."
~spawnChoice("The what?!","search",4,"top-left")
~spawnChoice("Noted","notd",4,"top-right")
"I'm sure you'll figure something out - any excuse should be satisfactory."
->hangup


=== search ===
"The listing said 'document,' not 'will.' Why didn't you get your lawyer to do this?"#Speaker:kai
"Again, this was in the contract."#Speaker:ram
"Unfortunately our family lawyer is bound to the will. You'll likely meet him inside; he's an interesting fellow."
"Very keen to kill, so make sure you're careful. He's not a fan of liars."
->hangup


=== notd ===
"Great. We're on the same page."#Speaker:ram
"And make sure you don't move things around. Drives them mad."
"Get the will, get out, and you'll have your $10,000."
->hangup



=== hangup ===
~sceneTransition("TestTransition", "concierge")
"Anyway, I have to go. Duty calls and all that."#Speaker:ram
"Good luck, Kent!"
"Wait-!"#Speaker:kai
//CALL END SOUND
(...)
(Shit...)
(This is crazy... And I can't leave... And I'm probably going to die...)
(Damnit, I should have stopped at the drive through when I had the chance.)
(...)
(Ok, ok, ok. I got this. I've dealt with loan sharks - I can handle anything this creepy house throws at me.)
-> DONE
