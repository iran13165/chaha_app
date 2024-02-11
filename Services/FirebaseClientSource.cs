using chaha_app.firebase;
using Firebase.Auth;
using Firebase.Auth.Providers;
using Firebase.Database;

namespace chaha_app;

public static class FirebaseClientSource
{

    public static async Task<UserCredential?> SignIn(string userName, string password)
    {
        try
        {
            var client = GetFirebaseAuthClient();
            var userCredential = await client.SignInWithEmailAndPasswordAsync(userName, password);
            return userCredential;
        }
        catch (Exception ex){
           await Shell.Current.DisplayAlert("Error signing","Invalid Credentials","OK");
        }
        return null;


    }
    // Configure...
    public static FirebaseAuthClient GetFirebaseAuthClient()
    {
        var config = new FirebaseAuthConfig
        {
            ApiKey = Setting.ApiKey,
            AuthDomain = Setting.AuthDomain,
            Providers =
            [
                new EmailProvider()
            ],
        };
        var client = new FirebaseAuthClient(config);
        return client;
    }
}
