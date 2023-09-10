using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class Ingredient
{
    [HideInInspector]
    public string name;
    public string ingredientName;
    public string description;
    [HideInInspector]
    public Sprite sprite;
}
