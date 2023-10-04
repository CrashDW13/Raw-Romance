
EXTERNAL spawnChoice(message, knot, time, positionPreset)

=== demo_start ===
"This is some test dialogue." #Speaker:Bo
"The next line of dialogue should spawn some choices." #Speaker:Bo
~spawnChoice("nah that's a whole demon", "start_cook", 10, "top-left")
~spawnChoice("nah that's a whole demon", "start_cook", 10, "top-right")
~spawnChoice("nah that's a whole demon", "start_cook", 10, "bottom-left")
~spawnChoice("nah that's a whole demon", "start_cook", 10, "bottom-right")
"Test1" #Speaker:Bo
"A longer test 2 to test for strange behavior regarding the coroutine??" #Speaker:Bo
"Test3?" #Speaker:Bo
-> DONE

=== start_cook ===
"Have you cooked anything in the kitchen yet?" #Speaker:Bo
"Yeah. You'll find meats in the meat locker and veggies and garnishes in the pantry. The meat locker is the white door and the pantry is the wooden closet." #Speaker:Bo
"Now that I've laid out the basics, why don't you whip up spaghetti with a green crunch and something on-the-bone. Think you can do that?" #Speaker:Bo
-> cooking_start


=== cooking_start ===
* ["Yeah"]
    "Perfect. Then get to it." #Speaker:Bo
    ->DONE
* ["Can you explain it a bit more?"]
    "Um... sure. Spaghetti with a crunchy vegetable and meat with bones still inside. I'm indifferent about garnish." #Speaker:Bo
    ->repeat_inst

=== repeat_inst ===
* ["Got it"]
    "Great! Good luck!" #Speaker:Bo
        ->DONE
    * ["One more time, please."]
        "Ugh. Give me lettuce and fingers over spaghetti. Is that clear enough?" #Speaker:Bo
        ->yes_end

=== yes_end ===
* ["Yeah."]
"Great. Good luck!" #Speaker:Bo
->DONE

=== outcome_good ===
"Well, look at you! You're a damn natural! Keep this up, and Bobo might keep ya' around an extra couple days."
->DONE

=== outcome_mid ===
"Not bad. I appreciate the grub. Take care, ok?"
->DONE

=== outcome_bad ===
"...Is this some kinda joke? This is some shit I'd feed to my dog. Get some life skills, man."
->DONE

-> END
