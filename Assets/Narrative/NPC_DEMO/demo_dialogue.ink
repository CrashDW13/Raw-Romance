
=== demo_start ===

"Hi! You must be the new 'recruit.'" #Speaker:Bo
* ["Unfortunately"]
    "I... wow, I'm sorry you don't like it here." #Speaker:Bo
    -> start_cook

* ["Is it that obvious?"]
    "Only because I've never seen you before." #Speaker:Bo
    -> start_cook

* ["Guilty as charged."]
    "Ha. Given that you're chained up, people would assume you've done something to end up here." #Speaker:Bo
    -> start_cook


=== start_cook ===
"Have you cooked anything in the kitchen yet?" #Speaker:Bo
* ["No, but I'm guessing I'm about to start."]
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

-> END
