using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class Preference
{
    //  The ingredient the character has a preference towards. 
    public Ingredient ingredient;

    //  The index within the IngredientList array this ingredient is at; this is only used for the editor and shouldn't be altered outside of it. 
    public int ingredientIndex;

    //  TO-DO: Incorporate styles into prefrences. 
    public List<bool> styles = new List<bool>();

    //  Whether or not this is a like or a dislike. 
    public enum PreferenceType
    {
        Like,
        Dislike
    }

    public PreferenceType type;

    //  How many points the player gets/loses for including the ingredient in the bowl. 
    public int weight; 

}
