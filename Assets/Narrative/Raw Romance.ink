EXTERNAL updateAffinity(character, value)

->Test_Knot

=== Test_Knot ===
This is test dialogue. #Speaker:bob

This is another test dialogue line. #Speaker:bob

Here's a choice for you: #Speaker:bob

+ [One]
    ~updateAffinity("bob", 3)
    You chose one! I love one! #Speaker:bob
    ->DONE
+ [Two]
    ~updateAffinity("bob", -3)
    You chose two! I hate two! #Speaker:bob
    ->DONE
+ [Three]
    ~updateAffinity("bob", 1)
    You chose three! That's fine. #Speaker:bob
    ->DONE

->END