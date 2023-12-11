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
VAR search = 0
VAR found = 0
VAR checking = 0 
VAR chair = false
VAR cab = false
VAR books = false
VAR started = false
VAR right_drawer = false
VAR right_cab = false
VAR left_drawer = false
VAR left_cab = false
VAR d_start = false


->core_start

=== core_start ===
~toggleSanity()
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
~saveState("bernard_rpt")
...#Speaker:BLANK
~spawnChoice("I'm here to talk to you", "interview", 7, "bottom-left")
~spawnChoice("I'm looking for a will?", "will", 7, "top-right")
"..."
~waitNextLine(4)
"Well? Out with it."
...#Speaker:BLANK
~waitNextLine(3)
"I don't appreciate it when someone wastes my time."
"..."
->law_death


=== bernard_rpt ===
//CHANGE LAWYER SPRITE TO LOOK AT PLAYER
"I can still tell you're not Bernard."
"Who are you? State your business."
...#Speaker:BLANK
~spawnChoice("I'm here to talk to you", "interview", 7, "bottom-left")
~spawnChoice("I'm looking for a will?", "will", 7, "top-right")
"..."
~waitNextLine(4)
"Well? Out with it."
...#Speaker:BLANK
~waitNextLine(3)
"I don't appreciate it when someone wastes my time twofold."
"..."
->law_death



=== interview ===
"Oh? And why is that?"#Speaker:lawyer
"Legend has it that monsters live here - finally got the courage to actually check it out."#Speaker:kai
"How peculiar - the family tried so hard to hide our existence, yet here you are."#Speaker:lawyer
"Goes to show how effective shoving us in a closet was."
"Are we meeting expectations?"
~saveState("interview_ag")
"Well..."#Speaker:kai
"I don't know what I expected, but so far it's been... interesting?"
"I'm glad the estate amuses you."#Speaker:lawyer
"I've come to find it mundane, though I have a half-century of existing here to blame for that."
~spawnChoice("You've been here for 50 years?!", "century", 5, "top-left")
"*Sigh* If I could go back in time, I would have stopped myself from signing that contract."
~waitNextLine(2)
~spawnChoice("About that...", "cont_look", 10, "bottom-left")
"Such a waste, working a soul contract with a soulless family."
~spawnChoice("Soul contract?", "contract", 10, "top-right")
"But alas, I cannot change my mistake."
"Thankfully, my days might be numbered."
"But of course, I cannot dismiss the power of human determination."
"An admirable yet aggravating trait you all posess."
(Numbered days?)#Speaker:kai 
"Nevermind that. It's not important."
"Let's talk about you."
->learn_kai





=== learn_kai ===
"How long have you known of our existence?"#Speaker:lawyer
~spawnChoice("Not long", "recent", 5, "bottom-left")
"I wonder how long this 'legend' has existed. I've been told humans love their stories."
~spawnChoice("I grew up with it", "life", 5, "bottom-right")
"Understandable, given how limited your access to the greater world is."
"I'd like to think the story goes beyond portraying us as caricatures."
~waitNextLine(2)
"Though I suppose you'll have to be the one to tell me more about that."
->legend


=== recent ===
~suspicion++
"Is that so?"#Speaker:lawyer
"And yet you called it a 'legend.'"
"I suspect there's something you're not telling me."
~waitNextLine(2)
"Um..."#Speaker:kai 
~spawnChoice("I found it on the internet", "internet", 3, "top-right")
~spawnChoice("I heard about it from a friend", "friend", 6, "bottom-left")
...#Speaker:BLANK
~waitNextLine(2)
"Well? Clock's ticking."#Speaker:lawyer 
...#Speaker:BLANK
"Hm. Just as I suspected. You're one of them."
"Thank you for the entertainment, but I think it's time we end this conversation."
->law_death

=== internet ===
"It's pretty popular in the forums I'm on."#Speaker:kai 
"How peculiar."#Speaker:lawyer 
->legend


=== life === 
"Oh my. I suppose the story was a 'boogeyman' of sorts?"#Speaker:lawyer
"You could say that."#Speaker:kai 
->legend


