using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class Preference
{
    public Ingredient ingredient;
    public int ingredientIndex;
    public List<bool> styles = new List<bool>();
    public enum PreferenceType
    {
        Like,
        Dislike
    }

    public PreferenceType type;
    public int weight; 

}
