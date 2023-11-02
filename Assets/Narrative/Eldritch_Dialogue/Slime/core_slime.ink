//eldritch main dialogue
EXTERNAL spawnChoice(message, knot, time, positionPreset)
EXTERNAL saveState(knot)
EXTERNAL waitNextLine(delaySeconds)
EXTERNAL lose()
EXTERNAL win()
EXTERNAL doPlaySFX(soundName)
VAR lieTold = false


->core_start

=== core_start ===
~saveState("core_start")
~spawnChoice("Hi.", "welc", 10, "top-left")
~spawnChoice("Hello?", "welc", 10, "top-right")
~waitNextLine(6)
...
...

//remove greet options here
"Why are you here?"
~spawnChoice("I'm looking for someone.", "looking", 10, "bottom-left")
~spawnChoice("That's none of your business.", "no_bis", 10, "bottom-right")
...

...

"I will only ask one more time."
"Why are you here?"
...
...
// remove options here
"Have it your way."
-> intro_death

=== welc ===
"Welcome."
~saveState("welc_rpt")
"You must be naive if you've come here of your own free will."
"Or unfortunate, if you're here against your wishes."
~spawnChoice("I chose to be here.", "chose", 10, "middle-left")
~spawnChoice("You think I want to be here?", "lie_str", 10, "middle-right")
...
"So, which is it?"
...
...
"Do not make me answer for you."

~waitNextLine(5)
...
//remove both options here
...
"Naive it is, then."
-> intro_death


//WELCOME REPEAT
=== welc_rpt ===
"Welcome, again."
"It seems you want me to repeat myself."
"You must be naive if you've come here of your own free will."
"Or unfortunate, if you're here against your wishes."
~saveState("welc")
~spawnChoice("I chose to be here.", "chose", 10, "middle-left")
~spawnChoice("You think I want to be here?", "lie_str", 10, "middle-right")
...
"So, which is it?"
...
...
"Do not make me answer for you."

~waitNextLine(5)
...
//remove both options here
...
"Naive it is, then."
-> intro_death


=== chose ===
"I wonder what compels someone to come here."
~saveState("chose")
...
"Your honesty has been recognized."
"Now, let me ask you something."

-> core_cont


=== lie_str ===

"A liar."
~saveState("lie_str")
"I like liars."
"Though I do hope you'll be truthful enough to answer my next question."
~lieTold = true
-> core_cont


=== looking ===
"Someone..."
~saveState("looking")
"So that is what brings you to our den."
"Your honesty is admirable."
"Now, I have another question for you."


-> core_cont



=== no_bis ===
...
~saveState("no_bis_rpt")
"Curt sencences will not help you here."
"Remember: you came to me."
"Do you ununderstand?"
~spawnChoice("Yes", "y", 10, "top-left")
~spawnChoice("No", "n", 10, "top-right")
~waitNextLine(10)
...
"What a shame."
"Your comprehension seems to have disappeared."


-> intro_death


=== no_bis_rpt ===
~saveState("no_bis_rpt")
"Need I remind you that curt sencences will not help you here."
"Remember: you came to me."
"Do you ununderstand?"
~spawnChoice("Yes", "y", 10, "top-left")
~spawnChoice("No", "n", 10, "top-right")
~waitNextLine(10)
...
"What a shame."
"Your comprehension seems to have disappeared."
->intro_death


=== y ===
"Good."
"Now, I have another question for you."

-> core_cont


=== n ===
...
"Then I will make you understand."

-> intro_death


=== intro_death ===
The monster stands, slowly outstretching its arms as it leans over towards you. You feel its cold hands touch your face, liquid slowly engulfing your lungs as your vision darkens.
# lose
~lose()



=== intro_cont ===
// go to core_cont dialogue
-> core_cont





//CORE DIALOGUE START

=== core_cont ===
~saveState("start_rpt")

"Be warned, I do not take silence as a satisfactory answer."
...
"Now; do you know what your worst lie is?"
~saveState("start_rpt")
~spawnChoice("Yes", "know", 15, "top-left")
~spawnChoice("No", "dont_know", 15, "top-right")
"The one that came with the most consequences?"
// options that appear

