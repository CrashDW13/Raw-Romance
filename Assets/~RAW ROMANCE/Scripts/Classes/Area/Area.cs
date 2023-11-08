using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Area : MonoBehaviour
{
    public virtual void OnEntry(Area targetArea)
    {
        //  Can be overriden in child classes.
    }

    public virtual void OnExit(Area targetArea)
    {
        //  Can be overriden in child classes.
    }


}
