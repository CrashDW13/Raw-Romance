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
    private AreaManager areaManager;

    private void Awake()
    {
        ingredients = FindObjectOfType<IngredientDatabase>();
        areaManager = FindObjectOfType<AreaManager>();
    }
    public static void AddItem(Item _item)
    {
        inventoryList.Add(_item);
        Debug.Log(inventoryList.Count);
    }

    public static void RemoveItem(Item _item)
    {
        inventoryList.Remove(_item);
    }

    public static void RemoveItem(Ingredient ingredient)
    {
        for (var i = 0; i < inventoryList.Count; i++)
        {
            if (inventoryList[i] is IngredientItem)
            {
                var item = (IngredientItem)inventoryList[i];
                if (item.ingredient == ingredient)
                {
                    inventoryList.Remove(item);
                    return;
                }
            }
        }
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
                var parentTransform = areaManager.currentArea.transform;
                itemGameObject.transform.SetParent(parentTransform);
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
