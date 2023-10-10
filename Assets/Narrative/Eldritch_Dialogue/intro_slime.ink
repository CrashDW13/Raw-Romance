EXTERNAL spawnChoice(message, knot, time, positionPreset)
EXTERNAL saveState()
EXTERNAL waitNextLine(delaySeconds)

=== core_start ===

-> intro_beg

=== intro_beg ===
~saveState()
~saveState()

~spawnChoice("Hi.", "welc", 10, "top-left")
~spawnChoice("Hello?", "welc", 10, "top-right")
...
...
~waitNextLine(5)
//remove greet options here
"Why are you here?"
~saveState()
~spawnChoice("I'm looking for someone.", "looking", 10, "top-left")
~spawnChoice("That's none of your business.?", "no_bis", 10, "top-right")
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
"You must be naive if you've come here of your own free will."
"Or unfortunate, if you're here against your wishes."
~saveState()
~spawnChoice("I chose to be here.?", "chose", 10, "top-left")
~spawnChoice("You think I want to be here?", "lie_str", 10, "top-right")
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
...
"Your honesty has been recognized."
"Now, let me ask you something."
~saveState()

-> intro_cont


=== lie_str ===
"A liar."
"I like liars."
"Though I do hope you'll be truthful enough to answer my next question."
~saveState()

-> intro_cont


=== looking ===
"Someone..."
"So that is what brings you to our den."
"Your honesty is admirable."
"Now, I have another question for you."
~saveState()

-> intro_cont



=== no_bis ===
...
"Curt sencences will not help you here."
"Remember: you came to me."
"Do you ununderstand?"
~saveState()
~spawnChoice("Yes?", "y", 10, "top-left")
~spawnChoice("No?", "n", 10, "top-right")
~waitNextLine(10)
...
"What a shame."
"Your comprehension seems to have disappeared."


-> intro_death


=== y ===
"Good."
"Now, I have another question for you."
~saveState()

-> intro_cont


=== n ===
...
"Then I will make you understand."
~saveState()

-> intro_death


=== intro_death ===
The monster stands, slowly outstretching its arms as it leans over towards you. You feel its cold hands touch your face, liquid slowly engulfing your lungs as your vision darkens.
# lose
->END


=== intro_cont ===
// go to core_slime dialogue
-> END
