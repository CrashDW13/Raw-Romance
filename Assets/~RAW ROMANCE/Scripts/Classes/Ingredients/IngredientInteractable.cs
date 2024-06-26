using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(Collider2D))]
public class IngredientInteractable : MonoBehaviour
{
    [HideInInspector]
    public Ingredient ingredient;

    private BoxCollider2D boxCollider2D;

    private SpriteRenderer spriteRenderer;

    private bool interactedWith = false;
    private bool canDrag = true;
    private bool dragging = false;
    private Vector3 offset;
    private Vector3 initialPosition; 

    private void Start()
    {
        boxCollider2D = GetComponent<BoxCollider2D>();
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

    public bool IsFree()
    {
        return !dragging;
    }

    public void ResetPosition()
    {
        transform.position = initialPosition;
        dragging = false;
    }

    private void UpdatePositionFromDrag()
    {

        Vector3 mousePosition = Camera.main.ScreenToWorldPoint(Input.mousePosition);
        if (Input.GetMouseButtonDown(0))
        {
            offset = transform.position - mousePosition;
            if (boxCollider2D == Physics2D.OverlapPoint(mousePosition))
            {
                Debug.Log(ingredient.name);
                Collider2D[] results = Physics2D.OverlapPointAll(mousePosition);
                Collider2D highestCollider = GetHighestObject(results);
                if (boxCollider2D == highestCollider)
                {
                    initialPosition = transform.position; 
                    dragging = true;
                    interactedWith = true;
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

    public void SetActive(bool active)
    {
        canDrag = active;
    }

    public bool GetActive()
    {
        return canDrag;
    }

    public bool InteractedWith()
    {
        return interactedWith;
    }
}
