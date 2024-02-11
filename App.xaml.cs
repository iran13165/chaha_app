using chaha_app.Helpers;
using PdfSharpCore.Fonts;

namespace chaha_app;

public partial class App : Application
{
	public static DeedRepository? DeedRepo {get; private set; }
	public App(DeedRepository repo)
	{
		InitializeComponent();
		GlobalFontSettings.FontResolver = new FileFontResolver();
		DeedRepo = repo;
		MainPage = new AppShell();
		Routing.RegisterRoute(nameof(DeedDisplayPage), typeof(DeedDisplayPage));
		Routing.RegisterRoute(nameof(MainPage), typeof(MainPage));
	}
}
