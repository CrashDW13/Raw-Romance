using System.Collections.Generic;
using Ink.Runtime;

public class StoryStateHandler
{
    private Story inkStory;
    private List<string> storyStateHistory = new List<string>();

    public StoryStateHandler(Story story)
    {
        inkStory = story;
    }

    public void SaveState()
    {
        storyStateHistory.Add(inkStory.state.ToJson());
    }

    public void RewindStoryState()
    {
        if (storyStateHistory.Count <= 1) return;
      
        storyStateHistory.RemoveAt(storyStateHistory.Count - 1);

       
        string previousState = storyStateHistory[storyStateHistory.Count - 1];
        inkStory.state.LoadJson(previousState);
    }
}
