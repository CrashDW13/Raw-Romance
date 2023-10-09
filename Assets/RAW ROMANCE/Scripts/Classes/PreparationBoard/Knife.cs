using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Knife : MonoBehaviour
{
    private bool isHeld = false;
    private Camera mainCamera;
    private SpriteRenderer spriteRenderer;
    private Collider2D collider;

    void Start()
    {
        mainCamera = Camera.main;
        spriteRenderer = GetComponent<SpriteRenderer>();
        collider = GetComponent<Collider2D>();
    }

    void Update()
    {
        Vector3 mousePosition = mainCamera.ScreenToWorldPoint(new Vector3(Input.mousePosition.x, Input.mousePosition.y,Input.mousePosition.z));
        
        if (isHeld)
        {
            transform.position = new Vector3(mousePosition.x, mousePosition.y, transform.position.z);
            spriteRenderer.sortingLayerID = SortingLayer.layers[2].id;
            collider.enabled = false;



            // Check for interaction with other objects on left click while holding
            if (Input.GetMouseButtonDown(0))
            {
                Collider2D hitCollider = Physics2D.OverlapPoint(mousePosition);


                if (hitCollider)
                {
                    IngredientInteractable ingredientInteractable;
                    // Debug.Log("Collider");
                    // Debug.Log(hitCollider.gameObject);

                    if (hitCollider.gameObject.TryGetComponent<IngredientInteractable>(out ingredientInteractable)) 
                    {

                        if (ingredientInteractable.ingredient != null) // Make sure ingredient is not null
                        {
                            ingredientInteractable.ingredient.sliced = true;
                            ingredientInteractable.ingredient.slicedCount += 1;
                            Debug.Log("Sliced");
                            Debug.Log(ingredientInteractable.ingredient.slicedCount);

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
            collider.enabled = true;

        }
    }
}
