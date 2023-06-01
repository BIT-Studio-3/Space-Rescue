using UnityEngine ;
 
public class ScaleWorldByCanvas : MonoBehaviour
{
    public Transform WorldObject ;
    public Transform CanvasObject ;
 
    int CachedWidth ;
    int CachedHeight ;
 
    void Refresh ( )
    {
        CachedWidth = Screen . width ;
        CachedHeight = Screen . height ;
 
        WorldObject . localScale = CanvasObject . localScale ;
    }
 
    void Start ( )
    {
        Refresh ( ) ;
    }
 
    void Update ( )
    {
        if ( Screen . width == CachedWidth )
        {
            if ( Screen . height == CachedHeight )
            {
                return ;
            }
        }
 
        Refresh ( ) ;
    }
}