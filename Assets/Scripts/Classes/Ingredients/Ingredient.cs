using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;


public class Ingredient : ScriptableObject
{
    public string ingredientName = "New Ingredient";
    public string description;
    public string fileName;
    [HideInInspector]
    public Sprite sprite;
    public enum IngredientType
    {
        Meat,
        Produce,
        Garnish
    }

    public IngredientType ingredientType;
}
