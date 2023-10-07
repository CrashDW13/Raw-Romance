using System.Collections;
using System.Collections.Generic;
using System.Dynamic;
using System.IO;
using UnityEngine;

public class IngredientGiver : MonoBehaviour
{
    public Ingredient ingredientToGive;
    public GameObject ingredientInteractablePrefab;
    public int ingredientIndex = 0; //  Only used in Editor script. 
    private BoxCollider2D thisCollider;

    [Space(10)]
    public bool isInfinite;
    public int count;

    private void Start()
    {
        thisCollider = GetComponent<BoxCollider2D>();
    }

    private void Update()
    {
        CheckForInput();
    }

    private void CheckForInput()
    {
        Vector3 mousePosition = Camera.main.ScreenToWorldPoint(Input.mousePosition);
        if (thisCollider == Physics2D.OverlapPoint(mousePosition))
        {
            if (Input.GetMouseButtonDown(0))
            {
                if (ingredientToGive.ingredientType != Ingredient.IngredientType.Base)
                {
                    AddIngredientToInventory();
                }

                else
                {
                    SpawnIngredient();
                }

            }
        }
    }  
    
    private void AddIngredientToInventory()
    {
        if (isInfinite || count > 0)
        {
            IngredientItem newItem = ScriptableObject.CreateInstance<IngredientItem>();
            newItem.Init(ingredientToGive);
            Inventory.AddItem(newItem);
        }

        if (isInfinite) return;
        else count--;
    }

    private void SpawnIngredient()
    {
        var itemGameObject = Instantiate(ingredientInteractablePrefab, transform.position, Quaternion.identity);
        if (itemGameObject.TryGetComponent(out IngredientInteractable interactable))
        {
            interactable.ingredient = ingredientToGive;
            Debug.Log(interactable.ingredient.ingredientName);
        }
    }
}
