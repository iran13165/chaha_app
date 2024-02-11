using SQLite;

namespace chaha_app.Model;
 [Table("deed")]
	public class Deed
	{
        [PrimaryKey]
        public string Key { get; set; }
		public string Owner { get; set; }
		public string Mouza { get; set; }
		public string At { get; set; }
		//public string Dec { get; set; }
		public List<Description> Descriptions { get; set; }
        public string DeedNo { get; set; }
        public DateTime Date { get; set; }
		public int Index {get; set; }
		public double TotalArea {
			get {
				return Descriptions.Sum(x=> x.LandArea);
			}
		}
    }
	public class Description
	{
		public string PlotNo { get; set;}
		public string KhatiyanNo { get; set;}
		public double LandArea { get; set; }

	}