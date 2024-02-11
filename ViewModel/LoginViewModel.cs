
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;

namespace chaha_app;

public partial class LoginViewModel : ObservableObject
{
    [ObservableProperty]
    string email;
    [ObservableProperty]
    string password;
    public LoginViewModel() { }

    [RelayCommand]
    async Task Login()
    {
       if (string.IsNullOrEmpty(Email))
        {
           await Shell.Current.DisplayAlert("Email", "Email is required.", "Ok");
            return;
        }
        if (string.IsNullOrEmpty(Password))
        {
           await Shell.Current.DisplayAlert("Password", "Password is required.", "Ok");
            return;
        }
       var user = await FirebaseClientSource.SignIn(Email, Password);
       if(user != null)
       {
        await Shell.Current.GoToAsync(nameof(MainPage));
      }
    }
}
