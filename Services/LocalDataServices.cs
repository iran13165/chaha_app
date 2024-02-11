using chaha_app.Model;

namespace chaha_app.Services
{
    public class LocalDataService
    {
        private readonly DeedRepository deedRepository;
        private readonly List<Deed> deeds;
        public LocalDataService(DeedRepository repository)
        {
            deedRepository = repository;
            deeds = [];
        }
        public async void AddData(Deed deed)
        {
            if(deed.Key == "")
            {
                await deedRepository.addNewDeedAsync(deed);
            } else
            {
                 deedRepository.UpdateDeed(deed);
            }
           
            //people.Add(p)
        }
        public List<Deed> GetDeeds()
        {
            return deedRepository.GetAllDeed();
        }
        public void DeleteDeed(Deed deed)
        {
            deedRepository.DeleteDeed(deed);
        }
    }
}