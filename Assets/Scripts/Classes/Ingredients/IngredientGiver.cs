using System.Collections;
using System.Collections.Generic;
using System.Dynamic;
using System.IO;
using UnityEngine;

public class IngredientGiver : MonoBehaviour
{
    public Ingredient ingredientToGive;
    public int ingredientIndex = 0; //  Only used in Editor script. 
    private Collider2D collider;

    [Space(10)]
    public bool isInfinite;
    public int count;

    private void Start()
    {
        collider = GetComponent<Collider2D>();
    }

    private void Update()
    {
        CheckForInput();
    }

    private void CheckForInput()
    {
        Vector3 mousePosition = Camera.main.ScreenToWorldPoint(Input.mousePosition);
        if (collider == Physics2D.OverlapPoint(mousePosition))
        {
            if (Input.GetMouseButtonDown(0))
            {
                AddIngredientToInventory();
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
}
