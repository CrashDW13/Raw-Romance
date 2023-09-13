using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Inventory : MonoBehaviour
{
    private static List<Item> inventoryList = new List<Item>();
    private IngredientDatabase ingredients;

    [Header("Ingredient Spawning")]
    [SerializeField]
    private GameObject ingredientInteractablePrefab;
    [SerializeField]
    private Vector3 ingredientSpawnPosition;
    [SerializeField]
    private Vector3 ingredientOffset;

    private void Awake()
    {
        ingredients = FindObjectOfType<IngredientDatabase>();
    }
    public static void AddItem(Item _item)
    {
        inventoryList.Add(_item);
        Debug.Log(inventoryList.Count);
    }

    public static void Clear()
    {
        inventoryList.Clear();
    }

    public void SpawnIngredientInteractables()
    {
        bool noValid = true;
        var pos = ingredientSpawnPosition;
        for (var i = 0; i < inventoryList.Count; i++)
        {
            Debug.Log(inventoryList[i].GetType());
            if (inventoryList[i].GetType() == typeof(IngredientItem))
            {
                noValid = false;
                IngredientItem _ingredient = (IngredientItem)inventoryList[i];
                var itemGameObject = Instantiate(ingredientInteractablePrefab, pos, Quaternion.identity);
                if (itemGameObject.TryGetComponent(out IngredientInteractable interactable))
                {
                    interactable.ingredient = _ingredient.ingredient;
                }
                pos += ingredientOffset;
            }
        }

        if (noValid)
        {
            Debug.Log("No valid IngredientItems");
        }
    }
}
