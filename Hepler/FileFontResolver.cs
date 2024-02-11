using System.Reflection;
using PdfSharpCore.Fonts;
namespace chaha_app.Helpers;
public class FileFontResolver : IFontResolver
    {
        public FileFontResolver()
        {
        }

        public string DefaultFontName => "OpenSans-Regular";

        public byte[] GetFont(string faceName)
        {
            var assembly = this.GetType().GetTypeInfo().Assembly;
            var directory = $"chaha_app.Resources.Fonts.OpenSans-Regular.ttf";
            var stream = assembly.GetManifestResourceStream(directory);

            using (var reader = new StreamReader(stream))
            {
                var bytes = default(byte[]);

                using (var ms = new MemoryStream())
                {
                    reader.BaseStream.CopyTo(ms);
                    bytes = ms.ToArray();
                }

                return bytes;
            }
        }

        public FontResolverInfo ResolveTypeface(string familyName, bool isBold, bool isItalic)
        {
            return new FontResolverInfo(familyName);
        }
    }