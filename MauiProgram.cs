using chaha_app.DatabaseConnection;
using chaha_app.Services;
using chaha_app.Services.Implementations;
using chaha_app.ViewModel;
using CommunityToolkit.Maui;
using Microsoft.Extensions.Logging;

namespace chaha_app;

public static class MauiProgram
{
	public static MauiApp CreateMauiApp()
	{
		var builder = MauiApp.CreateBuilder();
		builder
			.UseMauiApp<App>().UseMauiCommunityToolkit()
			.ConfigureFonts(fonts =>
			{
				fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
				fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
				fonts.AddFont("MaterialIcons-Regular.ttf", "MaterialIcon");
			});

#if DEBUG
		builder.Logging.AddDebug();
#endif
		builder.Services.AddSingleton<MainPage>();
		builder.Services.AddSingleton<MainViewModel>();
		builder.Services.AddSingleton<DeedDisplayViewModel>();
		builder.Services.AddSingleton<DeedDisplayPage>();
		builder.Services.AddSingleton<LocalDataService>();
		builder.Services.AddSingleton<LoginPage>();
		builder.Services.AddSingleton<LoginViewModel>();
		///////permissions.///////

        //sqlite
        string dbPath = FileAccessHelper.GetLocalFilePath("deed.db3");
        builder.Services.AddSingleton<DeedRepository>(s => ActivatorUtilities.CreateInstance<DeedRepository>(s, dbPath));
		//firebase
		builder.Services.AddSingleton<IDeedService,DeedService>();
		return builder.Build();
	}
}
