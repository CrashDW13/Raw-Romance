using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AreaManager : MonoBehaviour
{
    public List<Area> areas = new List<Area>();
    public Area currentArea; 

    private void Start()
    {
        for (var i = 0; i < areas.Count; i++)
        {
            if (i == 0)
            {
                areas[i].gameObject.SetActive(true);
                currentArea = areas[i];
            }

            else
            {
                areas[i].gameObject.SetActive(false);
            }
        }
    }

    public void TransitionToArea(Area targetArea)
    {
        currentArea.OnExit(targetArea);

        for (var i = 0; i < areas.Count; i++)
        {
            if (areas[i] == targetArea)
            {
                areas[i].gameObject.SetActive(true);
                currentArea = areas[i];
                currentArea.OnEntry(targetArea);
            }

            else
            {
                areas[i].gameObject.SetActive(false);
            }
        }
    }
}
