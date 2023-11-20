->call_start

=== call_start ===
//RINGING SOUND EFFECT
(...)
(...)
"Hello?"#Speaker:contr
"Hey, it's Kai."#Speaker:kai
"Who?"#Speaker:contr
"Um... You hired me to find a document in your house?"
"Oh! Yes, Kaya."#Speaker:contr
"It's Kai..."#Speaker:kai
"Did you manage to find it?"#Speaker:contr
"I haven't gone in yet. I think I'm seeing things - I was about to go in and I saw a ghost, and he basically told me I was going to die?"#Speaker:kai
"Oh! Yes, that. It was in the fine print of your contract."#Speaker:contr
(Shit... I was too excited about the money to read the contract.)#Speaker:kai
"But clearly you didn't read it, so let me give you a refresher."#Speaker:contr
"We are not responsible for any injury, trauma, property theft or destruction, or death that may occur while you're under this contract."
"And you will recieve payment upon completion."
(I should have asked for a deposit...)#Speaker:kai
"Give the contract to 'Ramina' and I'll give you another $10,000."#Speaker:contr
"I-"#Speaker:kai
+ [want to break the contract]
    ->break_cont
+ [need to know what I'm up against]
    ->against
->DONE


=== break_cont ===
"Oh, Kim, you can't do that. You're already on the property."#Speaker:contr
"What? What does that have to do with anything?"#Speaker:kai
"Once you're on the property you can't leave until you've fulfilled the contract."#Speaker:contr
"What the hell? No. No way, I'm out."#Speaker:kai
"Cam, like I said before, you can't do that."#Speaker:contr
"And if I do?"#Speaker:kai
"You'll find that you quite literally can't leave the estate. You're locked in. It was in the fine print."#Speaker:contr
"Section 3 line 12 states 'contractee will not be able to leave the estate until the completion of the contract"
"Due to the estate requiring at least one human soul be present until the document is in the posession of a human."
"This... this is insane."#Speaker:kai
"No, this is reality. Better get moving if you want to get out."#Speaker:contr
"Ok, ok. Can you at least tell me-#Speaker:kai
+ [What I'm getting into?]
    ->against
+ [How I can stay alive?]
    ->against
//SHORT PAUSE FOR PLAYER TO READ
"..."
"..."
"Tell you what? I don't have all day."#Speaker:contr
"..."
"Look, I don't have time for this."
"Good luck. And make sure you don't mention that you're looking for the will while you're in there. It'll piss off the employees."
->break_null


=== break_null ===
(I-... What just happened?)#Speaker:kai
(What... What the hell?! A will?!)
(This is crazy... And I can't leave... And I'm probably going to die...)
(Damnit, I should have stopped at the drive through when I had the chance.)
(...)
(Ok, ok, ok. I got this. I've dealt with loan sharks - I can handle anything this creepy house throws at me.)
->END
//RETURN TO CONCIERGE





=== against ===
"Inside you'll meet my father's employees. They're... 'different.' Some might describe them as 'otherworldly.'"#Speaker:contr
"Make sure you don't piss them off - they won't hesitate to kill you."
"I'm sorry, what?"#Speaker:kai
"But don't worry about that Kyle, I'm sure you'll do fine."#Speaker:contr
"It's-... How do I make sure I don't die?!"#Speaker:kai
"Well, for starters, don't mention that you're looking for the will."#Speaker:contr
+ [The what?!]
    ->search
+ [Noted]
    ->notd
"Better yet, don't tell them you're there for a job."
"I'm sure you'll figure something out - any excuse should be satisfactory."
->hangup

    
=== search ===
"The listing said 'document,' not 'will.' Why didn't you get your lawyer to do this?"#Speaker:kai
"Unfortunately our family lawyer is bound to the will. You'll likely meet him inside; he's an interesting fellow."#Speaker:contr
"Very keen to kill, so make sure you're careful. He's not a fan of liars."
->hangup


=== notd ===
"Great. We're on the same page."#Speaker:contr
"And make sure you don't move things around. Drives them mad."
"Get the will, get out, and you'll have your $10,000."
->hangup



=== hangup ===
"Anyway, I have to go. Duty calls and all that."#Speaker:contr
"Good luck, Kent!"
"Wait-!"#Speaker:kai
//CALL END SOUND
(...)
(Shit...)
->END