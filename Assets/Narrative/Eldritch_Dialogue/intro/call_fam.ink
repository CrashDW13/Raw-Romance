->call_start

=== call_start ===
//RINGING SOUND EFFECT
(...)
(...)
"Hello?"#Speaker:contr
"Hey, it's Kai."#Speaker:kai
"Who?"#Speaker:contr
"Um... You hired me to find stuff in your house?"
"Oh! Yes, Kaya."#Speaker:contr
"It's Kai..."#Speaker:kai
"Did you manage to find the document?"#Speaker:contr
"I haven't even gone in yet. I think I'm seeing things - I was about to go in and I saw a ghost, and he basically told me I was going to die?"#Speaker:kai
"Oh! Yeah, that. It was in the fine print of your contract."#Speaker:contr
(Shit... I was too excited about the money to read the contract.)#Speaker:kai
"But, as a refresher: we are not responsible for any injury, trauma, property theft or destruction, or death that may occur while you're under this contract."#Speaker:contr
"And you will recieve payment upon completion."
(I should have asked for a deposit...)#Speaker:kai
"Give the contract to me specifically and I'll give you another $10,000."#Speaker:contr
"I-"#Speaker:kai
+ [want to break the contract]
    -> break_cont
+ [need to know what I'm up against]
    ->against
    


=== break_cont ===
"Oh, Kim, you can't do that. You're already on the property."#Speaker:contr
"What? What does that have to do with anything?"#Speaker:kai
"Once you're on the property you can't leave until you've fulfilled the contract."#Speaker:contr
"What the hell? That's it. I'm out."#Speaker:kai
"Cam, like I said before, you can't do that."#Speaker:contr
"And if I do?"#Speaker:kai
"You'll find that you quite literally can't leave the estate. You're locked in."#Speaker:contr



=== against ===
"Um... ok... Can you tell me what I'm about to walk into?"#Speaker:kai
"My family home. You'll meet my father's employees - make sure you don't piss them off, they won't hesitate to kill you."
"I'm sorry - what?"#Speaker:kai
"But don't worry about that Kyle, I'm sure you'll do fine."
"It's Kai..."#Speaker:kai



->END