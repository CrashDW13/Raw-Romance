using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class PreparationArea : Area
{
    Inventory inventory;
    public override void OnEntry(Area targetArea)
    {
        inventory = FindObjectOfType<Inventory>();
        inventory.SpawnIngredientInteractables();
    }

    public override void OnExit(Area targetArea)
    {
        if (targetArea is PreparationArea)
        {
            Bowl bowl = FindObjectOfType<Bowl>();
            bowl.gameObject.transform.SetParent(targetArea.transform);

            IngredientInteractable[] interactablesToRemove = bowl.gameObject.GetComponentsInChildren<IngredientInteractable>();

            for(var i = 0; i < interactablesToRemove.Length; i++)
            {
                Inventory.RemoveItem(interactablesToRemove[i].ingredient);
            }

            IngredientInteractable[] ingredientsToRemove = transform.gameObject.GetComponentsInChildren<IngredientInteractable>();
            for (var i = 0; i < ingredientsToRemove.Length; i++)
            {
                if (ingredientsToRemove[i].InteractedWith())
                {
                    Inventory.RemoveItem(ingredientsToRemove[i].ingredient);
                }

                else
                {
                    Destroy(ingredientsToRemove[i].gameObject);
                }
            }
        }
    }
}
