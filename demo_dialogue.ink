"Hi! You must be the new 'recruit.'" #speaker:bo
* "Unfortunately"
    "I... wow, I'm sorry you don't like it here." #Speaker:bo
    -> start_cook

* "Is it that obvious?"
    "Only because I've never seen you before." #Speaker:bo
    -> start_cook
    
* "Guilty as charged."
    "Ha. Given that you're chained up, people would assume you've done something to end up here." #Speaker:bo
    -> start_cook
    
    
=== start_cook ===
"Have you cooked anything in the kitchen yet?" #Speaker:bo
* "No, but I'm guessing I'm about to start."
"Yeah. You'll find meats in the meat locker and veggies and garnishes in the pantry. The meat locker is the white door and the pantry is the wooden closet." #Speaker:bo
"Now that I've laid out the basics, why don't you whip up spaghetti with a green crunch and something on-the-bone. Think you can do that?" #Speaker:bo
-> cooking_start


=== cooking_start ===
* "Yeah"
    ->DONE
* "Can you explain it a bit more?"
    "Um... sure. Spaghetti with a crunchy vegetable and meat with bones still inside. I'm indifferent about garnish." #Speaker:bo
    ->repeat_inst
    
    
    
=== repeat_inst ===
* "Got it"
        ->DONE
    * "One more time, please."
        "Ugh. Give me lettuce and fingers over spaghetti. Is that clear enough?"
        "Yeah." #Speaker:bo
        ->DONE
    
-> END
    