//cont txt
"Maybe it's a white lie, such as drawing on the walls as a child."
"Or perhaps you were somewhere you weren't meant to be."
"Or maybe, it's something more sinister."
...
"Now tell me, do you know what your worst lie is? Or are you still searching for an answer?"
...
//remove options
...
~waitNextLine(2)
"I told you, I don't like silence."
-> core_death

//REWIND TO START
=== start_rpt ===
~saveState("start_rpt")
"Ah, back to the beginning."
"Reminder that I do not take silence as a satisfactory answer."
...
"Now; do you know what your worst lie is?"
~spawnChoice("Yes", "know", 15, "top-left")
~spawnChoice("No", "dont_know", 15, "top-right")
"The one that came with the most consequences?"
// options that appear

//cont txt
"Maybe it's a white lie, such as drawing on the walls as a child."
"Or perhaps you were somewhere you weren't meant to be."
"Or maybe, it's something more sinister."
...
"Now tell me, do you know what your worst lie is? Or are you still searching for an answer?"
...
//remove options
...
~waitNextLine(2)
"I told you, I don't like silence."
-> core_death


=== know ===
~saveState("know_rpt")
"Good."
"Have you made peace with it?"
~spawnChoice("I've made peace with it.", "peace", 10, "top-right")
"Or are you able to recall it so quickly because the guilt haunts you?"

~spawnChoice("I'm still haunted by it.", "haunted", 10, "top-left")
"A nagging feeling in the back of your head, interrupting your thoughts like a newborn and sleep."
//remove peace option here
"Or maybe it's a jacket during the transition from summer to autumn: a little too warm, but taking it off would leave you vulnerable to the consequences of the elements."

"Or would you describe it as a monster in the corner, completely forgotten until you're in bed and the lights are off."
"Staring at you with a smile and cocked head as you try to sleep."
~spawnChoice("I try not to think about it", "avoid", 10, "bottom-right")

"Or maybe, it grips at your throat when you think of it."
"And you cannot speak or move."
"Like prey once it knows it's been cornered."
...
"So, which is it?"
"There is clearly no peace within you."
"Do you wallow or cower?"
...
~waitNextLine(2)
//remove haunted and avoid options here
...
"Or maybe, you freeze."
-> core_death

/KNOW DIALOGUE REPEAT
=== know_rpt ===
~saveState("know_rpt")
"I understand we're back here because your answer has changed."
"So, let's try again."
"Your worst lie."
"Have you made peace with it?"

~spawnChoice("I've made peace with it.", "peace", 10, "top-right")
"Or are you able to recall it so quickly because the guilt haunts you?"
"A nagging feeling in the back of your head, interrupting your thoughts like a newborn and sleep."
//remove peace option here
"Or maybe it's a jacket during the transition from summer to autumn: a little too warm, but taking it off would leave you vulnerable to the consequences of the elements."

~spawnChoice("I'm still haunted by it.", "haunted", 10, "top-left")

"Or would you describe it as a monster in the corner, completely forgotten until you're in bed and the lights are off."
"Staring at you with a smile and cocked head as you try to sleep."

~spawnChoice("I try not to think about it", "avoid", 10, "bottom-right")

"Or maybe, it grips at your throat when you think of it."
"And you cannot speak or move."
"Like prey once it knows it's been cornered."
...
"So, which is it?"
"There is clearly no peace within you."
"Do you wallow or cower?"
...
~waitNextLine(2)
//remove haunted and avoid options here
...
"Or maybe, you freeze."
-> core_death


=== peace ===
"Good."
~saveState("peace_rpt")
"Guilt is a parasite, inescapable and evasive."
"Diagnosable, with a plethora of potential medications."
"Potential cures."
...
"And a sliding scale of remission."
...
"Tell me, was your lie victimless?"

~spawnChoice("Yes", "a_victim", 10, "middle-right")

"Without consequence?"
"And thus, your conscience has remained clean?"
"Are you so far removed from reality to believe that there is no consequence?"
"Or was someone at the mercy of your words?"
//remove yes option
"Did you know you held that power?"
"Did you revel in it?"
"Did you make peace with the victims of your actions?"
"Or have you only made peace with yourself?"

