
->entrance
EXTERNAL doPlaySFX(soundName)
EXTERNAL doPlayBGM(bgmsoundName)
EXTERNAL doStopBGM(bgmsoundName)
EXTERNAL spawnChoice(message, knot, time, positionPreset)
EXTERNAL slimeScene()
EXTERNAL sceneTransition(transitionPreset, sceneName)
VAR richard = false

=== entrance ===
~doPlayBGM("rainBGM")
(Welp...)
(This is creepy.)
(Let's hope the $10,000 is worth it.)
->END

=== gate_open ===
~sceneTransition("TestTransition", "Courtyard")
You tug at the slippery gate handles, only for them to stay firmly shut.
(Come on...)
You dig your feet into the mud, slowly forcing the door open.
~doPlaySFX("irongatetemp")
->END

=== courtyard ===
(Yeesh... This place could use a facelift.)
->END

=== bushes ===
~doPlaySFX("hedges")
(The bushes look like they could use some TLC.)
->END

=== fountain ===
(I wonder who's paying the water bill.)
->END

=== placard ===
~doPlaySFX("placard")
("Rich Richardson")
("Who would name their child that?")
~richard = true
->END

=== advance_to_door ===
(I can see the mansion up ahead.)
(Should I continue?)
+ [Yes.] -> move_to_concierge
+ [No.] -> cancel_concierge
->END

=== move_to_concierge ===
(Might as well get this over with.)

~sceneTransition("TestTransition", "concierge")
->END

=== cancel_concierge ===
(I should take a moment to take this all in. It's not like I'm going to be at a mansion again anytime soon.)
->END


//SLIME ROOM


=== sidetable ===
VAR journal = true
It's a rotting sidetable with a leather journal resting on top.
You pick it up; the leather is smooth.
The aged and yellow pages are covered with passages written in hurried cursive.
One of the passage reads as follows:
"Once again a Richardson has died, except this time it is without a successor. Finally, an opening for me to escape this prison."
"Hopefully the contract expires before someone can get their hands on it. They keep sending in these poor, unsuspecting individuals to find it in their place."
"I wish I didn't have to kill them but alas, I cannot let this nightmare continue."
"This family has been truly insufferable. I find myself reliving the moment where my eagerness overtook my routine of checking whether or not the human has a soul to begin with."
"Fitting, that the one time I fail to check locks me in for centuries to come. It's depressing how meager their souls are, and I suspect their capitalist greed has something to do with it."
"No matter, I've managed to fend off their pawns with ease - I suspect I will be able to continue to do so until I am free of this claustrophobic office."
"Though I cannot put into words how infuriating it is to look at the piece of paper and see my hurried signature."
"I've hidden it in the bottom left cabinet of my desk, yet despite it being out of sight the image of it looms in the back of my mind."
A new note was added to your notebook.
->END



=== portrait ===
It's a dusty painting.
The plaque underneath it reads "Rich Richardson V, 1936"
"Beloved father, businessman, and homeowner."
(Now I can put a name to the face.)
~doPlaySFX("addnote")
A new note was added to your notebook.
->END

=== portrait_know ===
A portrait of Rich Richardson V, dated 1936.
->END


=== display ===
A cloud of dust erupts as you swipe your hand across the display case.
Inside you see a bronze statue of Lady Justice.
~doPlaySFX("addnote")
A new note was added to your notebook.
->END

=== display_know ===
A glass display showcasing a miniature of Lady Justice.
->END


=== door ===
{journal:
    (Nowhere else but forward...)
    ~sceneTransition("TestTransition", "Lawyer_Test")
- else:
    (I feel like I'm missing something... Maybe I should stay and look around a bit more.)
}
->END

=== door_stop ===
(Maybe I should keep investigating...)
->END



=== armchair ===
The leather is peeling, and there's a dark and wet puddle in the middle of the chair.
You think you see it move.
->END


=== lighting ===
The shades are covered in cobwebs and mold.
->END

=== fireplace ===
The bricks are warm, but there's only charcoal inside.
->END

