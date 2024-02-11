using chaha_app.Model;

namespace chaha_app.Services
{
    public interface IDeedService
    {
        Task<bool> AddOrUpdateDeed(Deed deed);
        Task<bool> DeleteDeed(string Key);
        Task<List<Deed>> GetAllDeeds();

    }
}