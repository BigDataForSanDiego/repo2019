using Prism.Commands;
using Prism.Mvvm;
using Prism.Navigation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Input;

namespace CityPark.ViewModels
{
    public class MainPageViewModel : ViewModelBase
    {
        public ICommand NavigateMaps { get; set; }
        public MainPageViewModel(INavigationService navigationService)
            : base(navigationService)
        {
            Title = "Main Page!";
            NavigateMaps = new DelegateCommand(NavigateHandler);
        }

        public async void NavigateHandler()
        {
            await NavigationService.NavigateAsync("/MapsPage"); 
        }
    }
}
