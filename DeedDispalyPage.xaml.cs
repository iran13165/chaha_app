using chaha_app.ViewModel;

namespace chaha_app;

public partial class DeedDisplayPage : ContentPage
{
	public DeedDisplayPage(){}
	public DeedDisplayPage(DeedDisplayViewModel vm)
	{
		InitializeComponent();
		BindingContext = vm;
	}
}