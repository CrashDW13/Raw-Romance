using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Grade
{
    //  The gradeDict dictionary has two parts:
    //  The Preference is the preference in question,
    //  And the bool is indicative of whether or not the ingredient of that preference was inside the bowl. 
    //  Since the player wants to include things the character likes and exclude things the character dislikes...
    //  "Likes" are ideally treated as true, while "Dislikes" are ideally treated as false. 
    public Dictionary<Preference, bool> gradeDict = new Dictionary<Preference, bool>();

    //  This is just the final number grade the player receives. 
    public int gradeNumber; 
}
