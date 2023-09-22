using UnityEngine;
using UnityEditor;

namespace FORGE3D
{
    public class F3DHelpMenu
    {
        #region Variables

        const int Priority = 1100;

        const string MenuPath = "Window/FORGE3D/";

        const string AssetStoreUrl = "https://assetstore.unity.com/publishers/2659";
        const string WebUrl = "https://www.forge3d.com";
        const string TwitterUrl = "https://twitter.com/Forge_3D";
        const string FacebookUrl = "http://facebook.com/forge3d";
        const string SupportUrl = "https://www.forge3d.com/contact/";
        const string DiscordUrl = "https://discord.gg/c9JQuDC";
        const string DocumentationUrl = "https://docs.forge3d.com/";
        const string BlogUrl = "https://www.forge3d.com/blog/";
        // const string ForumUrl = "http://forum.forge3d.com/";
        // const string BugReportUrl = "http://forum.forge3d.com/c/bug-report";
        // const string KnownIssuesUrl = "http://forum.forge3d.com/c/known-issues";

        #endregion

        #region Menu Items

        [MenuItem(MenuPath + "Asset Store", false, Priority + 20)]
        static void AssetStore()
        {
            Application.OpenURL(AssetStoreUrl);
        }
        
        [MenuItem(MenuPath + "Website", false, Priority * 2 + 21)]
        static void Web()
        {
            Application.OpenURL(WebUrl);
        }

        [MenuItem(MenuPath + "Help/Documentation", false, Priority * 4 + 26)]
        static void Documentation()
        {
            Application.OpenURL(DocumentationUrl);
        }
        
        [MenuItem(MenuPath + "Help/Support Form", false, Priority * 2 + 23)]
        static void SupportForm()
        {
            Application.OpenURL(SupportUrl);
        }

        [MenuItem(MenuPath + "Community/Discord", false, Priority * 3 + 24)]
        static void Discord()
        {
            Application.OpenURL(DiscordUrl);
        }
        
        [MenuItem(MenuPath + "Community/Twitter", false, Priority * 3 + 24)]
        static void Twitter()
        {
            Application.OpenURL(TwitterUrl);
        }

     
        [MenuItem(MenuPath + "Community/Facebook", false, Priority * 3 + 25)]
        static void Facebook()
        {
            Application.OpenURL(FacebookUrl);
        }


       

        // [MenuItem(MenuPath + "Help/Known Issues", false, Priority * 5 + 27)]
        // static void KnownIssues()
        // {
        //     Application.OpenURL(KnownIssuesUrl);
        // }
        //
        // [MenuItem(MenuPath +"Help/Report a Bug", false, Priority * 5 + 28)]
        // static void BugReport()
        // {
        //     Application.OpenURL(BugReportUrl);
        // }
        //
        // [MenuItem(MenuPath + "Help/Contact Support", false, Priority * 6 + 29)]
        // static void Support()
        // {
        //     Application.OpenURL(SupportUrl);
        // }

        #endregion
    }
}