~spawnChoice("I've atoned.", "atone", 10, "top-left")
~spawnChoice("Only with myself", "reparations", 10, "top-right")

"Or, were you the victim?"
"Unknowingly working against yourself."

~spawnChoice("I was the victim", "self", 10, "bottom-left")

"Or perhaps, you knew you would be the victim."
"Incriminating yourself to protect others, or because it's what you've been taught to do."
"I don't know if that's admirable or pitiful."
...
"Perhaps you never reflected."
"Never contemplated the ripples after they escaped your wingspan."
//remove all options
"Ignorance is, indeed, bliss."
"Let me help you maintain that ignorance."
-> core_death


//PEACE DIALOGUE REPEAT
=== peace_rpt ===
~saveState("peace_rpt")
"Let's re-discuss how you've come to find peace with your lie."
"As I said before, guilt is a parasite, inescapable and evasive."
"Diagnosable, with a plethora of potential medications."
"Potential cures."
...
"And a sliding scale of remission."
...
"Tell me, was your lie victimless?"

~spawnChoice("Yes", "a_victim", 10, "middle-right")

"Without consequence?"
"And thus, your conscience has remained clean?"
"Are you so far removed from reality to believe that there is no consequence?"
"Or was someone at the mercy of your words?"
//remove yes option
"Did you know you held that power?"
"Did you revel in it?"
"Did you make peace with the victims of your actions?"
"Or have you only made peace with yourself?"

~spawnChoice("I've atoned.", "atone", 10, "top-left")
~spawnChoice("Only with myself", "reparations", 10, "top-right")

"Or, were you the victim?"
"Unknowingly working against yourself."

~spawnChoice("I was the victim", "self", 10, "bottom-left")

"Or perhaps, you knew you would be the victim."
"Incriminating yourself to protect others, or because it's what you've been taught to do."
"I don't know if that's admirable or pitiful."
...
"Perhaps you never reflected."
"Never contemplated the ripples after they escaped your wingspan."
//remove all options
"Ignorance is, indeed, bliss."
"Let me help you maintain that ignorance."
-> core_death



=== a_victim ===
"Ah, I see."
"You are truly ignorant to the concept of consequence."
"Let me help you maintain that ignorance."
-> core_death


=== atone ===
//if lie = true 
// ->atone_lie
{not lieTold} ->lie_death
"A truly clean conscience."
"How admirable."
"I hope is stays that way during your time here."
"Good luck."
-> core_live
//IF PLAYER LIES DURING CHAPT 1 LETS HAVE THEM DIE HERE

===lie_death===
"And yet, I find that hard to believe."
"All you have is your word, and you've already shown the lack of weight it holds."
"I said I liked liars."
"What I meant was I like how they taste."
-> core_death



=== reparations ===
...
~saveState("reparations_rpt")
"I expected as much from a human."
"Such fickle creatures."
"Given your lifespan, I suppose it makes sense."
"If you're around for such a short time, why bother with reparations."
"Do you agree?"

~spawnChoice("It's not like it matters", "a_victim", 10, "middle-left")

"Nobody will remember it come the next century, so what's the point?"
"There's also the possibility you haven't gathered the courage to correct the record."

~spawnChoice("It's daunting, correcting the record", "courage", 10, "middle")

"Or, have you run out of time?"
"Unable to correct it even if you tried."
"Which is it?"
~spawnChoice("I ran out of time", "no_time", 10, "middle-right")

"Both options are disheartening, to say the least."
"Though, one does offer a path forward."
"Will or would you take that path?"
"Or perhaps you'll sit comfortably, knowing there's nothing that needs to be done."
//correct record option disappear here
...
...
"Maybe, akin to addressing the consequence, you, too, are running out of time."
//run out of time disappear Here
"Nihilistic about spending it on the cost of reconciling."
...
//doesn't matter option disappear here
"No matter, then."
"Let me help you spend the rest of your time."
-> core_death


//REPARATIONS REPEAT
=== reparations_rpt ===
...
~saveState("reparations_rpt")
"I hold the same opinion as the last time."
"To only make peace with yourself and not another."
...
"I expected as much from a human."
"Such fickle creatures."
"Given your lifespan, I suppose it makes sense."
"If you're around for such a short time, why bother with reparations."
"Do you agree?"

