using System;
using System.Collections.ObjectModel;
using CommunityToolkit.Mvvm.ComponentModel;
using chaha_app.Model;
using chaha_app.Services;
using CommunityToolkit.Mvvm.Input;
using System.Text;
using PdfSharpCore.Drawing;
using PdfSharpCore.Pdf;
using PdfSharpCore.Fonts;
using PdfSharpCore.Utils;
using PdfSharpCore.Drawing.Layout;
using MigraDocCore.DocumentObjectModel;
using MigraDocCore.Rendering;
using MigraDocCore.DocumentObjectModel.IO;
using System.Xml.XPath;
using MigraDocCore.DocumentObjectModel.Tables;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml;
using DocumentFormat.OpenXml.Spreadsheet;
using System.Reactive.Linq;


namespace chaha_app.ViewModel
{
	public partial class DeedDisplayViewModel : ObservableObject
	{
		async Task RequestStoragePermission()
		{
			var status1 = PermissionStatus.Unknown;
			var status2 = PermissionStatus.Unknown;
			status1 = Permissions.CheckStatusAsync<Permissions.StorageRead>().Result;
			status2 = Permissions.CheckStatusAsync<Permissions.StorageWrite>().Result;
			if (status1 == PermissionStatus.Granted && status2 == PermissionStatus.Granted)
				return;
			if (Permissions.ShouldShowRationale<Permissions.StorageRead>())
			{
				await Shell.Current.DisplayAlert("Need permissions", "Brcause!1", "ok");
			}
			if (Permissions.ShouldShowRationale<Permissions.StorageWrite>())
			{
				await Shell.Current.DisplayAlert("Need permissions", "Brcause!1", "ok");
			}
			status1 = await Permissions.RequestAsync<Permissions.StorageRead>();
			status2 = await Permissions.RequestAsync<Permissions.StorageWrite>();
			if (status1 != PermissionStatus.Granted || status2 == PermissionStatus.Granted)
				await Shell.Current.DisplayAlert("Need permissions", "Brcause! for read and write", "ok");

		}

		//readonly LocalDataService lds;
		IDeedService lds;
		List<Deed> AllDeeds;
		public DeedDisplayViewModel(IDeedService lds)
		{
			Deeds = new ObservableCollection<Deed>();
			AllDeeds = new List<Deed>();

			this.lds = lds;

		}
		[ObservableProperty]
		ObservableCollection<Deed> deeds;
		[RelayCommand]
		async Task LoadAllDeeds()
		{
			AllDeeds = await this.lds.GetAllDeeds();
			Deeds.Clear();
			int i = 0;
			foreach (Deed d in AllDeeds)
			{
				i++;
				d.Index = i;
				Deeds.Add(d);
			}
		}
		[ObservableProperty]
		string owner;
		[ObservableProperty]
		string khatiyanNo;
		[ObservableProperty]
		string plotNo;

		public View Content { get; private set; }

		[RelayCommand]
		async Task SearchByOwner()
		{
			if (Owner != null)
			{
				await LoadAllDeeds();

				List<Deed> filterByOwner = AllDeeds.Where(d => d.Owner.ToUpper().StartsWith(Owner.ToUpper())).ToList();
				Deeds.Clear();
				int i = 0;
				foreach (Deed d in filterByOwner)
				{
					i++;
					d.Index = i;
					Deeds.Add(d);
				}
			}


		}
		[RelayCommand]
		async Task SearchByPlotNo()
		{
			if (PlotNo != null)
			{
				await LoadAllDeeds();

				List<Deed> filterByOwner = AllDeeds.Where(d => d.Descriptions.Where(dcs => dcs.PlotNo.ToUpper().StartsWith(PlotNo.ToUpper())).ToList().Count >= 1).ToList();
				Deeds.Clear();
				int i = 0;
				foreach (Deed d in filterByOwner)
				{
					i++;
					d.Index = i;
					Deeds.Add(d);
				}
			}

		}
		[RelayCommand]
		async Task SearchByKhatiyanNo()
		{
			if (KhatiyanNo != null)
			{
				await LoadAllDeeds();

				List<Deed> filterByOwner = AllDeeds.Where(d => d.Descriptions.Where(dcs => dcs.KhatiyanNo.ToUpper().StartsWith(KhatiyanNo.ToUpper())).ToList().Count >= 1).ToList();
				Deeds.Clear();
				int i = 0;
				foreach (Deed d in filterByOwner)
				{
					i++;
					d.Index = i;
					Deeds.Add(d);
				}
			}



		}
		[RelayCommand]
		async Task GoToMain(Deed deed)
		{
			ObservableCollection<Description> descriptions = new ObservableCollection<Description>(deed.Descriptions);

			await Shell.Current.GoToAsync("..",
				new Dictionary<string, object>
				{
					["Deed"] = deed,
					["Descriptions"] = descriptions,
					["AddOrUpdate"] = "Update"
				});
		}


