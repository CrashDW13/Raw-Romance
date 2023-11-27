
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
You tug at the slippery gate handles, only for them to stay firmly shut.
(Come on...)
You dig your feet into the mud, slowly forcing the door open.
~doPlaySFX("irongatetemp")
~sceneTransition("TestTransition", "Courtyard")
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
It's a rotting sidetable with a leather journal resting on top.
Read it?
    * [Yes] ->snoop
    * [No] ->no_snoop


=== portrait ===
It's a dusty painting.
The plaque underneath it reads "Rich Richardson, 1936"
"Beloved father, businessman, and homeowner."
(Now I can put a name to the face.)
~doPlaySFX("addnote")
A new note was added to your notebook.
->END

=== portrait_know ===
A portrait of Rich Richardson, dated 1936.
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
(I know I need to search the other rooms...)
Enter the next room?
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
(Creepy.)
A new note was added to your notebook.
->END


=== no_snoop ===
(Better to leave it alone.)
(Creepy books don't usually lead to good things.)
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
(Alright, time for another creepy room.)
~sceneTransition("TestTransition", "Ink Test Scene")
