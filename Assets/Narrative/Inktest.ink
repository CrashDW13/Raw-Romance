EXTERNAL spawnChoice(message, knot, time, positionPreset)
EXTERNAL saveState()
=== demo_start ===
"This is some test dialogue." #Speaker:Bo,happy
"The next line of dialogue should spawn some choices."#Speaker:Bo,sad
~saveState()
~spawnChoice("nah that's a whole demon", "choice1", 10, "top-left")
~spawnChoice("nah that's a whole demon", "choice2", 10, "top-right")
~spawnChoice("nah that's a whole demon", "choice3", 10, "bottom-left")
~spawnChoice("nah that's a whole demon", "choice4", 10, "bottom-right")
"Test1" #Speaker:Bo,angry
"A longer test 2 to test for strange behavior regarding the coroutine??" #Speaker:Bo
"Test3?" #Speaker:Bo
->DONE

===choice1===
~saveState()
"top left is chosen."
"extra dialogie."
+[normal choice test] -> normalchoice
+[normal choice test2] -> normalchoice

==choice2==
~saveState()
"top right is chosen."
"extra dialogie."
->DONE
==choice3==
~saveState()
"bottom left is chosen."
"extra dialogie."
->DONE
==choice4==
~saveState()
"bottom right is chosen."
"extra dialogie."
->DONE
==normalchoice==
~saveState()
"normal choice chosen."
"extra dialogue."
+[another choice] ->lastchoice
->DONE
==lastchoice==
"finally last choice"
-> DONE
-> END