=== friend ===
"They told me about it one time while we were camping. Pretty spooky stuff." #Speaker:kai 
"And you decided to make the trip to investigate?"#Speaker:lawyer
"I guess, yeah."#Speaker:kai 
->legend


=== legend ===
"Well? Tell me about it."#Speaker:lawyer
(Oh god...)#Speaker:kai 
"Um..."
"Well, the story goes..."
~waitNextLine(3)
~spawnChoice("A family hired...", "family", 6, "bottom-left")
~spawnChoice("There was this megalomaniac...", "megalomaniac", 6, "bottom-right")
"That..."
"Yes...?"#Speaker:lawyer
~waitNextLine(2)
...#Speaker:BLANK
"Hm. Just as I suspected. You're one of them."
->law_death

=== family ===
~suspicion++
"A bunch of monsters."#Speaker:kai 
"To uh..."
~waitNextLine(3)
~spawnChoice("Do housework...", "housework", 6, "bottom-right")
~spawnChoice("Take over the world", "takeover", 6, "bottom-left")
"Um..."
...#Speaker:BLANK
"To...?"#Speaker:lawyer
...#Speaker:BLANK
"Hm. Just as I suspected. You're one of them."
->law_death


=== takeover ===
~suspicion++
"Uh huh."#Speaker:lawyer
"And they chose this house to conduct their business."#Speaker:kai 
"But people got suspicious and started monitoring the grounds."
"Then, people went missing, and it was a whole scandal."
"And so one day they ended up deciding to march in there and see what was going on."
~spawnChoice("They found the missing people...", "missing_people", 5, "top-right")
"They got through the gates, and started banging on the doors."
"The entire place was pitch black, and someone decided to try and light a small fire to make things easier to see."
"But because people were so riled up,"
~waitNextLine(3)
"They..."
~spawnChoice("Lit the place on fire", "flames", 5, "bottom-right")
~spawnChoice("Lost control of the flames", "burnt", 5, "bottom-left")
"Uh..."
"Well?"#Speaker:lawyer
...#Speaker:BLANK
"You were doing so well. How unfortunate that you're failing to maintain it."
"Thank you, though, for making it obvious you're one of their pawns."
"Unfortunately I do need to kill you - preserve my freedom and all that."
"But it was nice chatting with you."
->law_death


