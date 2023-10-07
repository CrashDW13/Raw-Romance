using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(BoxCollider2D))]
public class PreparationBoard : MonoBehaviour
{
    [SerializeField]
    private Ingredient.IngredientType type;

    private BoxCollider2D boxCollider;
    private void Start()
    {
        boxCollider = GetComponent<BoxCollider2D>();
    }
    private void Update()
    {
        CheckForInteractables();
    }

    private void CheckForInteractables()
    {
        Collider2D[] colliders = Physics2D.OverlapBoxAll(transform.position, transform.localScale * boxCollider.size, 0);
        if (colliders.Length > 1)
        {
            if (Input.GetMouseButtonUp(0))
            {
                for (var i = 0; i < colliders.Length; i++)
                {
                    if (colliders[i].gameObject.TryGetComponent(out IngredientInteractable ingredientInteractable))
                    {
                        if (ingredientInteractable.ingredient.ingredientType != type)
                        {
                            ingredientInteractable.ResetPosition();
                        }
                    }
                }
            }
        }
    }
}
