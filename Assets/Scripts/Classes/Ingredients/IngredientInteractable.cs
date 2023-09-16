using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(Collider2D))]
public class IngredientInteractable : MonoBehaviour
{
    [HideInInspector]
    public Ingredient ingredient;

    private Collider2D collider;

    private SpriteRenderer spriteRenderer;

    private bool canDrag = true;
    private bool dragging = false;
    private Vector3 offset;

    private void Start()
    {
        collider = GetComponent<Collider2D>();
        spriteRenderer = GetComponent<SpriteRenderer>();
        spriteRenderer.sprite = ingredient.sprite;
    }

    private void Update()
    {
        if (canDrag)
        {
            UpdatePositionFromDrag();
        } 
    }

    void UpdatePositionFromDrag()
    {

        Vector3 mousePosition = Camera.main.ScreenToWorldPoint(Input.mousePosition);
        if (Input.GetMouseButtonDown(0))
        {
            offset = transform.position - mousePosition;
            if (collider == Physics2D.OverlapPoint(mousePosition))
            {
                Collider2D[] results = Physics2D.OverlapPointAll(mousePosition);
                Collider2D highestCollider = GetHighestObject(results);
                if (collider == highestCollider)
                {
                    dragging = true;
                    //BringSpriteToFront();
                }
            }
        }
        
        if (dragging)
        {
            transform.position = mousePosition + offset;

            if (Input.GetMouseButtonUp(0))
            {
                dragging = false;
            }
        }
    }

    public bool IsFree()
    {
        return !dragging;
    }

    private void BringSpriteToFront()
    {
        IngredientInteractable[] interactables = FindObjectsOfType<IngredientInteractable>();
        foreach (IngredientInteractable interactable in interactables)
        {
            if (interactable != this)
            {
                if (interactable.gameObject.TryGetComponent(out SpriteRenderer spriteRenderer))
                {
                    spriteRenderer.sortingLayerID = SortingLayer.layers[1].id;
                }
            }
            else
            {
                if (interactable.gameObject.TryGetComponent(out SpriteRenderer spriteRenderer))
                {
                    spriteRenderer.sortingLayerID = SortingLayer.layers[2].id;
                }
            }
        }
    }

    private Collider2D GetHighestObject(Collider2D[] results)
    {
        int highestValue = 0;
        Collider2D highestObject = results[0];
        foreach (Collider2D col in results)
        {
            Renderer ren = col.gameObject.GetComponent<Renderer>();
            if (ren && ren.sortingOrder > highestValue)
            {
                highestValue = ren.sortingOrder;
                highestObject = col;
            }
        }
        return highestObject;
    }

    private void SetActive(bool active)
    {
        canDrag = active;
    }
}
