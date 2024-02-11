using chaha_app.Model;
using SQLite;
using CommunityToolkit.Maui.Alerts;

public class DeedRepository
{
    string _dbPath;
    public string StatusMessage { get; set; }
    SQLiteConnection conn;
    private void Init()
    {
        if (conn != null)
            return;
        conn = new SQLiteConnection(_dbPath);
        conn.CreateTable<Deed>();

    }
    public DeedRepository(string dbPath)
    {
        _dbPath = dbPath;
    }

    /* Unmerged change from project 'chaha_app (net8.0-android)'
    Before:
        public void addNewDeed(string owner, string mouza, string at, string dec, string deedNo, DateTime date)
    After:
        public async Task addNewDeedAsync(string owner, string mouza, string at, string dec, string deedNo, DateTime date)
    */
    public async Task addNewDeedAsync(Deed deed)
    {
        int result = 0;
        try
        {
            Init();

            // basic validation to ensure a name was entered
            if (string.IsNullOrEmpty(deed.Owner))
                throw new Exception("Valid name required");

            result = conn.Insert(deed);

            StatusMessage = string.Format("{0} record(s) added (Name: {1})", result, deed.Owner);
            CancellationTokenSource cancellationTokenSource = new CancellationTokenSource();

            CommunityToolkit.Maui.Core.ToastDuration duration = CommunityToolkit.Maui.Core.ToastDuration.Short;
            double fontSize = 14;

            var toast = Toast.Make(StatusMessage, duration, fontSize);

            await toast.Show(cancellationTokenSource.Token);
        }
        catch (Exception ex)
        {
            StatusMessage = string.Format("Failed to add {0}. Error: {1}", deed.Owner, ex.Message);
        }
    }
    public List<Deed> GetAllDeed()
    {
        try
        {
            Init();
            return conn.Table<Deed>().ToList();
        }
        catch (Exception ex)
        {
            StatusMessage = string.Format("Failed to retrieve data. {0}", ex.Message);
        }

        return new List<Deed>();
    }
    public async Task DeleteDeed(Deed deed)
    {
        int result = 0;
        Init();
       result = conn.Delete(deed);
          StatusMessage = string.Format("{0} record(s) Deleted (Name: {1})", result, deed.Owner);
            CancellationTokenSource cancellationTokenSource = new CancellationTokenSource();

            CommunityToolkit.Maui.Core.ToastDuration duration = CommunityToolkit.Maui.Core.ToastDuration.Short;
            double fontSize = 14;

            var toast = Toast.Make(StatusMessage, duration, fontSize);

            await toast.Show(cancellationTokenSource.Token);
        
    }
    public async Task UpdateDeed(Deed deed)
    {
        int result = 0;
        Init();
       result = conn.Update(deed);
         StatusMessage = string.Format("{0} record(s) Updated (Name: {1})", result, deed.Owner);
            CancellationTokenSource cancellationTokenSource = new CancellationTokenSource();

            CommunityToolkit.Maui.Core.ToastDuration duration = CommunityToolkit.Maui.Core.ToastDuration.Short;
            double fontSize = 14;

            var toast = Toast.Make(StatusMessage, duration, fontSize);

            await toast.Show(cancellationTokenSource.Token);
    }
}