~spawnChoice("It's not like it matters", "a_victim", 10, "middle-left")

"Nobody will remember it come the next century, so what's the point?"
"There's also the possibility you haven't gathered the courage to correct the record."

~spawnChoice("It's daunting, correcting the record", "courage", 10, "middle")

"Or, have you run out of time?"
"Unable to correct it even if you tried."
"Which is it?"
~spawnChoice("I ran out of time", "no_time", 10, "middle-right")

"Both options are disheartening, to say the least."
"Though, one does offer a path forward."
"Will or would you take that path?"
"Or perhaps you'll sit comfortably, knowing there's nothing that needs to be done."
//correct record option disappear here
...
...
"Maybe, akin to addressing the consequence, you, too, are running out of time."
//run out of time disappear Here
"Nihilistic about spending it on the cost of reconciling."
...
//doesn't matter option disappear here
"No matter, then."
"Let me help you spend the rest of your time."
-> core_death


=== courage ===
"Such a pity."
"Enough courage to face monsters, just not your own."
"I find humor in that."
"You fear yourself more than you fear me."
"The consequences scarier than mortality."
...
"But, it is your dishonesty to correct."
"I hope your time here builds courage."
"That, if you leave this place, you will be able to face your monsters."
"Good luck."
//SANITY PENALTY: MEDIUM
-> core_live


=== no_time ===
"Ah, an outcome with no reconciliation."
"Unfortunate, to say the least."
"I hope your peace is enough for you."
"And that in the future you will have enough time."
//SANITY PENALTY: MEDIUM
-> core_live



=== self ===
"I wonder what compelled you to do such a thing."
"Purposefully incriminating yourself."
"Hopefully you've made peace with yourself as both the instigator and victim."
//SANITY PENALTY: LOW
-> core_live

=== haunted ===
"Pity, feeling followed by the shadow of your choices."
~saveState("haunted_rpt")
"What does it feel like?"
"A jacket worn too early in the season?"
"A child and the boogeyman?"
"An itch that keeps coming back?"
"I wonder what guilt feels like to a human."
"Your lives are so short, and it seems many of you never find the courage to reconcile."
"It must be exhausting, carrying it with you everywhere you go."
"Do you hope to make peace with it?"
~spawnChoice("I want to move past it", "want", 10, "bottom-left")

"Develop means to alleviate the weight on your shoulders."
"Or perhaps you're yet to realize you have a choice in the matter."
"I assure you, you do."
~spawnChoice("I don't know if I can move past it", "courage", 10, "bottom-right")

"Strange, how many of you I've met that either believe they can control everything or nothing."
"The former is amusing, the latter disheartening."
"Which path do you want to take?"
"There is only so much time left for you."
//want to move past option disappear here
"Will you feed into your companion?"
"Or find the courage to help yourself?"
~spawnChoice("I don't know.", "freeze", 10, "middle")
...
//dk if can move past option disappear here
...
"Do not let yourself freeze. You had the courage to come here, you have the courage to make this decision."
...
//dk option disappear here
"I see."
"Let me free you from the paralysis you are experiencing."
-> core_death


//HAUNTED REPEAT
=== haunted_rpt ===
~saveState("haunted_rpt")
"Tell me again how you're haunted by your past."
"It's such a pity, feeling followed by the shadow of your choices."
"What does it feel like?"
"A jacket worn too early in the season?"
"A child and the boogeyman?"
"An itch that keeps coming back?"
"I wonder what guilt feels like to a human."
"Your lives are so short, and it seems many of you never find the courage to reconcile."
"It must be exhausting, carrying it with you everywhere you go."
"Do you hope to make peace with it?"
~spawnChoice("I want to move past it", "want", 10, "bottom-left")

"Develop means to alleviate the weight on your shoulders."
"Or perhaps you're yet to realize you have a choice in the matter."
"I assure you, you do."
~spawnChoice("I don't know if I can move past it", "courage", 10, "bottom-right")

