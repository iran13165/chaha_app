using chaha_app.firebase;
using chaha_app.Model;
using Firebase.Database;
using Firebase.Database.Query;

namespace chaha_app.Services.Implementations
{
    public class DeedService : IDeedService
    {
        FirebaseClient firebaseClient = new FirebaseClient(Setting.FirebaseDatabaseUrl, new FirebaseOptions
        {
            AuthTokenAsyncFactory = () => Task.FromResult(Setting.FirebaseSecret)
        });
        public async Task<bool> AddOrUpdateDeed(Deed deed)
        {
            if (!string.IsNullOrWhiteSpace(deed.Key))
            {
                try
                {

                    await firebaseClient.Child(nameof(Deed)).Child(deed.Key).PutAsync(deed);
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
            else
            {
                var response = await firebaseClient.Child(nameof(Deed)).PostAsync(deed);
                if (response.Key != null)
                {
                    return true;
                }
            }
            return false;
        }

        public async Task<bool> DeleteDeed(string Key)
        {
            try
            {

                await firebaseClient.Child(nameof(Deed)).Child(Key).DeleteAsync();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public async Task<List<Deed>> GetAllDeeds()
        {
            return (await firebaseClient.Child(nameof(Deed)).OnceAsync<Deed>()).Select(f => new Deed
            {
                At = f.Object.At,
                Date = f.Object.Date,
                Descriptions = f.Object.Descriptions.ToList(),
                DeedNo = f.Object.DeedNo,
                Mouza = f.Object.Mouza,
                Owner = f.Object.Owner,
                Key = f.Key

            }
            ).ToList();
        }
    }
}