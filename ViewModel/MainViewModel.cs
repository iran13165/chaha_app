using System.Collections.ObjectModel;
using chaha_app.Model;
using chaha_app.Services;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;

namespace chaha_app.ViewModel;
[QueryProperty("Deed", "Deed")]
[QueryProperty("Descriptions", "Descriptions")]
[QueryProperty("AddOrUpdate", "AddOrUpdate")]
public partial class MainViewModel : ObservableObject
{
    [ObservableProperty]
    string addOrUpdate;
    [ObservableProperty]
    Deed deed;
    readonly IDeedService deedService;
    public MainViewModel(IDeedService deedService)
    {
        this.deedService = deedService;
        AddOrUpdate = "Add";
        deed ??= new Deed();
        if (Descriptions == null)
        {
            Description d = new()
            {
                KhatiyanNo = "",
                PlotNo = ""
            };
            Descriptions = [d];
        }

    }

    [ObservableProperty]
    ObservableCollection<Description> descriptions;
    [RelayCommand]
    void AddData()
    {
        if (ValidateDeed())
        {
            Deed msg = Deed;
            Deed.Descriptions = Descriptions.ToList();
            deedService.AddOrUpdateDeed(Deed);
            Deed = new Deed();
            Description d = new()
            {
                KhatiyanNo = "",
                PlotNo = ""
            };
            Descriptions = [d];
            Shell.Current.DisplayAlert(msg.Owner, $"Buyer {msg.Owner} details {AddOrUpdate}ed successfully...!", "Ok");
            AddOrUpdate = "Add";
        }
    }
    [RelayCommand]
    async Task GoToDeedDisplatPage()
    {
        await Shell.Current.GoToAsync(nameof(DeedDisplayPage));
    }
    [RelayCommand]
    void ExitApp()
    {
        Application.Current.Quit();
    }
    [RelayCommand]
    void AddDescription()
    {

        Description d = new()
        {
            KhatiyanNo = "",
            PlotNo = ""
        };
        Descriptions.Add(d);


    }
    [RelayCommand]
    void RemoveDescription(Description description)
    {
        Descriptions.Remove(description);
    }
    bool ValidateDeed()
    {

        if (string.IsNullOrEmpty(Deed.Owner))
        {
            Shell.Current.DisplayAlert("Buyer", "Buyer can't be empty.", "Ok");
            return false;
        }
        if (string.IsNullOrEmpty(Deed.At))
        {
            Shell.Current.DisplayAlert("At", "At can't be empty.", "Ok");
            return false;
        }
        if (string.IsNullOrEmpty(Deed.Mouza))
        {
            Shell.Current.DisplayAlert("Mouza", "Mouza can't be empty.", "Ok");
            return false;
        }
        if (string.IsNullOrEmpty(Deed.DeedNo))
        {
            Shell.Current.DisplayAlert("DeedNo", "DeedNo can't be empty.", "Ok");
            return false;
        }
         if (Descriptions == null)
        {
            Shell.Current.DisplayAlert("Descriptions", "Descriptions is required", "Ok");
            return false;
        }
        if (Descriptions.Count == 0)
        {
            Shell.Current.DisplayAlert("Descriptions", "Atleast one Descriptions is required", "Ok");
            return false;
        }

        foreach (var item in Descriptions)
        {
            if (string.IsNullOrEmpty(item.PlotNo))
            {
                Shell.Current.DisplayAlert("PlotNo", "PlotNo can't be empty", "Ok");
                return false;
            }
            if (string.IsNullOrEmpty(item.KhatiyanNo))
            {
                Shell.Current.DisplayAlert("KhatiyanNo", "KhatiyanNo can't be empty", "Ok");
                return false;
            }
            if (item.LandArea == 0)
            {
                Shell.Current.DisplayAlert("LandArea", "LandArea can't be Zero", "Ok");
                return false;
            }
        }

        return true;
    }
}