"Strange, how many of you I've met that either believe they can control everything or nothing."
"The former is amusing, the latter disheartening."
"Which path do you want to take?"
"There is only so much time left for you."
//want to move past option disappear here
"Will you feed into your companion?"
"Or find the courage to help yourself?"
~spawnChoice("I don't know.", "freeze", 10, "middle")
...
//dk if can move past option disappear here
...
"Do not let yourself freeze. You had the courage to come here, you have the courage to make this decision."
...
//dk option disappear here
"I see."
"Let me free you from the paralysis you are experiencing."
-> core_death



=== want ===
"Good. That is the first step."
"The second is finding your words, something you will have ample time to do during your time here."
"Third, you must take the courage that brought you through those doors and carry it out with you."
"Let it lead you to your peace."
"I hope you will have enough left once you finish your time here."
//SANITY AFFECT: NONE
-> core_live

//IF PLAYER LIES DURING CHAPT 1 LETS HAVE THEM DIE HERE
/*LIE dialogue
"And yet, I find that hard to believe."
"All you have is your word, and you've already shown the lack of weight it holds."
"I said I liked liars."
"What I meant was I like how they taste."
-> core_end
*/

=== freeze ===
"But you must."
"Deep down, you know."
"Do not fool yourself into thinking you have not already made up your mind, albeit subconsciously."
"Search for the answer. It is better to find it sooner than later, and worse to find it once your decision no longer matters."
...
"I hope, when you leave this place - if you leave this place - you will know what you've decided."
"Until then, all I can do is wish you good luck."
//SANITY PENALTY: MED-HIGH
-> core_live


=== avoid ===
"Ah, so you shun out the world."
~saveState("avoid_rpt")
"Content to exist in your world, like a child with her head under the covers."
"How cute."
"Do you think you'll come out from under the covers one day?"
"Move past it?"
~spawnChoice("I want to", "want", 10, "middle")

"Find a path where you no longer need to hide from the monster in your closet?"
"Or do you plan to stay under the covers?"
"Pretend the outside world doesn't exist, even when you know you can't stay in your fantasy world forever?"
//I want option disappear here
"Though I understand the appeal, it must be exhausting."
"Delusion is a consuming hobby."
"Do not let it fester during your time here. They will sense and exploit it."
"I hope you will maintain your sense of reality here."
"And that if you leave this place, you will use it to leave the covers you've been hiding under."
-> core_live

//AVOID REPEAT
=== avoid_rpt ===
~saveState("avoid_rpt")
"Ah, we visit this topic once more."
"Do you still want to hide under the covers?"
"Content to exist in your world, like a child with her head under the covers."
"How cute."
"Do you think you'll come out from under the covers one day?"
"Move past it?"
~spawnChoice("I want to", "want", 10, "middle")

"Find a path where you no longer need to hide from the monster in your closet?"
"Or do you plan to stay under the covers?"
"Pretend the outside world doesn't exist, even when you know you can't stay in your fantasy world forever?"
//I want option disappear here
"Though I understand the appeal, it must be exhausting."
"Delusion is a consuming hobby."
"Do not let it fester during your time here. They will sense and exploit it."
"I hope you will maintain your sense of reality here."
"And that if you leave this place, you will use it to leave the covers you've been hiding under."
-> core_live


=== dont_know ===
"Understandable. Many would like to forget their wrongdoings."
~saveState("dont_know_rpt")
"Especially the worst of them."
~spawnChoice("I think I have one.", "know", 10, "mop-left")

"Ignoring it until it goes away, like a mosquito bite."
"Or crawls into bed and talks until sunrise."
"Like a little pet."
~spawnChoice("I'm having trouble picking the worst", "trouble", 10, "mop-right")

"Or perhaps, a parasite?"
"Following you around, no matter how hard you try to get rid of it."
//think I have one option disappear here
"Have you even tried to get rid of it?"
"Address the unwanetd companion?"
~spawnChoice("I really can't think of anything", "none", 10, "middle")

"Or do you just ignore it."
"Sit in silence, like you are currently."
//picking the worst option disappear here
"And do so for just a bit too long."
//can't think option disappear here
"Running out of options despite knowing the consequences."
->core_death

=== dont_know_rpt ===
~saveState("dont_know_rpt")
"Do you have a different answer for me now?"
"I understand that many would like to forget their wrongdoings."
"Especially the worst of them."
~spawnChoice("I think I have one.", "know", 10, "mop-left")

