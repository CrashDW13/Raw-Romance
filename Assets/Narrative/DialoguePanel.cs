using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using System;
using UnityEngine.SceneManagement;
using System.Linq;

public class DialoguePanel : MonoBehaviour
{
    private StoryStateHandler stateHandler;
    private bool preventAutoSave = false;

    [Header("Characters")]
    [SerializeField] private CharacterDatabase characterDB;
    [Space(10)]

    [Header("Ink File")]
    [SerializeField] private TextAsset inkAsset;
    private Story inkStory;
    private string knot;
    [Space(10)]


    [Header("Graphics")]
    [SerializeField] private Image Background;
    [SerializeField] private Image CharacterArt;
    [Space(10)]


    [Header("Choices")]
    [SerializeField] private GameObject choicePrefab; 
    [SerializeField] private TMP_Text CharacterName;
    [SerializeField] private TMP_Text DialogueBox;
    [Space(10)]


    [Header("Scrawl")]
    [SerializeField] private float defaultScrawlSpeed;
    [SerializeField] private float scrawlMultiplier;
    [SerializeField] private float defaultWaitTimeSeconds;
    private float waitTimeSeconds; 

    private Coroutine textCoroutine;

    private bool scrawling;
    private float scrawlSpeed;

    private void Start()
    {
        waitTimeSeconds = defaultWaitTimeSeconds;
        
        CharacterName.text = "";
        DialogueBox.text = "";

        scrawling = false;
        scrawlSpeed = defaultScrawlSpeed;

        CharacterArt.enabled = false;

        inkStory = new Story(inkAsset.text);
        Debug.Log(knot);

        stateHandler = new StoryStateHandler(inkStory);

        inkStory.BindExternalFunction("updateAffinity", (string character, int value) => { UpdateAffinity(character, value); });
        inkStory.BindExternalFunction("spawnChoice", (string message, string knot, float time, string positionPreset) => { SpawnChoice(message, knot, time, positionPreset); });
        inkStory.BindExternalFunction("saveState", (string fallbackNode) => { SaveState(fallbackNode); });
        inkStory.BindExternalFunction("waitNextLine", (float delaySeconds) => { WaitNextLine(delaySeconds); });
        inkStory.BindExternalFunction("win", () => { win(); });
        inkStory.BindExternalFunction("lose", () => { lose(); });


        inkStory.ChoosePathString(knot);
    

        ShowLine(inkStory.Continue());

        var interactables = FindObjectsOfType<MonoBehaviour>().OfType<IFreezable>();
        foreach (IFreezable interactable in interactables)
        {
            interactable.Freeze();
        }
    }

    private void Update()
    {

    }

    public void StartConversation(TextAsset inkAssetToLoad, string knotToLoad)
    {
        inkAsset = inkAssetToLoad;
        knot = knotToLoad;
    }

    void ShowLine(string line)
    {
        // Check tags as necessary
        List<string> tags = inkStory.currentTags;
        foreach (string tag in tags)
        {
            if (tag.Contains("Speaker"))
            {
                string tagData = tag.Substring(tag.IndexOf(":") + 1);
                string[] info = tagData.Split(",");

                string name = info[0];
                string sprite = null;

                if (info.Length > 1)
                {
                    sprite = info[1];
                    Debug.Log(sprite);
                }

                foreach (Character character in characterDB.Characters)
                {
                    string[] charTags = character.characterTag.Split(":");
                    bool isChar = false;

                    foreach (string s in charTags)
                    {
                        if (s == name)
                        {
                            isChar = true;
                        }
                    }

                    if (isChar)
                    {
                        CharacterName.text = character.characterName;

                        if (sprite != null)
                        {
                            if (CharacterArt.enabled == false)
                            {
                                CharacterArt.enabled = true;
                                CharacterArt.sprite = character.GetSprite(sprite);
                            }
                        }
                    }
                }

            }
        }

        Debug.Log("Starting coroutine");
        textCoroutine = StartCoroutine(ScrawlText(line));
    }

    IEnumerator ScrawlText(string line)
    {
        scrawling = true;
        DialogueBox.text = "";
        scrawlSpeed = defaultScrawlSpeed;

        int i = 0;
        while (i < line.Length)
        {
            DialogueBox.text += line[i];
            i++;

            yield return new WaitForSeconds(0.05f / scrawlSpeed);
        }

        scrawling = false;

        if (inkStory.currentChoices.Count > 0)
        {
            ShowChoices();
            StartCoroutine(Advance());
        }

        else
        {
            StartCoroutine(Advance());
        }

    }

    void ShowChoices()
    {
        /*ChoiceParent.SetActive(true);

        int i = 0;
        foreach (Transform choice in ChoiceParent.transform)
        {
            if (i < inkStory.currentChoices.Count)
            {
                choice.gameObject.SetActive(true);

                choice.GetComponentInChildren<TMP_Text>().text = inkStory.currentChoices[i].text;
            }
            else
            {
                choice.gameObject.SetActive(false);
            }
            i++;
        }*/
    }

    public void SelectChoice(float choice)
    {
        inkStory.ChooseChoiceIndex((int)choice);

        ShowLine(inkStory.Continue());
    }

