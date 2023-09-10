using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
[CreateAssetMenu(menuName = "Data/Ingredient", fileName = "New Ingredient")]
public class IngredientItem : Item
{
    [SerializeField]
    Ingredient ingredient;
    public IngredientItem(Ingredient _ingredient)
    {
        ingredient = _ingredient;
    }
}