		/* Unmerged change from project 'chaha_app (net8.0-ios)'
		Before:
				public void Delete(Deed deed)
		After:
				public void DeleteAsync(Deed deed)
		*/

		/* Unmerged change from project 'chaha_app (net8.0-maccatalyst)'
		Before:
				public void Delete(Deed deed)
		After:
				public void DeleteAsync(Deed deed)
		*/
		public async Task CreateMigraDoc()
		{
			Document migraDoc = new Document();
			//string SaPath = System.IO.Path.Combine(Android.App.Application.Context.GetExternalFilesDir(Android.OS.Environment.DirectoryDocuments).AbsolutePath, "MigraDoc.mdddl");
			//DdlWriter.WriteToFile(migraDoc, SaPath);
			migraDoc.Info.Title = "A sample invoice";
			migraDoc.Info.Subject = "Demonstrates how to create an invoice.";
			migraDoc.Info.Author = "Stefan Lange";
			migraDoc.DefaultPageSetup.LeftMargin = Unit.FromMillimeter(8);
			//migraDoc.DefaultPageSetup.RightMargin = Unit.FromMillimeter(800);
			MigraDocCore.DocumentObjectModel.Style style = migraDoc.Styles["Normal"];
			style.Font.Name = "OpenSans-Regular";
			////////////////////////////////header footer section //////////////////////////////////
			Section HeaderSection = migraDoc.AddSection();

			HeaderSection.PageSetup.TopMargin = Unit.FromMillimeter(8);
			Paragraph hparagraph = HeaderSection.Headers.Primary.AddParagraph();

			hparagraph.AddText("Searching Deeds are given below...");

			hparagraph.Format.Font.Size = 24;
			hparagraph.Format.Alignment = ParagraphAlignment.Center;
			hparagraph.Format.Font.Color = MigraDocCore.DocumentObjectModel.Colors.Black;

			///////Add Table////////////////////////////////
			//Section tableSection = migraDoc.AddSection();

			Section tableSection = migraDoc.LastSection;
			tableSection.PageSetup.TopMargin = Unit.FromMillimeter(30);
			MigraDocCore.DocumentObjectModel.Tables.Table table = tableSection.AddTable();
			// Create the item table

			table.Style = "Table";
			table.Borders.Color = MigraDocCore.DocumentObjectModel.Colors.Black;
			table.Borders.Width = 0.25;
			table.Borders.Left.Width = 0.5;
			table.Borders.Right.Width = 0.5;
			table.LeftPadding = 0;
			//table.Rows.LeftIndent = 0;

			// // Before you can add a row, you must define the columns
			MigraDocCore.DocumentObjectModel.Tables.Column column = table.AddColumn("4cm");
			column.Format.Alignment = ParagraphAlignment.Center;

			column = table.AddColumn("3.5cm");
			column.Format.Alignment = ParagraphAlignment.Center;

			column = table.AddColumn("3.5cm");
			column.Format.Alignment = ParagraphAlignment.Center;

			column = table.AddColumn("2.5cm");
			column.Format.Alignment = ParagraphAlignment.Center;

			column = table.AddColumn("3.5cm");
			column.Format.Alignment = ParagraphAlignment.Center;

			column = table.AddColumn("2.5cm");
			column.Format.Alignment = ParagraphAlignment.Center;
			//column.Format.Font.Color = MigraDocCore.DocumentObjectModel.Colors.White;
			// // Create the header of the table
			MigraDocCore.DocumentObjectModel.Tables.Row row = table.AddRow();
			row.Height = 30;
			row.HeadingFormat = true;
			row.Format.Alignment = ParagraphAlignment.Center;
			row.Format.Font.Bold = true;
			row.Shading.Color = MigraDocCore.DocumentObjectModel.Colors.WhiteSmoke;
			row.Cells[0].AddParagraph("Owner");
			row.Cells[0].Format.Alignment = ParagraphAlignment.Center;
			row.Cells[0].Format.Font.Color = MigraDocCore.DocumentObjectModel.Colors.Black;
			row.Cells[0].VerticalAlignment = MigraDocCore.DocumentObjectModel.Tables.VerticalAlignment.Center;
			row.Cells[0].Format.Font.Size = 12;

			row.Cells[1].AddParagraph("Mouza");
			row.Cells[1].Format.Alignment = ParagraphAlignment.Center;
			row.Cells[1].VerticalAlignment = MigraDocCore.DocumentObjectModel.Tables.VerticalAlignment.Center;
			row.Cells[1].Format.Font.Color = MigraDocCore.DocumentObjectModel.Colors.Black;
			row.Cells[1].Format.Font.Size = 12;


			row.Cells[2].AddParagraph("At");
			row.Cells[2].Format.Alignment = ParagraphAlignment.Center;
			row.Cells[2].VerticalAlignment = MigraDocCore.DocumentObjectModel.Tables.VerticalAlignment.Center;
			row.Cells[2].Format.Font.Color = MigraDocCore.DocumentObjectModel.Colors.Black;
			row.Cells[2].Format.Font.Size = 12;


			row.Cells[3].AddParagraph("Dec");
			row.Cells[3].Format.Alignment = ParagraphAlignment.Center;
			row.Cells[3].VerticalAlignment = MigraDocCore.DocumentObjectModel.Tables.VerticalAlignment.Center;
			row.Cells[3].Format.Font.Color = MigraDocCore.DocumentObjectModel.Colors.Black;
			row.Cells[3].Format.Font.Size = 12;


			row.Cells[4].AddParagraph("Deed No.");
			row.Cells[4].Format.Alignment = ParagraphAlignment.Center;
			row.Cells[4].VerticalAlignment = MigraDocCore.DocumentObjectModel.Tables.VerticalAlignment.Center;
			row.Cells[4].Format.Font.Color = MigraDocCore.DocumentObjectModel.Colors.Black;
			row.Cells[4].Format.Font.Size = 12;

			row.Cells[5].AddParagraph("Date");
			row.Cells[5].Format.Alignment = ParagraphAlignment.Center;
			row.Cells[5].VerticalAlignment = MigraDocCore.DocumentObjectModel.Tables.VerticalAlignment.Center;
			row.Cells[5].Format.Font.Color = MigraDocCore.DocumentObjectModel.Colors.Black;
			row.Cells[5].Format.Font.Size = 12;
			for (int i = 0; i < Deeds.Count; i++)
			{
				MigraDocCore.DocumentObjectModel.Tables.Row rw = table.AddRow();
				rw.Cells[0].AddParagraph(Deeds[i].Owner);
				rw.Cells[0].Format.Font.Color = MigraDocCore.DocumentObjectModel.Colors.Black;
				rw.Cells[0].Format.Alignment = ParagraphAlignment.Center;
				rw.Cells[0].Format.Font.Size = 12;

				rw.Cells[1].AddParagraph(Deeds[i].Mouza);
				rw.Cells[1].Format.Font.Color = MigraDocCore.DocumentObjectModel.Colors.Black;
				rw.Cells[1].Format.Alignment = ParagraphAlignment.Center;
				rw.Cells[1].Format.Font.Size = 12;

				rw.Cells[2].AddParagraph(Deeds[i].At);
				rw.Cells[2].Format.Font.Color = MigraDocCore.DocumentObjectModel.Colors.Black;
				rw.Cells[2].Format.Alignment = ParagraphAlignment.Center;
				rw.Cells[2].Format.Font.Size = 12;

				rw.Cells[3].AddParagraph(Deeds[i].Descriptions[0].PlotNo);
				rw.Cells[3].Format.Font.Color = MigraDocCore.DocumentObjectModel.Colors.Black;
				rw.Cells[3].Format.Alignment = ParagraphAlignment.Center;
				rw.Cells[3].Format.Font.Size = 12;

				rw.Cells[4].AddParagraph(Deeds[i].DeedNo);
				rw.Cells[4].Format.Font.Color = MigraDocCore.DocumentObjectModel.Colors.Black;
				rw.Cells[1].Format.Alignment = ParagraphAlignment.Center;
				rw.Cells[4].Format.Font.Size = 12;

				DateTime date = Deeds[i].Date;
				int day = date.Day;
				int month = date.Month;
				int year = date.Year;
				string DateString = day.ToString() + "-" + month.ToString() + "-" + year.ToString();

				rw.Cells[5].AddParagraph(DateString);
				rw.Cells[5].Format.Font.Color = MigraDocCore.DocumentObjectModel.Colors.Black;
				rw.Cells[5].Format.Alignment = ParagraphAlignment.Center;
				rw.Cells[5].Format.Font.Size = 12;
			}
			var r = table.AddRow();
			r.Borders.Visible = false;

			// // Set the borders of the specified cell range
			// table.SetEdge(5, table.Rows.Count - 4, 1, 4, Edge.Box, BorderStyle.Single, 0.75);
			Section FooterSection = migraDoc.LastSection;
			Paragraph fparagraph = FooterSection.Footers.Primary.AddParagraph();
			int pageNo = migraDoc.FootnoteStartingNumber++;
			fparagraph.AddText("Page ");
			fparagraph.AddPageField();
			fparagraph.AddText(" of ");
			fparagraph.AddNumPagesField();
			fparagraph.Format.Font.Size = 24;
			fparagraph.Format.Alignment = ParagraphAlignment.Center;
			fparagraph.Format.Font.Color = MigraDocCore.DocumentObjectModel.Colors.Black;


			DocumentRenderer migraRenderer = new DocumentRenderer(migraDoc);
			migraRenderer.PrepareDocument();

			PdfDocumentRenderer pdfRenderer = new PdfDocumentRenderer(true);
			pdfRenderer.Document = migraDoc;
			pdfRenderer.RenderDocument();


			string SaveToPath = System.IO.Path.Combine(Android.App.Application.Context.GetExternalFilesDir(Android.OS.Environment.DirectoryDocuments).AbsolutePath, "deeds.pdf");
			pdfRenderer.PdfDocument.Save(SaveToPath);
			await Launcher.OpenAsync(new OpenFileRequest
			{
				File = new ReadOnlyFile(SaveToPath)
			});

		}
		public async Task<FileResult> PickAndShow(PickOptions options)
		{
			try
			{
				var result = await FilePicker.Default.PickAsync(options);
				if (result != null)
				{
					if (result.FileName.EndsWith("xlsx", StringComparison.OrdinalIgnoreCase))
					{
						return result;
					}
					else
					{
						await Shell.Current.DisplayAlert("You must select excel file", "Supported Excel file only", "ok");
					}
				}


			}
			catch (Exception ex)
			{
				// The user canceled or something went wrong
			}

			return null;
		}
		async Task ExtractDataFromXlSheet()
		{
			var result = await PickAndShow(new PickOptions());
			if (result == null)
				return;
			using (SpreadsheetDocument doc = SpreadsheetDocument.Open(result.FullPath, false))
			{
				WorkbookPart workbookPart = doc.WorkbookPart;
				Sheet sheet = workbookPart.Workbook.Descendants<Sheet>().First();
				WorksheetPart worksheetPart = (WorksheetPart)workbookPart.GetPartById(sheet.Id);
				SheetData sheetData = worksheetPart.Worksheet.Elements<SheetData>().First();
				if (!sheetData.Elements<DocumentFormat.OpenXml.Spreadsheet.Row>().Any())
				{
					await Shell.Current.DisplayAlert("Empty Excel file", "file should fill some data", "ok");
				}
				else
				{
					foreach (var row in sheetData.Elements<DocumentFormat.OpenXml.Spreadsheet.Row>())
					{
						foreach (var cell in row.Elements<DocumentFormat.OpenXml.Spreadsheet.Cell>())
						{
							string cellVal = cell.CellValue.Text;
						}
					}
				}
			}

		}
		[RelayCommand]
		async Task AddDeed()
		{
			await Shell.Current.GoToAsync("..",
				new Dictionary<string, object>
				{
					["deed"] = new Deed(),
					["descriptions"] = new Description(),
					["AddOrUpdate"] = "Add"
				});
		}
		public async Task createPdf()
		{
			// Create a new PDF document
			PdfDocument document = new PdfDocument();

			// Draw the text
			// gfx.DrawString("Hello, World!", font, XBrushes.Black,
			//   new XRect(0, 0, page.Width, page.Height),
			//   XStringFormats.Center);
			document.SecuritySettings.PermitAccessibilityExtractContent = false;
			document.SecuritySettings.PermitAnnotations = false;
			document.SecuritySettings.PermitAssembleDocument = false;
			document.SecuritySettings.PermitExtractContent = false;
			document.SecuritySettings.PermitFormsFill = true;
			document.SecuritySettings.PermitFullQualityPrint = false;
			document.SecuritySettings.PermitModifyDocument = true;
			document.SecuritySettings.PermitPrint = false;
			document.SecuritySettings.OwnerPassword = "owner";
			///////////////////////////pdftable/////////////////////////////////////
			XFont fontParagraph = new XFont("OpenSans-Regular", 11, XFontStyle.Regular);
			for (int p = 0; p < 1; p++)
			{
				// Page Options
				PdfPage pdfPage = document.AddPage();
				pdfPage.Height = 842;//842
				pdfPage.Width = 590;
				XGraphics graph = XGraphics.FromPdfPage(pdfPage);
				//////Add header footer
				Document migraDoc = new Document();

				Section migraSection = migraDoc.AddSection();
				migraSection.PageSetup.DifferentFirstPageHeaderFooter = true;
				migraSection.PageSetup.TopMargin = Unit.FromMillimeter(842); // HeightValue = the height I need for my 1st header
				Paragraph paragraph = migraSection.Footers.Primary.AddParagraph();
				paragraph.AddText("PowerBooks Inc · Sample Street 42 · 56789 Cologne · Germany");
				paragraph.Format.Font.Size = 9;
				paragraph.Format.Alignment = ParagraphAlignment.Center;
				DocumentRenderer migraRenderer = new DocumentRenderer(migraDoc);
				migraRenderer.PrepareDocument();

				PdfDocumentRenderer pdfRenderer = new PdfDocumentRenderer();

				int nbPage = migraRenderer.FormattedDocument.PageCount; // the count is not great because I don't know how to adapt my table area
				for (int i = 0; i < nbPage; i++)
				{
					migraRenderer.RenderPage(graph, i + 1);
				}

				pdfRenderer.Document = migraDoc;
				pdfRenderer.RenderDocument();
				//Section section = pdfPage.
				// Get an XGraphics object for drawing


				// Text format
				XStringFormat format = new XStringFormat();
				format.LineAlignment = XLineAlignment.Near;
				format.Alignment = XStringAlignment.Near;
				var tf = new XTextFormatter(graph);



				// Row elements
				int el1_width = 80;
				int el2_width = 380;

				// page structure options
				double lineHeight = 20;
				int marginLeft = 20;
				int marginTop = 20;

				int el_height = 30;
				int rect_height = 17;

				int interLine_X_1 = 2;
				int interLine_X_2 = 2 * interLine_X_1;

				int offSetX_1 = el1_width;
				int offSetX_2 = el1_width + el2_width;

				XSolidBrush rect_style1 = new XSolidBrush(XColors.LightGray);
				XSolidBrush rect_style2 = new XSolidBrush(XColors.DarkGreen);
				XSolidBrush rect_style3 = new XSolidBrush(XColors.Red);

				for (int i = 0; i < 30; i++)
				{
					double dist_Y = lineHeight * (i + 1);
					double dist_Y2 = dist_Y - 2;

					// header della G
					if (i == 0)
					{
						graph.DrawRectangle(rect_style2, marginLeft, marginTop, pdfPage.Width - 2 * marginLeft, rect_height);

						tf.DrawString("column1", fontParagraph, XBrushes.White,
									  new XRect(marginLeft, marginTop, el1_width, el_height), format);

						tf.DrawString("column2", fontParagraph, XBrushes.White,
									  new XRect(marginLeft + offSetX_1 + interLine_X_1, marginTop, el2_width, el_height), format);

						tf.DrawString("column3", fontParagraph, XBrushes.White,
									  new XRect(marginLeft + offSetX_2 + 2 * interLine_X_2, marginTop, el1_width, el_height), format);

						// stampo il primo elemento insieme all'header
						graph.DrawRectangle(rect_style1, marginLeft, dist_Y2 + marginTop, el1_width, rect_height);
						tf.DrawString("text1", fontParagraph, XBrushes.Black,
									  new XRect(marginLeft, dist_Y + marginTop, el1_width, el_height), format);

						//ELEMENT 2 - BIG 380
						graph.DrawRectangle(rect_style1, marginLeft + offSetX_1 + interLine_X_1, dist_Y2 + marginTop, el2_width, rect_height);
						tf.DrawString(
							"text2",
							fontParagraph,
							XBrushes.Black,
							new XRect(marginLeft + offSetX_1 + interLine_X_1, dist_Y + marginTop, el2_width, el_height),
							format);


						//ELEMENT 3 - SMALL 80

						graph.DrawRectangle(rect_style1, marginLeft + offSetX_2 + interLine_X_2, dist_Y2 + marginTop, el1_width, rect_height);
						tf.DrawString(
							"text3",
							fontParagraph,
							XBrushes.Black,
							new XRect(marginLeft + offSetX_2 + 2 * interLine_X_2, dist_Y + marginTop, el1_width, el_height),
							format);


					}
					else
					{

						//if (i % 2 == 1)
						//{
						//  graph.DrawRectangle(TextBackgroundBrush, marginLeft, lineY - 2 + marginTop, pdfPage.Width - marginLeft - marginRight, lineHeight - 2);
						//}

						//ELEMENT 1 - SMALL 80
						graph.DrawRectangle(rect_style1, marginLeft, marginTop + dist_Y2, el1_width, rect_height);
						tf.DrawString(

							"text1",
							fontParagraph,
							XBrushes.Black,
							new XRect(marginLeft, marginTop + dist_Y, el1_width, el_height),
							format);

						//ELEMENT 2 - BIG 380
						graph.DrawRectangle(rect_style1, marginLeft + offSetX_1 + interLine_X_1, dist_Y2 + marginTop, el2_width, rect_height);
						tf.DrawString(
							"text2",
							fontParagraph,
							XBrushes.Black,
							new XRect(marginLeft + offSetX_1 + interLine_X_1, marginTop + dist_Y, el2_width, el_height),
							format);


						//ELEMENT 3 - SMALL 80

						graph.DrawRectangle(rect_style1, marginLeft + offSetX_2 + interLine_X_2, dist_Y2 + marginTop, el1_width, rect_height);
						tf.DrawString(
							"text3",
							fontParagraph,
							XBrushes.Black,
							new XRect(marginLeft + offSetX_2 + 2 * interLine_X_2, marginTop + dist_Y, el1_width, el_height),
							format);

					}

				}


			}

			string SaveToPath = System.IO.Path.Combine(Android.App.Application.Context.GetExternalFilesDir(Android.OS.Environment.DirectoryDocuments).AbsolutePath, "hello.pdf");
			document.Save(SaveToPath);
			await Launcher.OpenAsync(new OpenFileRequest
			{
				File = new ReadOnlyFile(SaveToPath)
			});
		}
		[RelayCommand]
		async Task Delete(Deed deed)
		{
			await lds.DeleteDeed(deed.Key);
		 await	LoadAllDeeds();
		}
		[RelayCommand]
		public async Task PrintPdf()
		{
			await RequestStoragePermission();
			await CreateMigraDoc();
			//ExtractDataFromXlSheet();
		}
	}
}