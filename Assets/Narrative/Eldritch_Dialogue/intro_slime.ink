
-> intro_beg

=== intro_beg ===
+ [Hi.] -> welc
...
+ [Hello?] -> welc
...
...
//remove greet options here
"Why are you here?"
+ [I'm looking for someone.] -> looking
+ [That's none of your business] ->no_bis
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
"You must be naïve if you've come here of your own free will."
"Or unfortunate, if you're here against your wishes."
+ [I chose to be here.] -> chose
+ [You think I want to be here?] -> lie_str
...
"So, which is it?"
...
...
"Do not make me answer for you."
...
//remove both options here
...
"Naïve it is, then."
-> intro_death


=== chose ===
"I wonder what compels someone to come here."
...
"Your honesty has been recognized."
"Now, let me ask you something."
-> intro_cont


=== lie_str ===
"A liar."
"I like liars."
"Though I do hope you'll be truthful enough to answer my next question."
-> intro_cont


=== looking ===
"Someone..."
"So that is what brings you to our den."
"Your honesty is admirable."
"Now, I have another question for you."
-> intro_cont



=== no_bis ===
...
"Curt sencences will not help you here."
"Remember: you came to me."
"Do you ununderstand?"
+ [Yes] -> y
+ [No] -> n
...
"What a shame."
"Your comprehension seems to have disappeared."
-> intro_death


=== y ===
"Good."
"Now, I have another question for you."
-> intro_cont


=== n ===
...
"Then I will make you understand."
-> intro_death


=== intro_death ===
The monster stands, slowly outstretching its arms as it leans over towards you. You feel its cold hands touch your face, liquid slowly engulfing your lungs as your vision darkens.
->END


=== intro_cont ===
// go to core_slime dialogue
-> END
