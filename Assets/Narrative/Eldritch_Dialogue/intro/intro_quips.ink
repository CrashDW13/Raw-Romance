
->entrance

VAR richard = false

=== entrance ===
Welp...
This looks creepy enough to be the right place.
Time to go in.
->END

=== entrance_gate ===
(I grabbed the door handles and gave them a few forceful tugs.)
(With a little elbow grease, the iron gate swung open...)

=== courtyard ===
Yeesh... This place could use a facelift.
->END

=== bushes ===
The bushes look like they could use some TLC.
->END

=== fountain ===
I wonder who's paying the water bill.
->END

=== placard ===
'Rich Richardson.' Who would name their child that?
~richard = true
->END



//SLIME ROOM



=== sidetable ===
It's a rotting sidetable with a leather journal resting on top.
Flip through the journal?
    * [Yes] ->snoop
    * [No] ->no_snoop


=== portrait ===
{richard} -> portrait_know
It's a dusty painting.
The plaque underneath it reads "Rich Richardson, 1936"
"Beloved father, businessman, and homeowner."
~richard = true

=== portrait_know ===
It's a dusty painting.
The plaque underneath it reads "Rich Richardson, 1936"
"Beloved father, businessman, and homeowner."
'Now I can put a name to the face.'
->END


=== display ===
A coud of dust erupts as you swipe your hand across the display case.
Inside you see a bronze statue of Lady Justice.
->END


=== door ===
Ready to see what lies ahead?
    *[Yes] //SEND PLAYER TO CORE_SLIME

    *[No]->END

=== snoop ===
You pick it up; the leather is smooth.
The aged and yellow pages are covered with passages written in hurried cursive.
A few sentences stick out to you.
"...weak are those who do not repent..."
"...truth will guide..."
"...consume the..."
...
'Creepy.'
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
