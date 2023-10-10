// BasicInkExample.cs
using System;
using Ink.Runtime;
using UnityEngine;
using UnityEngine.UI;

public class BasicInkExample : MonoBehaviour
{
    public static event Action<Story> OnCreateStory;
    private StoryStateHandler stateHandler;

    void Awake()
    {
        RemoveChildren();
        StartStory();
    }

    void StartStory()
    {
        story = new Story(inkJSONAsset.text);
        stateHandler = new StoryStateHandler(story);

        if (OnCreateStory != null) OnCreateStory(story);
        RefreshView();
    }

    void Update()
    {
        if (Input.GetKeyDown("r"))
        {
            stateHandler.RewindStoryState();
            RefreshView();
        }
    }

    void RefreshView()
    {
        RemoveChildren();

        while (story.canContinue)
        {
            string text = story.Continue().Trim();
            CreateContentView(text);
        }

        if (story.currentChoices.Count > 0)
        {
            for (int i = 0; i < story.currentChoices.Count; i++)
            {
                Choice choice = story.currentChoices[i];
                Button button = CreateChoiceView(choice.text.Trim());
                button.onClick.AddListener(() => OnClickChoiceButton(choice));
            }
        }
        else
        {
            Button choice = CreateChoiceView("End of story.\nRestart?");
            choice.onClick.AddListener(StartStory);
        }
    }

    void OnClickChoiceButton(Choice choice)
    {
        story.ChooseChoiceIndex(choice.index);
        //stateHandler.SaveState();
        RefreshView();
    }

    void CreateContentView(string text)
    {
        Text storyText = Instantiate(textPrefab) as Text;
        storyText.text = text;
        storyText.transform.SetParent(canvas.transform, false);
    }

    Button CreateChoiceView(string text)
    {
        Button choice = Instantiate(buttonPrefab) as Button;
        choice.transform.SetParent(canvas.transform, false);

        Text choiceText = choice.GetComponentInChildren<Text>();
        choiceText.text = text;

        HorizontalLayoutGroup layoutGroup = choice.GetComponent<HorizontalLayoutGroup>();
        layoutGroup.childForceExpandHeight = false;

        return choice;
    }

    void RemoveChildren()
    {
        int childCount = canvas.transform.childCount;
        for (int i = childCount - 1; i >= 0; --i)
        {
            Destroy(canvas.transform.GetChild(i).gameObject);
        }
    }

    [SerializeField]
    private TextAsset inkJSONAsset = null;
    public Story story;

    [SerializeField]
    private Canvas canvas = null;

    [SerializeField]
    private Text textPrefab = null;
    [SerializeField]
    private Button buttonPrefab = null;
}
