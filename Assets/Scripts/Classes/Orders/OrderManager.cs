using System.Collections;
using System.Collections.Generic;
using System.Security.Cryptography;
using UnityEngine;

public class OrderManager : MonoBehaviour
{
    //  TO-DO: CurrentCharacter should be set exclusively through the StartOrder() function and therefore this should be private. 

    public Character currentCharacter;
    private bool orderIsActive;
    private float currentOrderTime;

    private void Update()
    {
        if (orderIsActive)
        {
            CalculateOrderTimer();
        }
    }

    public void StartOrder(Character character)
    {
        currentCharacter = character;

        //  Reset timer. 
        currentOrderTime = 0;
    }

    public void SubmitOrder(Bowl bowl)
    {
        orderIsActive = false;
        Grade grade = bowl.GetGrade(currentCharacter.Preferences);
        Debug.Log("Final grade " + grade.gradeNumber);

        //  TO-DO: Adjust grade based on how long the player has waited since the start of the order (currentOrderTime). 
        //  TO-DO: Implement UI that uses grade to show player feedback (ie. which preferences were included + final grade)

    }

    private void CalculateOrderTimer()
    {
        currentOrderTime += Time.deltaTime; 
    }

    
}
