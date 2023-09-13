using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

//Because collisions are handled by Physics2D.OverlapBoxAll, Collider2Ds are technically unnecessasry.
//However, I want to show that this object does interact with things in the same way, thus a Collider will show "hey, this object has a green outline, so it is a collider/trigger effectively."
[RequireComponent (typeof (Collider2D))]
public class IngredientTrashCan : MonoBehaviour
{
    private void Update()
    {
        CheckForInteractables();
    }

    private void CheckForInteractables()
    {
        Collider2D[] colliders = Physics2D.OverlapBoxAll(transform.position, transform.localScale, 0);
        if (colliders.Length > 1)
        {
            if (Input.GetMouseButtonUp(0))
            {
                for (var i = 0; i < colliders.Length; i++)
                {
                    if (colliders[i].gameObject.TryGetComponent(out IngredientInteractable ingredient))
                    {
                        Destroy(colliders[i].gameObject);
                    }
                }
            }
        }
    }
}
