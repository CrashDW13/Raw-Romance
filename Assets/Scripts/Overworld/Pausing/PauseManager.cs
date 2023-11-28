using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PauseManager : MonoBehaviour
{
    [SerializeField]
    private GameObject pauseCanvas;
    [SerializeField]
    private KeyCode pauseKey;

    private bool paused = false; 

    public delegate void PauseEventHandler();
    public static event PauseEventHandler OnPause;
    public static event PauseEventHandler OnResume;

    private void Start()
    {
        pauseCanvas.SetActive(false);
        OnPause += TogglePausedCanvas;
        OnResume += TogglePausedCanvas;
    }

    private void Update()
    {
        if (Input.GetKeyDown(pauseKey))
        {
            if (paused)
            {
                OnResume?.Invoke();
                paused = false;
            }

            else
            {
                OnPause?.Invoke();
                paused = true;
            }
        }
    }

    private void TogglePausedCanvas()
    {
        pauseCanvas.SetActive(!pauseCanvas.activeSelf);
    }
}