=== missing_people ===
"They were huddled in a circle inside the house, yelling for help."#Speaker:kai 
"And there was this shadowy figure behind them, just staring into the void."
"Then... poof. Everyone inside vanished before their eyes."
"Nobody could figure out what happened, and people stayed away out of fear of disappearing themselves."
...#Speaker:BLANK
"Wow..."#Speaker:lawyer
"I knew humans liked their stories, but I never anticipated such a tall tale." 
"It's impressive."
"Pardon me, I need to find my journal and write this all down."
The lawyer stands up and moves to a nearby bookshelf, completely engrossed in scanning the spines.#Speaker:BLANK
~waitNextLine(3)
~spawnChoice("The bookshelf", "bookshelf", 5, "bottom-left")
~spawnChoice("The desk", "desk", 5, "bottom-right")
(Now's my chance! Where should I start looking first?)#Speaker:kai 
"Hm..."#Speaker:lawyer
"Seems I've misplaced it. Please excuse me for a moment."
->alone



=== burnt ===
"Nobody realized until it was too late that the fire was spreading from shirt to shirt."#Speaker:kai
"Everyone ended up burning to death, and people say they can still see the faces of the people that marched in in the windows."
"And that sometimes they can see an inhuman figure lurking behind them."
...#Speaker:BLANK
"My, my. I knew humans liked their stories, but I never anticipated such a tall tale."#Speaker:lawyer
"It's impressive."
"Pardon me, I need to find my journal and write this all down."
The lawyer stands up and moves to a nearby bookshelf, completely engrossed in scanning the spines.#Speaker:BLANK
~waitNextLine(3)
~spawnChoice("The bookshelf", "bookshelf", 5, "bottom-left")
~spawnChoice("The desk", "desk", 5, "bottom-right")
(Now's my chance! Where should I start looking first?)#Speaker:kai 
"Hm..."#Speaker:lawyer
"Seems I've misplaced it. Please excuse me for a moment."
->alone



=== flames ===
"And watched it burn to the ground, not realizing they ended up trapping the missing people inside."
...#Speaker:BLANK
"How... interesting."#Speaker:lawyer
"Yeah, it's crazy."#Speaker:kai 
"So, they burned the place to the ground?"#Speaker:lawyer
"Yeah. Charred and everything."#Speaker:kai 
"They burned this house, the one that we're sitting in, to the ground?"#Speaker:lawyer
(Oh no...)#Speaker:kai 
...#Speaker:BLANK
"You're smart, but not smart enough it seems."#Speaker:lawyer
"Truly, that was impressive."
"Thank you, though, for making it obvious you're one of their pawns."
"Unfortunately I do need to kill you - preserve my freedom and all that."
"But it was nice chatting with you."
->law_death 



=== housework ===
"And so they summoned a bunch of them so they wouldn't have to pay for anything."#Speaker:kai 
"..."
"And yeah..."
...#Speaker:BLANK
"That's it?"#Speaker:lawyer
"That's it."#Speaker:kai 
...#Speaker:BLANK
"Wow."#Speaker:lawyer
"You're terrible at lying."
"Truly, that was impressive."
"Thank you, though, for making it obvious you're one of their pawns."
"Unfortunately I do need to kill you - preserve my freedom and all that."
"But it was nice chatting with you."
->law_death


//KNOT BREAKS THE SCENE
=== megalomaniac ===
"And he was trying to take over the world."#Speaker:kai 
"So he goes into this abandoned house and tries to summon something."
~spawnChoice("And one night, it works", "works", 3, "bottom-left")
"He's buying a bunch of salt and candles, and everyone starts to worry about him."
"He starts spending all of his time in this place."
"He spends all this time trying and trying, but nothing works."
~waitNextLine(2)
"..."
~waitNextLine(3)
"Then..."
~spawnChoice("His family staged an intervention", "intervention", 5, "top-right")
~spawnChoice("One day, it finally works", "works", 5, "bottom-left")
"..."
"Then...?"#Speaker:lawyer 
~suspicion++
"Uh..."#Speaker:kai 
~waitNextLine(2)
"Then..."
~spawnChoice("He goes bankrupt", "bankrupt", 5, "bottom-right")
~spawnChoice("He goes missing", "missing", 5, "bottom-left")
"Hm?"#Speaker:lawyer
...#Speaker:BLANK
"Seems you've run out of thread to spin your story."
"It was amusing while it lasted, but you've made it quite obvious why you're here."
"Unfortunately, I can't let you live - preserve my freedom and all that."
"But it was nice chatting with you."
->law_death


=== works ===
"And everyone sees this flash of light come from the house."#Speaker:kai 
"People rush towards the gates, but they can't get through. It's like there's a forcefield around the place."
~waitNextLine(2)
"And the guy comes out and he's..."
~spawnChoice("On fire", "fire", 4, "top-right")
~waitNextLine(2)
"He's..."
~spawnChoice("Covered in soot", "soot", 4, "middle")
~spawnChoice("Screaming his head off", "fire", 4, "top-left")
"..."
~waitNextLine(2)
"Well don't leave me hanging."#Speaker:lawyer
"..."
"Seems you've run out of thread to spin your story."
"It was amusing while it lasted, but you've made it quite obvious why you're here."
"Unfortunately, I can't let you live - preserve my freedom and all that."
"But it was nice chatting with you."
->law_death



=== soot ===
"Head to toe, and nobody can figure out why."#Speaker:kai 
"He tries to run out the gates, but the forcefield stops him."
"And then he gets sucked back into the house, screaming for help."
"Never to be seen again."
...#Speaker:BLANK
"Wow..."#Speaker:lawyer
"I knew humans liked their stories, but I never anticipated such a tall tale."
"It's impressive."
"Pardon me, I need to find my journal and write this all down."
The lawyer stands up and moves to a nearby bookshelf, completely engrossed in scanning the spines.#Speaker:BLANK
~waitNextLine(3)
~spawnChoice("The bookshelf", "bookshelf", 5, "bottom-left")
~spawnChoice("The desk", "desk", 5, "bottom-right")
(Now's my chance! Where should I start looking first?)#Speaker:kai 
"Hm..."#Speaker:lawyer
"Seems I've misplaced it. Please excuse me for a moment."
->alone

=== bookshelf ===
You walk over to the bookshelf, staring up at the back of the monster's head.#Speaker:BLANK
"Hm..."#Speaker:lawyer
"Seems I-"
"What are you doing?"
(Wait... what AM I doing?)#Speaker:kai 
"Um..."
"I don't... I don't know..."
You shrink as the monster's eyes burn through you.#Speaker:blank
"It seems I've misplaced my journal. I'll be back momentarily - behave while I'm gone."#Speaker:lawyer
->alone

=== desk ===
You stand and begin to make your way around the side of the desk, but the monster's head snaps in your direction.#Speaker:BLANK
"What do you think you're doing?"#Speaker:lawyer
~waitNextLine(2)
"Uh..."#Speaker:kai 
~spawnChoice("I wanted to stretch my legs", "legs", 4, "top-right")
~spawnChoice("Your desk looks cool", "cool_desk", 6, "bottom-left")
The monster takes a step towards you.#Speaker:BLANK
~spawnChoice("I wanted to help", "help_look", 3, "bottom-right")
~waitNextLine(2)
"Well?"#Speaker:lawyer
~spawnChoice("I wanted to look for something", "looking", 6, "bottom-right")
It takes another step, halfway across the desk.#Speaker:BLANK
~waitNextLine(3)
"I-"#Speaker:kai 
~spawnChoice("figured I could help look", "help_look", 4, "middle")
The monster takes another step, now looming in front of you.#Speaker:BLANK
"You?"#Speaker:lawyer
You find yourself at a loss for words.#Speaker:BLANK
"Hm. Such a shame, I was starting to enjoy your company."#Speaker:lawyer
"Nonetheless, you've shown you can't be trusted. I'll have to kill you now."
"But I must say, it was fun while it lasted."
->law_death


=== legs ===
The monsters eyes narrow.#Speaker:BLANK
"Very well."#Speaker:lawyer
"It seems I've misplaced my journal. Stay put while I'm gone."
->alone_start


=== cool_desk ===
The monsters eyes narrow.#Speaker:BLANK
"Hm... I suppose it does."#Speaker:lawyer
It straightens out its suit before speaking again.#Speaker:BLANK
"It appears I've misplaced my journal. I'll be back shortly - behave yourself while I'm gone."#Speaker:lawyer
->alone_start


=== help_look ===
"I appreciate the gesture, but that won't be necessary."#Speaker:lawyer
"Please, sit. And behave yourself. I'll be back shortly - it seems I've misplaced my journal."
->alone_start


=== looking ===
The monsters eyes narrow as it takes a step towards you.#Speaker:BLANK
"Something?"#Speaker:lawyer 
(Oh no...)#Speaker:kai 
"My, my. A slip of the tongue. And you were doing so well."#Speaker:lawyer 
"Clearly you're one of their pawns, so unfortunately I'll have to kill you."
"I will say, though, you were very refreshing company."
->law_death 


=== alone_start ===
A few strides and one closed door later, you're alone in the room.#Speaker:BLANK
(It's go time)#Speaker:kai
->alone

 
 === alone === 
{started:
    (Where else should I search?)#speaker:kai 
    {search < 2:
        {books:
        - else:
            ~spawnChoice("Bookshelf", "book_search", 8, "bottom-right")
        }
        {cab:
        - else:
            ~spawnChoice("Desk", "desk_search", 8, "bottom-left")
        }
        {chair:
        - else:
            ~spawnChoice("Chair", "chair_search", 8, "middle")
        }
    - else:
    "Wait... I think I hear footsteps."#Speaker:kai 
    ->law_return
    }
- else:
    (Where should I search first?)#Speaker:kai 
    ~started = true 
    {books:
    - else:
        ~spawnChoice("Bookshelf", "book_search", 8, "bottom-right")
    }
    {cab:
    - else:
        ~spawnChoice("Desk", "desk_search", 8, "bottom-left")
    }
    {chair:
    - else:
        ~spawnChoice("Chair", "chair_search", 8, "middle")
    }
}
~waitNextLine(9)
(Hmm...)#Speaker:kai 
(Wait... I think I hear footsteps.)
->law_return



=== book_search ===
~books = true 
~search++
You scan the spines, attempting to read the symbols they display to no avail.#Speaker:BLANK
(I don't think this is a human language...)#Speaker:kai 
(It doesn't seem like the will is here. I'll have to keep looking.)
->alone


=== desk_search === //UNFINISHED
{d_start:
- else:
    You walk around the side of the desk; pairs of drawers and cabinets come into view.#Speaker:BLANK
    (I need to be quick... I can probably only check two of these compartments.)#Speaker:kai 
    ~d_start = true
    ~cab = true
    ~search++
}
{checking < 2:
    (What should I check?)#Speaker:kai 
    {left_drawer:
    - else:
        * [Top left drawer]
            You open the drawer, finding a handful of pens and paperclips.#Speaker:BLANK
            (I'm glad I'm not the only person who has loose paperclips.)#Speaker:kai 
            ~left_drawer = true 
            ~checking++
            ->desk_search
    }
    {right_drawer:
    - else:
        * [Top right drawer]
            The drawer jiggles open halfway, revealing... candy wrappers?#Speaker:BLANK
            (Looks like someone's got a sweet tooth.)#Speaker:kai 
            ~right_drawer = true
            ~checking++
            ->desk_search
    }
    
    {left_cab:
    - else:
        * [Bottom left cabinet]
            You open the cabinet and find a lone piece of tattered paper.#Speaker:BLANK
            (Bingo!)#Speaker:kai 
            (Wait... I think I hear footsteps...)
            ~left_cab = true 
            ->law_return 
    }
    {right_cab:
    - else:
        * [Bottom right cabinet]
            The hinges moan as the door opens, revealing shelves of jars filled with shimmering liquids.#BLANK
            One of them starts to reveal a face, emitting a groan.
            (Nope.)#Speaker:kai 
            ~right_cab = true 
            ~checking++
            ->desk_search
    }
- else:
    (Crap - I think I hear footsteps.)
    ->law_return
}
~waitNextLine(15)
Exited if statement 
->DONE

=== chair_search ===
~chair = true 
~search++
The velvety cushion reveals nothing but dust underneath, mirroring your findings under the chair.#Speaker:BLANK
(Hm... no sign of a will here.)#Speaker:kai 
(I'll have to search somewhere else.)
->alone 




=== law_return ===
The door opens and the lawyer walks briskly behind the desk.#Speaker:BLANK
"Thank you for your patience. Seems I left it in the lounge, though I don't know how it got there."#Speaker:lawyer 
"Good thing you found it."#Speaker:kai 
"Very."#Speaker:lawyer
...#Speaker:BLANK
"Well, I suppose you won't want to sit while I write. Please, feel free to explore the rest of the estate. I'm sure we'll cross paths before your visit is over."#Speaker:lawyer
"Right... yeah. I guess I'll see you around."#Speaker:kai
As the monster begins to write you walk towards the exit, 
->law_win

=== fire ===
"People see him coming towards the gate - or, well, at least they think it's him. They can't really tell because it's just a giant flame rolling on the ground."
"He doesn't make it halfway, stopping and just... burning."
"Some watch, some stay. Once the flames die down they just see a pile of ash."
"Afterwards, people start saying they see him in the windows, fire and all, and sometimes the light reveals another figure behind him."
...#Speaker:BLANK
"Wow..."#Speaker:lawyer
"I knew humans liked their stories, but I never anticipated such a tall tale."
"It's impressive."
"Pardon me, I need to find my journal and write this all down."
The lawyer stands up and moves to a nearby bookshelf, completely engrossed in scanning the spines.#Speaker:BLANK
~waitNextLine(3)
~spawnChoice("The bookshelf", "bookshelf", 5, "bottom-left")
~spawnChoice("The desk", "desk", 5, "bottom-right")
(Now's my chance! Where should I start looking first?)#Speaker:kai 
"Hm..."#Speaker:lawyer
"Seems I've misplaced it. Please excuse me for a moment."
A few strides and one closed door later, you're alone in the room.#Speaker:BLANK
->alone



=== intervention ===
"But it does't work. They try everything to convince him but he refuses to listen."#Speaker:kai 
"It gets to the point where one of them tries to see what's inside the house, only for the guy to chase them out with a crowbar."
"And after a while, they stop trying."
"He's seen a few times walking around the house, but nobody ever hears from him again."
...#Speaker:BLANK
"How... depressing."#Speaker:lawyer
"Except... there's no mention of monsters in your story."
(Shit...)#Speaker:kai 
"Thank you for trying, but it seems you've failed to conceal the reason why you're here."#Speaker:lawyer
"Unfortunately, I can't let you live - preserve my freedom and all that."
"But it was nice chatting with you."
->law_death


=== bankrupt ===
"And starts begging people to help, but nobody does."#Speaker:kai 
"So he goes back into the house, and is never seen again."
"My, what a story."#Speaker:lawyer
"Except, you never said where the monsters part of it came from."
(Oh no...)#Speaker:kai 
"Thank you for trying, but it seems you've failed to conceal the reason why you're here."#Speaker:lawyer
"Unfortunately, I can't let you live - preserve my freedom and all that."
"But it was nice chatting with you."
->law_death


===  missing ===
"And nobody sees him... until one summer day."#Speaker:kai
"He's in a meadow, screaming into the air and covered in dirt."#Speaker:kai 
"They try to get closer to him, but can't. He stays the same distance no matter how much they walk. Then he disappears in a cloud of smoke."
"Some say that he can be seen in the windows of the house, flashing between a human and an indescribable monster."
"Some say... if you try and enter the house, you'll face the same fate."
...#Speaker:BLANK
"Wow..."#Speaker:lawyer
"I knew humans liked their stories, but I never anticipated such a tall tale."
"It's impressive."
"Pardon me, I need to find my journal and write this all down."
The lawyer stands up and moves to a nearby bookshelf, completely engrossed in scanning the spines.#Speaker:BLANK
~waitNextLine(3)
~spawnChoice("The bookshelf", "bookshelf", 5, "bottom-left")
~spawnChoice("The desk", "desk", 5, "bottom-right")
(Now's my chance! Where should I start looking first?)#Speaker:kai 
"Hm..."#Speaker:lawyer
"Seems I've misplaced it. Please excuse me for a moment."
->alone




//PLEAD BACK TO INTERVIEW KNOT
=== interview_ag === //UNFINISHED
"You have more to say about interviewing me?"#Speaker:lawyer
"Well, I was hoping you could tell me more about yourself."#Speaker:kai 
"Myself? What, as in my career?"#Speaker:lawyer
"I mean, sure."#Speaker:kai 
~spawnChoice("Or your life", "life_story", 5, "top-right")
"Let's see... I first took an interest in souls and binding contracts about 1,000 years ago, when I started archiving #Speaker:lawyer
->END


//INTERVIEW KNOT MANAGE THIS
{=== interview_ag ===
"I'm still surprised how you ended up here, and that you want to learn more about us."#Speaker:lawyer
"Goes to show how effective shoving us in a closet was."
"Are we meeting expectations?"
~saveState("interview_ag")
"Well..."#Speaker:kai
"I don't know what I expected, but so far it's been... interesting?"
"I'm glad the estate amuses you."#Speaker:lawyer
"I've come to find it mundane, though I have a half-century of existing here to blame for that."
~spawnChoice("You've been here for 50 years?!", "century", 5, "top-left")
"*Sigh* If I could go back in time, I would have stopped myself from signing that contract."
~waitNextLine(2)
~spawnChoice("About that...", "cont_look", 10, "bottom-left")
"Such a waste, working a soul contract with a soulless family."
~spawnChoice("Soul contract?", "contract", 10, "top-right")
"But alas, I cannot change my mistake."
"Thankfully, my days might be numbered."
"But of course, I cannot dismiss the power of human determination."
"An admirable yet aggravating trait you all posess."
(Numbered days?)#Speaker:kai 
"Nevermind that. It's not important."
"Let's talk about you."
->learn_kai}



=== century ===
"Oh, yes. Far too long, if you ask me."#Speaker:lawyer
"I've been waiting for a way to get out of this house, and with the recent passing of Rich Rhcardson VII it has presented itself."
"But enough about that, I want to know more about you."
->learn_kai

=== cont_look ===
~suspicion++
"I've been looking for a soul contract, and I was told it was here."#Speaker:kai
"Have you seen it?"
"Hm... elaborate on this 'soul contract.' What purpose does it serve?"#Speaker:lawyer
~spawnChoice("I don't know, but...", "know_truth", 10, "bottom-left")
~spawnChoice("It's just a rumor", "rumor", 10, "bottom-right")
"There are many kinds, so you'll have to be more specific."
"There's selling."
"Siphoning."
"Um..."
"..."
~waitNextLine(2)
"I can assure you there's more, they're just escaping my mind right now."
"..."
->law_stare

=== contract ===
~suspicion++
"Yes, a soul contract. Does that interest you?"#Speaker:lawyer 
~spawnChoice("Actually, yeah...", "cont_look", 5, "bottom-left")
"I'm not surprised, given how they're not practiced in this world."
"Though I've heard of how ludicrous human's stories about them get."
"In fact, I'd like to hear this story."
(Wait...)#Speaker:kai 
->legend

=== know_truth ===
"The person that I'm here for told me about one."#Speaker:kai 
"Really? And what are you here for?"#Speaker:lawyer
"I'm supposed to find one? I'm not really sure."#Speaker:kai
"She said it was a will, but given the circumstances I wouldn't be surprised if it was a soul contract."
->will

=== rumor ===
"Just a rumor?"#Speaker:lawyer
"Well, good thing I love rumors."
->legend




=== will ===
"Oh?"#Speaker:lawyer
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
"Of course."#Speaker:lawyer
"Though, I must ask."
(...)
"Did you really think it would be that easy?"
->take_death


=== easy ===
"Hmph..."#Speaker:lawyer
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
"A smart decision."#Speaker:lawyer 
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
The paper in your hand starts to glow as the temperature rises.#Speaker:BLANK
//FIRE HISSING SOUND
Despite your efforts it sticks to you, smoke emitting from your hand.
Cackling and the smell of burnt skin engulf the room; your vision darkens as you collapse to the floor.
"It seems dinner is served."#Speaker: lawyer
~lose()


=== law_death ===
You jump back as the monster swipes its pointed fingers across the desk.#Speaker:BLANK
As your fingers meet the door handle you find it locked.
"Don't worry, you won't suffer."#Speaker:lawyer
~lose()


=== law_stare === //UNFINISHED
"Are you going to speak, or just stand there and stare?"#Speaker:lawyer
"I'm not a fan of this behaviour, so it would be wise for you to speak up."
//FIND A WAY TO RESPOND AND THEN RETURN TO PREVIOUS SAVE KNOT
Sorry I'm not done working on this part eeeee


=== law_win ===
{left_cab:
    -> law_success
- else:
    ->law_forgot
}
->DONE


=== law_forgot ===
(That was intense... but at least I'm alive.)#Speaker:kai
(I don't know how I managed to go that entire time without asking what the hell it was.)
(Then again, I don't know what any of the... 'people'... here are.)
(Wait... Shit... I forgot to get the will.)
~win()

=== law_success ===
(That was intense... but at least I'm alive.)#Speaker:kai
(I don't know how I managed to go that entire time without asking what the hell it was.)
(Then again, I don't know what any of the... 'people'... here are.)
(I can't let myself dwell on this - I have the will, now I just need to get out.)
~win()