"Ignoring it until it goes away, like a mosquito bite."
"Or crawls into bed and talks until sunrise."
"Like a little pet."
~spawnChoice("I'm having trouble picking the worst", "trouble", 10, "mop-right")

"Or perhaps, a parasite?"
"Following you around, no matter how hard you try to get rid of it."
//think I have one option disappear here
"Have you even tried to get rid of it?"
"Address the unwanetd companion?"
~spawnChoice("I really can't think of anything", "none", 10, "middle")

"Or do you just ignore it."
"Sit in silence, like you are currently."
//picking the worst option disappear here
"And do so for just a bit too long."
//can't think option disappear here
"Running out of options despite knowing the consequences."
->core_death

=== none ===
"Oh? Nothing at all?"
~saveState("none_rpt")
~spawnChoice("Actually, I know what my lie is", "know", 10, "top-left")
"How peculiar."
"So, you've never told a lie?"
~spawnChoice("Never", "no_lie", 10, "top-right")

"Not once?"
"Never said you felt ill to avoid school?"
"Told someone their hair looked good when it didn't?"

//know lie option disappear here
~spawnChoice("That's not what I meant", "no_mean", 10, "bottom-left")

"Or said sorry and didn't mean it?"
//no lie option disappear Here
"If not, well... you must be a saint!"
"It's such an honour to meet you."

"You must tell me about your journey."
//no mean option disappear here
...
"Oh, wait, that's right - I almost forgot."
"Only monsters are allowed through those doors."
-> core_death


//NONE REPEAT
=== none_rpt ===
~saveState("none_rpt")
"Still nothing?"
"You can't think of anything?"
"Not a single lie?"
"Nothing at all?"
~spawnChoice("Actually, I know what my lie is", "know", 10, "top-left")
"How peculiar."
"So, you've never told a lie?"
~spawnChoice("Never", "no_lie", 10, "top-right")

"Not once?"
"Never said you felt ill to avoid school?"
"Told someone their hair looked good when it didn't?"

//know lie option disappear here
~spawnChoice("That's not what I meant", "no_mean", 10, "bottom-left")

"Or said sorry and didn't mean it?"
//no lie option disappear Here
"If not, well... you must be a saint!"
"It's such an honour to meet you."

"You must tell me about your journey."
//no mean option disappear here
...
"Oh, wait, that's right - I almost forgot."
"Only monsters are allowed through those doors."
-> core_death


=== no_mean ===
"Ah, but that means you must know what your worst lie is, now."
~spawnChoice("Yes, I do", "know", 10, "middle")

"So, will you tell me?"
"Divulge a secret?"
"I think it'll be worth both of our whiles."
...
"Or perhaps not?"
"Yor decision, of course."
...
"Now, it's time for mine."
->core_death


=== no_lie === //NEEDS MORE WORK
"Such conviction."
"But, your confidence is just amusing enough."
"Others must admire you for your honesty."
"Or maybe, you're too honest."
"Your inability to lie leading to consequence after consequence."
""How pitiful."
"Are you tortured? Or are you happy?"
"Hopefully a combination of both. You'll need it for the journey ahead."
"But know this, your honest streak will not last long here."
-> core_live
//SANITY PENALTY: light


/*IF PLAYER lied before
"I find that hard to believe."
"Seeing how you contradicted yourself during our earlier conversation."
"But, I must thank you."
"Playing with my food is my favorite sport."
-> core_death
*/


=== trouble ===
...
"That response was... unanticipated."
"And impressive."
//IF SAID LIE DURING FIRST PART CHANGE DIALOGUE TO
//"And to think you said you didn't want to be here."

"I think..."
...
"You'll do just fine."
->core_live

//SANITY PENALTY - None
//GAIN ITEM



=== core_live ===
The monster stands, walking towards a rotting wooden door. It pushes it open, a candlelit hallway greeting you from the other side.
# win
~win()



=== core_death ===
You flinch as the monster reaches over the table, the slime cool as it engulfs your face.
The last thing you see is it towering over you, your lungs filling with the thick liquid as you fall to the ground.
# lose
~lose()
