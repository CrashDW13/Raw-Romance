using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Knife : MonoBehaviour
{
    private bool isHeld = false;
    private Camera mainCamera;

    void Start()
    {
        mainCamera = Camera.main;
    }

    void Update()
    {
        Vector2 mousePosition = mainCamera.ScreenToWorldPoint(new Vector3(Input.mousePosition.x, Input.mousePosition.y));
        
        if (isHeld)
        {
            transform.position = new Vector3(mousePosition.x, mousePosition.y, transform.position.z);

            // Check for interaction with other objects on left click while holding
            if (Input.GetMouseButtonDown(0))
            {
                Collider2D hitCollider = Physics2D.OverlapPoint(mousePosition);

                if (hitCollider)
                {
                    IngredientInteractable ingredientInteractable;
                    if (hitCollider.gameObject.TryGetComponent<IngredientInteractable>(out ingredientInteractable)) // Try to get the IngredientInteractable component
                    {
                        Debug.Log("Collider");

                        if (ingredientInteractable.ingredient != null) // Make sure ingredient is not null
                        {
                            ingredientInteractable.ingredient.sliced = true;
                            Debug.Log("Sliced");
                        }
                        else
                        {
                            Debug.Log("Ingredient is null");
                        }
                    }
                    else
                    {
                        Debug.Log("No IngredientInteractable component found");
                    }
                }

            }
        }
        else
        {
            if (GetComponent<Collider2D>().OverlapPoint(mousePosition))
            {
                if (Input.GetMouseButtonDown(0))
                {
                    isHeld = true;
                }
            }
        }

        if (Input.GetMouseButtonDown(1) && isHeld)
        {
            isHeld = false;
        }
    }
}
