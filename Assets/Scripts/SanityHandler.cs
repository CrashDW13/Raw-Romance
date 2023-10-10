using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class SanityHandler : MonoBehaviour
{
    private static float sanity;

    [SerializeField]
    private float MaxSanity; 
    private static float maxSanity;

    private Slider slider;

    private void Start()
    {
        sanity = MaxSanity;
        maxSanity = MaxSanity;

        slider = GetComponent<Slider>();
    }

    private void Update()
    {
        HandleSlider();
    }

    private void HandleSlider()
    {
        slider.value = sanity / maxSanity;
    }

    public void UpdateSanity(float change)
    {
        sanity = Mathf.Clamp(sanity + change, 0, maxSanity); 
    }

    public static float GetSanity()
    {
        return sanity / maxSanity;
    }


}
