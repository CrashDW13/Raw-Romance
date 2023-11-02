
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
'Welp...'
'This looks creepy enough to be the right place.'
'Time to go in.'
->END

=== gate_open ===
(I gave the door handle a good tug.)
(It took a little elbow grease, but the iron gate eventually swung open...)
~doPlaySFX("irongatetemp")
~sceneTransition("TestTransition", "Courtyard")
->END

=== courtyard ===
'Yeesh... This place could use a facelift.'
->END

=== bushes ===
~doPlaySFX("hedges")
The bushes look like they could use some TLC.
->END

=== fountain ===
(I wonder who's paying the water bill.)
->END

=== placard ===
~doPlaySFX("placard")
("Rich Richardson.")
("Who would name their child that?")
~richard = true
->END

=== advance_to_door ===
(Just beyond this fountain is the mansion.)
(Should I continue?)
+ [Yes.] -> move_to_concierge
+ [No.] -> cancel_concierge
->END

=== move_to_concierge ===
(Nowhere to go but forward...)

~sceneTransition("TestTransition", "concierge")
->END

=== cancel_concierge ===
(Maybe I should take another look around, first. The rain's nice.)


//SLIME ROOM



=== sidetable ===
(It's a rotting sidetable with a leather journal resting on top.)
(Flip through the journal?)
    * [Yes] ->snoop
    * [No] ->no_snoop


=== portrait ===
(It's a dusty painting.)
(The plaque underneath it reads "Rich Richardson, 1936")
("Beloved father, businessman, and homeowner.")
(Now I can put a name to the face.)
~doPlaySFX("addnote")
A new note was added to your notebook.
~richard = true

=== portrait_know ===
(A portrait of "Rich Richardson," dated 1936.)
->END


=== display ===
(A cloud of dust erupts as you swipe your hand across the display case.)
(Inside you see a bronze statue of Lady Justice.)
~doPlaySFX("addnote")
A new note was added to your notebook.
->END

=== display_know ===
(A glass display showcasing a miniature of Lady Liberty.)


=== door ===
Ready to see what lies ahead?
    *[Yes]->go
    *[No]->door_stop

=== door_stop ===
(Maybe I should keep investigating...)
->END

=== snoop ===
You pick it up; the leather is smooth.
The aged and yellow pages are covered with passages written in hurried cursive.
A few sentences stick out to you.
"...weak are those who do not repent..."
"...truth will guide..."
"...consume the..."
...
'Creepy.'
A new note was added to your notebook.
->END


=== no_snoop ===
'Better to leave it alone.'
'Creepy books don't usually lead to good things.'
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


=== go ===
You push against the decaying wood, the doors swinging open.
~sceneTransition("TestTransition", "Ink Test Scene")
