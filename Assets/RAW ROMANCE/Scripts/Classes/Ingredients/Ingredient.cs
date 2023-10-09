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

    [HideInInspector]
    public bool sliced;
    [HideInInspector]
    public int slicedCount; 
    public enum IngredientType
    {
        Meat,
        Produce,
        Garnish,
        Base
    }

    public IngredientType ingredientType;

    [HideInInspector]
    public enum IngredientCookedLevel
    {
        Undercooked,
        Good,
        Overcooked
    }

    [HideInInspector]
    public IngredientCookedLevel cookedLevel = IngredientCookedLevel.Good;

    public float cookingTime;
}