    public IEnumerator Advance()
    {
        yield return new WaitForSeconds(waitTimeSeconds);

        waitTimeSeconds = defaultWaitTimeSeconds;

        if (inkStory.canContinue && !scrawling)
        {
            ShowLine(inkStory.Continue());
        }
        else if (!inkStory.canContinue && !scrawling && inkStory.currentChoices.Count > 0)
        {
            //SelectChoice();
        }
        else if (!inkStory.canContinue && !scrawling && inkStory.currentChoices.Count == 0)
        {
            //GameManager.Instance.CloseDialogue(this);
            var interactables = FindObjectsOfType<MonoBehaviour>().OfType<IFreezable>();
            foreach (IFreezable interactable in interactables)
            {
                interactable.Unfreeze();
            }

            Destroy(gameObject);
        }
    }

    void UpdateAffinity(string character, int value)
    {
        Debug.Log(character + ": " + value);
    }
    private Dictionary<string, Vector3> positionPresets = new Dictionary<string, Vector3>()
    {
        { "top-right", new Vector3(4, 3, 0) },
        { "top-left", new Vector3(-4, 3, 0) },
        { "bottom-right", new Vector3(4, 0, 0) },
        { "bottom-left", new Vector3(-4, 0, 0) },
        { "middle", new Vector3(0, 0, 0) },
        { "middle-right", new Vector3(4, 1.5, 0) },
        { "middle-left", new Vector3(-4, 1.5, 0) },
        { "middle-top", new Vector3(0, 3, 0) },
        { "middle-bottom", new Vector3(0, -1, 0) },
        { "mop-left", new Vector3(-4, 2, 0) },
        { "mop-right", new Vector3(-4, 2, 0) },
        { "middle-mop", new Vector3(0, 2, 0) },
    

        
    };

    void SpawnChoice(string message, string knot, float time, string positionPreset)
    {
        Debug.Log(positionPreset);

        Vector3 position;
        if (positionPresets.TryGetValue(positionPreset, out position))
        {
          
            ChoicePanel.Instantiate(choicePrefab, Camera.main.WorldToScreenPoint(position), transform.rotation, message, knot, time);
        }
        else
        {
            Debug.LogError($"Position preset '{positionPreset}' not found.");
          
        }
    }


    public void ForcePath(string path)
    {
        Debug.Log("Stopping Coroutine");
        StopCoroutine(textCoroutine);
        inkStory.ChoosePathString(path);
        ShowLine(inkStory.Continue());
    }

    public void SetScrawlSpeed(float speed)
    {
        scrawlSpeed = speed;
    }

    public void WaitNextLine(float delaySeconds)
    {
        waitTimeSeconds = delaySeconds;
    }
    public void HandleRewind()
    {
        //if (stateHandler.RewindStoryState())
        //{
        //    ShowLine(inkStory.Continue());
        //}
    }

    void DisplayCurrentChoices()
        
    {
        foreach (Transform child in transform)
        {
            if (child.gameObject.CompareTag("Choice")) //Tag choice prefabs with "Choice" or a suitable tag.
            {
                Destroy(child.gameObject);
            }
        }
        foreach (Choice choice in inkStory.currentChoices)
        {
          
            GameObject choiceObject = Instantiate(choicePrefab, transform);
            TMP_Text choiceText = choiceObject.GetComponentInChildren<TMP_Text>();
            if (choiceText != null)
            {
                choiceText.text = choice.text;
            }
            
            Button choiceButton = choiceObject.GetComponent<Button>();
            if (choiceButton != null)
            {
                int choiceIndex = choice.index;
                choiceButton.onClick.AddListener(() => SelectChoice(choiceIndex));
            }
        }
    }

    void SaveState(string fallbackNode)
    {
        if (preventAutoSave)
        {
            preventAutoSave = false;  // Reset the flag
            return; // Do not save if the flag is set
        }
    
        stateHandler.SaveState(fallbackNode); 
        Debug.Log("saved");
    }

    public void Rewind()
    {
        float sanityPenalty = -3;

        if (!stateHandler.CanRewind())
        {
            Debug.Log("No saved states to rewind to.");
            return;
        }

        StopCoroutine(textCoroutine); // Stop any ongoing dialogue scrawling

        preventAutoSave = true; // Set the flag to prevent the next save

        SanityHandler.UpdateSanity(sanityPenalty);
        ChoicePanel.ClearAll(); //  Clears all choice panels. 
        Debug.Log("Rewind");

        if (stateHandler.RewindStoryState())
        {
            Debug.Log("Success.");
        }


        // Comment out this block to prevent auto-progression
        // while (inkStory.canContinue)
        // {
        //     ShowLine(inkStory.Continue());
        // }

        // Display choices after a rewind, if there are any.
        //if (inkStory.currentChoices.Count > 0)
        //{
        //    DisplayCurrentChoices();
        //}
    }

    public void Continue()
    {
        ShowLine(inkStory.Continue());

    }

    public void win()
    {
        SceneManager.LoadScene("TempWinScreen");
    }

    public void lose()
    {
        SceneManager.LoadScene("TempLoseScreen");
    }


}
