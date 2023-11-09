using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class IngredientDatabase : MonoBehaviour
{
    public string spritesPath;
    public string scriptableObjectsPath;
    public List<Ingredient> IngredientList = new List<Ingredient>();

    public Ingredient GetIngredientByName(string name)
    {
        for (var i = 0; i < IngredientList.Count; i++)
        {
            if (IngredientList[i].ingredientName == name)
            {
                return IngredientList[i];
            }
        }

        Debug.LogWarning("Ingredient: Tried getting ingredient, but no ingredients with the name " + name + " were found.");
        return null;
    }
}
