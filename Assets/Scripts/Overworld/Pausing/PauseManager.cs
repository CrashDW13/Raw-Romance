using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class PauseManager : MonoBehaviour
{
    [SerializeField]
    private GameObject pauseCanvas;
    [SerializeField]
    private KeyCode pauseKey;

    private static bool paused = false; 

    public delegate void PauseEventHandler();
    public static event PauseEventHandler OnPause;
    public static event PauseEventHandler OnResume;

    private void Awake()
    {
        DontDestroyOnLoad(gameObject);
        if (FindObjectsOfType<PauseManager>().Length > 1)
        {
            Destroy(gameObject);
        }
    }
    private void Start()
    {
        pauseCanvas.SetActive(false);
        OnPause += TogglePausedCanvas;
        OnResume += TogglePausedCanvas;
        SceneManager.activeSceneChanged += OnSceneChanged;
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

    private void OnSceneChanged(Scene oldScene, Scene newScene)
    {
        Hide();
    }

    private void Hide()
    {
        OnResume?.Invoke();
        paused = false;
        pauseCanvas.SetActive(false);
    }

    private void TogglePausedCanvas()
    {
        pauseCanvas.SetActive(!pauseCanvas.activeSelf);
    }

    public void ShowGroup(GameObject parent)
    {
        Canvas canvas = GetComponentInChildren<Canvas>();
        foreach (Transform child in canvas.gameObject.GetComponentInChildren<Transform>())
        {
            if (child.name == "Background") continue; 

            if (child.name != parent.name)
            {
                child.gameObject.SetActive(false);
            }

            else
            {
                child.gameObject.SetActive(true);
            }
        }
    }

    public void QuitGame()
    {
        Application.Quit();
    }

    public static bool IsPaused()
    {
        return paused;
    }
}
