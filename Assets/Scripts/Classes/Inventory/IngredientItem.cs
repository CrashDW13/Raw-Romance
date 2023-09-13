using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
[CreateAssetMenu(menuName = "Data/Ingredient", fileName = "New Ingredient")]
public class IngredientItem : Item
{
    [SerializeField]
    public Ingredient ingredient;

    public void Init(Ingredient _ingredient)
    {
        ingredient = _ingredient;
    }
}
