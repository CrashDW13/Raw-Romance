using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(BoxCollider2D))]
public class BaseCooker : MonoBehaviour
{
    private BoxCollider2D boxCollider;
    public OrderManager orderManager;
    [SerializeField] public GameObject ingredientInteractablePrefab; 
    private bool isCooking = false;
    private Vector3 offset;
    private void Start()
    {
        boxCollider = GetComponent<BoxCollider2D>();
    }
    private void Update()
    {
        CheckForInteractables();
        if (isCooking)
        {
            Vector3 mousePosition = Camera.main.ScreenToWorldPoint(Input.mousePosition);
            if (Input.GetMouseButtonDown(0))
            {
                offset = transform.position - mousePosition;
                if (boxCollider == Physics2D.OverlapPoint(mousePosition))
                {
                    GiveIngredientInteractable();
                }
            }
        }
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
                        var ingredient = ingredientInteractable.ingredient;
                        if (ingredient.ingredientType == Ingredient.IngredientType.Base)
                        {
                            if (orderManager != null)
                            {
                                if (!orderManager.IsCooking())
                                {
                                    orderManager.StartCookingBase(transform.position, ingredientInteractable);
                                    Destroy(ingredientInteractable.gameObject);
                                    isCooking = true;
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    private void GiveIngredientInteractable()
    {
        IngredientInteractable ingredientInteractable = orderManager.GetIngredient();
        orderManager.FinishCooking();
        GameObject ingredientPrefab = Instantiate(ingredientInteractablePrefab, transform.position, Quaternion.identity);
        if (ingredientPrefab.TryGetComponent<IngredientInteractable>(out IngredientInteractable interactable))
        {
            interactable.ingredient = ingredientInteractable.ingredient;
        }

    }
}
