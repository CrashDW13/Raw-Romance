using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AreaManager : MonoBehaviour
{
    public List<Area> areas = new List<Area>();

    private void Start()
    {
        for (var i = 0; i < areas.Count; i++)
        {
            if (i == 0)
            {
                areas[i].gameObject.SetActive(true);
            }

            else
            {
                areas[i].gameObject.SetActive(false);
            }
        }
    }

    public void TransitionToArea(Area area)
    {
        for (var i = 0; i < areas.Count; i++)
        {
            if (areas[i] == area)
            {
                areas[i].gameObject.SetActive(true);
            }

            else
            {
                areas[i].gameObject.SetActive(false);
            }
        }
    }
}
