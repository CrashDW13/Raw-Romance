using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
    public float speed = 5.0f;
    private bool isMoving = false;
    private Vector3 targetTile;

    void Update()
    {
        if (!isMoving && Input.GetKeyDown(KeyCode.W))
        {
            StartMoving(Vector3.up);
        }
        else if (!isMoving && Input.GetKeyDown(KeyCode.S))
        {
            StartMoving(Vector3.down);
        }
        else if (!isMoving && Input.GetKeyDown(KeyCode.A))
        {
            StartMoving(Vector3.left);
        }
        else if (!isMoving && Input.GetKeyDown(KeyCode.D))
        {
            StartMoving(Vector3.right);
        }

        if (isMoving)
        {
            MovePlayer();
        }
        if (Input.GetKeyDown(KeyCode.E))
        {
            Interact();
        }
    }

    void StartMoving(Vector3 direction)
    {
        RaycastHit2D hit = Physics2D.Raycast(transform.position, direction, 1f);
        if (hit.collider == null)
        {
            isMoving = true;
            targetTile = transform.position + direction;
        }
    }

    void MovePlayer()
    {
        transform.position = Vector3.MoveTowards(transform.position, targetTile, speed * Time.deltaTime);

        if (transform.position == targetTile)
        {
            isMoving = false;
        }
    }
    void Interact()
    {

        Vector3[] directions = { Vector3.up, Vector3.down, Vector3.left, Vector3.right };

        foreach (Vector3 dir in directions)
        {
            RaycastHit2D hit = Physics2D.Raycast(transform.position, dir, 1f);
            if (hit.collider != null && hit.collider.CompareTag("Interactable"))
            {

                Debug.Log("Interacted with: " + hit.collider.name);

                return;
            }
        }
    }
}

    