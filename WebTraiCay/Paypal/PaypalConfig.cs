using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopCayCanh.Paypal
{
    public class PaypalConfig
    {
        public readonly static string ClientId;
        public readonly static string ClientSecret;

        static PaypalConfig() 
        {
            var config = GetConfig();
            ClientId = "AT07_FaubxkD4aCFzGO384iOWNE3-gIraQQqClCmkvaqxQBD4a9BCnk6IsUSuAsapoYwCYYlYTobP37l";
            ClientSecret = "EPXTZCZwQSnKKFRKR-F1HVYNNz59vSjcnOb6x8aW7-BTm6sP2_84AC-pxPaGUF5aDhFk3XD23hcn1_nf";
        }
        // getting properties from the web.config  
        public static Dictionary<string, string> GetConfig()
        {
            return PayPal.Api.ConfigManager.Instance.GetProperties();
        }
        private static string GetAccessToken()
        {
            // getting accesstocken from paypal  
            string accessToken = new OAuthTokenCredential(ClientId, ClientSecret, GetConfig()).GetAccessToken();
            return accessToken;
        }
        public static APIContext GetAPIContext()
        {
            // return apicontext object by invoking it with the accesstoken  
            APIContext apiContext = new APIContext(GetAccessToken());
            apiContext.Config = GetConfig();
            return apiContext;
        }
    }
}