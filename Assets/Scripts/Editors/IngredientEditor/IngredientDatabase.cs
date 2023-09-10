using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
[CreateAssetMenu(menuName = "Data/Ingredient Database", fileName = "IngredientDatabase")]
public class IngredientDatabase : ScriptableObject
{
    public List<Ingredient> ingredientList = new List<Ingredient>();
    private void OnValidate()
    {
        foreach (var i in ingredientList)
        {
            i.name = i.ingredientName;
        }
    }
}
