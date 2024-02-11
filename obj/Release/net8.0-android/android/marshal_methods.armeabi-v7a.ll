; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [196 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [392 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 143
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 142
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 166
	i32 39109920, ; 3: Newtonsoft.Json.dll => 0x254c520 => 63
	i32 39485524, ; 4: System.Net.WebSockets.dll => 0x25a8054 => 152
	i32 42639949, ; 5: System.Threading.Thread => 0x28aa24d => 183
	i32 53857724, ; 6: ca/Microsoft.Maui.Controls.resources => 0x335cdbc => 1
	i32 68219467, ; 7: System.Security.Cryptography.Primitives => 0x410f24b => 173
	i32 72070932, ; 8: Microsoft.Maui.Graphics.dll => 0x44bb714 => 60
	i32 89037730, ; 9: PdfSharpCore.dll => 0x54e9ba2 => 64
	i32 113429830, ; 10: zh-HK/Microsoft.Maui.Controls.resources => 0x6c2cd46 => 31
	i32 117431740, ; 11: System.Runtime.InteropServices => 0x6ffddbc => 165
	i32 122350210, ; 12: System.Threading.Channels.dll => 0x74aea82 => 179
	i32 127363243, ; 13: ICSharpCode.SharpZipLib => 0x79768ab => 67
	i32 142721839, ; 14: System.Net.WebHeaderCollection => 0x881c32f => 150
	i32 149972175, ; 15: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 173
	i32 165246403, ; 16: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 84
	i32 182336117, ; 17: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 102
	i32 195452805, ; 18: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 19: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 20: System.ComponentModel => 0xc38ff48 => 120
	i32 220171995, ; 21: System.Diagnostics.Debug => 0xd1f8edb => 123
	i32 230752869, ; 22: Microsoft.CSharp.dll => 0xdc10265 => 109
	i32 246610117, ; 23: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 159
	i32 261882112, ; 24: DocumentFormat.OpenXml.Framework.dll => 0xf9c0100 => 40
	i32 280992041, ; 25: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 316584994, ; 26: Magick.NET.Core.dll => 0x12deb422 => 45
	i32 318968648, ; 27: Xamarin.AndroidX.Activity.dll => 0x13031348 => 80
	i32 331603304, ; 28: SixLabors.Fonts => 0x13c3dd68 => 68
	i32 336156722, ; 29: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 30: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 91
	i32 347068432, ; 31: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 74
	i32 356389973, ; 32: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 357576608, ; 33: cs/Microsoft.Maui.Controls.resources => 0x15502fa0 => 2
	i32 367780167, ; 34: System.IO.Pipes => 0x15ebe147 => 135
	i32 375677976, ; 35: System.Net.ServicePoint.dll => 0x16646418 => 147
	i32 379916513, ; 36: System.Threading.Thread.dll => 0x16a510e1 => 183
	i32 385762202, ; 37: System.Memory.dll => 0x16fe439a => 139
	i32 393699800, ; 38: Firebase => 0x177761d8 => 42
	i32 395744057, ; 39: _Microsoft.Android.Resource.Designer => 0x17969339 => 35
	i32 418815285, ; 40: de/PdfSharpCore.resources => 0x18f69d35 => 34
	i32 435591531, ; 41: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 42: System.Collections => 0x1a61054f => 116
	i32 450948140, ; 43: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 90
	i32 456227837, ; 44: System.Web.HttpUtility.dll => 0x1b317bfd => 185
	i32 459347974, ; 45: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 169
	i32 465846621, ; 46: mscorlib => 0x1bc4415d => 190
	i32 469710990, ; 47: System.dll => 0x1bff388e => 189
	i32 498788369, ; 48: System.ObjectModel => 0x1dbae811 => 154
	i32 500358224, ; 49: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 50: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 513247710, ; 51: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 54
	i32 527168573, ; 52: hi/Microsoft.Maui.Controls.resources => 0x1f6bf43d => 10
	i32 530272170, ; 53: System.Linq.Queryable => 0x1f9b4faa => 137
	i32 539058512, ; 54: Microsoft.Extensions.Logging => 0x20216150 => 51
	i32 540030774, ; 55: System.IO.FileSystem.dll => 0x20303736 => 134
	i32 545304856, ; 56: System.Runtime.Extensions => 0x2080b118 => 163
	i32 548916678, ; 57: Microsoft.Bcl.AsyncInterfaces => 0x20b7cdc6 => 46
	i32 592146354, ; 58: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 597488923, ; 59: CommunityToolkit.Maui => 0x239cf51b => 36
	i32 610194910, ; 60: System.Reactive.dll => 0x245ed5de => 79
	i32 613668793, ; 61: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 172
	i32 627609679, ; 62: Xamarin.AndroidX.CustomView => 0x2568904f => 88
	i32 636507624, ; 63: MigraDocCore.DocumentObjectModel => 0x25f055e8 => 61
	i32 672442732, ; 64: System.Collections.Concurrent => 0x2814a96c => 112
	i32 683518922, ; 65: System.Net.Security => 0x28bdabca => 146
	i32 688181140, ; 66: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 690569205, ; 67: System.Xml.Linq.dll => 0x29293ff5 => 186
	i32 700358131, ; 68: System.IO.Compression.ZipFile => 0x29be9df3 => 132
	i32 706645707, ; 69: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 70: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 748832960, ; 71: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 71
	i32 752882528, ; 72: SQLitePCLRaw.provider.dynamic_cdecl.dll => 0x2ce01360 => 75
	i32 759454413, ; 73: System.Net.Requests => 0x2d445acd => 145
	i32 762598435, ; 74: System.IO.Pipes.dll => 0x2d745423 => 135
	i32 769241134, ; 75: MigraDocCore.DocumentObjectModel.dll => 0x2dd9b02e => 61
	i32 775507847, ; 76: System.IO.Compression => 0x2e394f87 => 133
	i32 789151979, ; 77: Microsoft.Extensions.Options => 0x2f0980eb => 53
	i32 804715423, ; 78: System.Data.Common => 0x2ff6fb9f => 122
	i32 809851609, ; 79: System.Drawing.Common.dll => 0x30455ad9 => 77
	i32 823281589, ; 80: System.Private.Uri.dll => 0x311247b5 => 155
	i32 830298997, ; 81: System.IO.Compression.Brotli => 0x317d5b75 => 131
	i32 870878177, ; 82: ar/Microsoft.Maui.Controls.resources => 0x33e88be1 => 0
	i32 904024072, ; 83: System.ComponentModel.Primitives.dll => 0x35e25008 => 118
	i32 908771576, ; 84: Magick.NET-Q16-AnyCPU.dll => 0x362ac0f8 => 44
	i32 926902833, ; 85: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 952358589, ; 86: SQLitePCLRaw.nativelibrary => 0x38c3d6bd => 72
	i32 955402788, ; 87: Newtonsoft.Json => 0x38f24a24 => 63
	i32 967690846, ; 88: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 91
	i32 975874589, ; 89: System.Xml.XDocument => 0x3a2aaa1d => 188
	i32 987214855, ; 90: System.Diagnostics.Tools => 0x3ad7b407 => 126
	i32 992768348, ; 91: System.Collections.dll => 0x3b2c715c => 116
	i32 993161700, ; 92: zh-Hans/Microsoft.Maui.Controls.resources => 0x3b3271e4 => 32
	i32 994442037, ; 93: System.IO.FileSystem => 0x3b45fb35 => 134
	i32 994547685, ; 94: es/Microsoft.Maui.Controls.resources => 0x3b4797e5 => 6
	i32 1012816738, ; 95: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 101
	i32 1019214401, ; 96: System.Drawing => 0x3cbffa41 => 129
	i32 1028951442, ; 97: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 50
	i32 1029334545, ; 98: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 99: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 81
	i32 1036536393, ; 100: System.Drawing.Primitives.dll => 0x3dc84a49 => 128
	i32 1044663988, ; 101: System.Linq.Expressions.dll => 0x3e444eb4 => 136
	i32 1052210849, ; 102: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 93
	i32 1082857460, ; 103: System.ComponentModel.TypeConverter => 0x408b17f4 => 119
	i32 1083751839, ; 104: System.IO.Packaging => 0x4098bd9f => 78
	i32 1084122840, ; 105: Xamarin.Kotlin.StdLib => 0x409e66d8 => 106
	i32 1087008091, ; 106: PdfSharpCore.Charting => 0x40ca6d5b => 65
	i32 1098259244, ; 107: System => 0x41761b2c => 189
	i32 1178241025, ; 108: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 98
	i32 1178797549, ; 109: fi/Microsoft.Maui.Controls.resources => 0x464305ed => 7
	i32 1203215381, ; 110: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1208641965, ; 111: System.Diagnostics.Process => 0x480a69ad => 125
	i32 1214827643, ; 112: CommunityToolkit.Mvvm => 0x4868cc7b => 38
	i32 1218067159, ; 113: PdfSharpCore.Charting.dll => 0x489a3ad7 => 65
	i32 1231682534, ; 114: PdfSharpCore => 0x4969fbe6 => 64
	i32 1234928153, ; 115: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1292207520, ; 116: SQLitePCLRaw.core.dll => 0x4d0585a0 => 73
	i32 1292843635, ; 117: DocumentFormat.OpenXml.Framework => 0x4d0f3a73 => 40
	i32 1293217323, ; 118: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 89
	i32 1324164729, ; 119: System.Linq => 0x4eed2679 => 138
	i32 1338781641, ; 120: DocumentFormat.OpenXml.dll => 0x4fcc2fc9 => 39
	i32 1362304808, ; 121: Select.HtmlToPdf => 0x51331f28 => 66
	i32 1376866003, ; 122: Xamarin.AndroidX.SavedState => 0x52114ed3 => 101
	i32 1379779777, ; 123: System.Resources.ResourceManager => 0x523dc4c1 => 161
	i32 1406073936, ; 124: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 85
	i32 1408764838, ; 125: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 168
	i32 1411638395, ; 126: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 162
	i32 1452070440, ; 127: System.Formats.Asn1.dll => 0x568cd628 => 130
	i32 1453312822, ; 128: System.Diagnostics.Tools.dll => 0x569fcb36 => 126
	i32 1457743152, ; 129: System.Runtime.Extensions.dll => 0x56e36530 => 163
	i32 1458022317, ; 130: System.Net.Security.dll => 0x56e7a7ad => 146
	i32 1461234159, ; 131: System.Collections.Immutable.dll => 0x5718a9ef => 113
	i32 1462112819, ; 132: System.IO.Compression.dll => 0x57261233 => 133
	i32 1469204771, ; 133: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 82
	i32 1470490898, ; 134: Microsoft.Extensions.Primitives => 0x57a5e912 => 54
	i32 1479771757, ; 135: System.Collections.Immutable => 0x5833866d => 113
	i32 1480492111, ; 136: System.IO.Compression.Brotli.dll => 0x583e844f => 131
	i32 1487239319, ; 137: Microsoft.Win32.Primitives => 0x58a57897 => 110
	i32 1488290336, ; 138: SixLabors.ImageSharp.dll => 0x58b58220 => 69
	i32 1493001747, ; 139: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1498517991, ; 140: de/PdfSharpCore.resources.dll => 0x595191e7 => 34
	i32 1514721132, ; 141: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1543031311, ; 142: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 178
	i32 1545958975, ; 143: chaha_app.dll => 0x5c25763f => 108
	i32 1551623176, ; 144: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1554762148, ; 145: fr/Microsoft.Maui.Controls.resources => 0x5cabc9a4 => 8
	i32 1565443465, ; 146: Magick.NET.Core => 0x5d4ec589 => 45
	i32 1580413037, ; 147: sv/Microsoft.Maui.Controls.resources => 0x5e33306d => 26
	i32 1591080825, ; 148: zh-Hant/Microsoft.Maui.Controls.resources => 0x5ed5f779 => 33
	i32 1604827217, ; 149: System.Net.WebClient => 0x5fa7b851 => 149
	i32 1618516317, ; 150: System.Net.WebSockets.Client.dll => 0x6078995d => 151
	i32 1622152042, ; 151: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 95
	i32 1624863272, ; 152: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 104
	i32 1634654947, ; 153: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 37
	i32 1636350590, ; 154: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 87
	i32 1639515021, ; 155: System.Net.Http.dll => 0x61b9038d => 140
	i32 1639986890, ; 156: System.Text.RegularExpressions => 0x61c036ca => 178
	i32 1641389582, ; 157: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 117
	i32 1657153582, ; 158: System.Runtime => 0x62c6282e => 170
	i32 1658251792, ; 159: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 105
	i32 1677501392, ; 160: System.Net.Primitives.dll => 0x63fca3d0 => 144
	i32 1678508291, ; 161: System.Net.WebSockets => 0x640c0103 => 152
	i32 1679769178, ; 162: System.Security.Cryptography => 0x641f3e5a => 174
	i32 1686632748, ; 163: MigraDocCore.Rendering.dll => 0x6487f92c => 62
	i32 1701541528, ; 164: System.Diagnostics.Debug.dll => 0x656b7698 => 123
	i32 1711441057, ; 165: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 74
	i32 1720046991, ; 166: chaha_app => 0x6685d58f => 108
	i32 1729485958, ; 167: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 83
	i32 1736233607, ; 168: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1750313021, ; 169: Microsoft.Win32.Primitives.dll => 0x6853a83d => 110
	i32 1763938596, ; 170: System.Diagnostics.TraceSource.dll => 0x69239124 => 127
	i32 1766324549, ; 171: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 102
	i32 1770582343, ; 172: Microsoft.Extensions.Logging.dll => 0x6988f147 => 51
	i32 1780572499, ; 173: Mono.Android.Runtime.dll => 0x6a216153 => 194
	i32 1788241197, ; 174: Xamarin.AndroidX.Fragment => 0x6a96652d => 90
	i32 1796167890, ; 175: Microsoft.Bcl.AsyncInterfaces.dll => 0x6b0f58d2 => 46
	i32 1808609942, ; 176: Xamarin.AndroidX.Loader => 0x6bcd3296 => 95
	i32 1809966115, ; 177: nb/Microsoft.Maui.Controls.resources => 0x6be1e423 => 18
	i32 1813058853, ; 178: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 106
	i32 1813201214, ; 179: Xamarin.Google.Android.Material => 0x6c13413e => 105
	i32 1818569960, ; 180: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 99
	i32 1821794637, ; 181: hu/Microsoft.Maui.Controls.resources => 0x6c96614d => 12
	i32 1824175904, ; 182: System.Text.Encoding.Extensions => 0x6cbab720 => 177
	i32 1824722060, ; 183: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 168
	i32 1828688058, ; 184: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 52
	i32 1842015223, ; 185: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1858542181, ; 186: System.Linq.Expressions => 0x6ec71a65 => 136
	i32 1870277092, ; 187: System.Reflection.Primitives => 0x6f7a29e4 => 160
	i32 1900610850, ; 188: System.Resources.ResourceManager.dll => 0x71490522 => 161
	i32 1910275211, ; 189: System.Collections.NonGeneric.dll => 0x71dc7c8b => 114
	i32 1939592360, ; 190: System.Private.Xml.Linq => 0x739bd4a8 => 156
	i32 1960264639, ; 191: ja/Microsoft.Maui.Controls.resources => 0x74d743bf => 15
	i32 1968388702, ; 192: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 47
	i32 2011961780, ; 193: System.Buffers.dll => 0x77ec19b4 => 111
	i32 2014344398, ; 194: hr/Microsoft.Maui.Controls.resources => 0x781074ce => 11
	i32 2019465201, ; 195: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 93
	i32 2025202353, ; 196: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2043674646, ; 197: it/Microsoft.Maui.Controls.resources => 0x79d00016 => 14
	i32 2045470958, ; 198: System.Private.Xml => 0x79eb68ee => 157
	i32 2055257422, ; 199: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 92
	i32 2070888862, ; 200: System.Diagnostics.TraceSource => 0x7b6f419e => 127
	i32 2079903147, ; 201: System.Runtime.dll => 0x7bf8cdab => 170
	i32 2090495875, ; 202: SQLitePCLRaw.provider.dynamic_cdecl => 0x7c9a6f83 => 75
	i32 2090596640, ; 203: System.Numerics.Vectors => 0x7c9bf920 => 153
	i32 2103459038, ; 204: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 76
	i32 2127167465, ; 205: System.Console => 0x7ec9ffe9 => 121
	i32 2142473426, ; 206: System.Collections.Specialized => 0x7fb38cd2 => 115
	i32 2150663486, ; 207: ko/Microsoft.Maui.Controls.resources => 0x8030853e => 16
	i32 2159891885, ; 208: Microsoft.Maui => 0x80bd55ad => 58
	i32 2165051842, ; 209: ro/Microsoft.Maui.Controls.resources => 0x810c11c2 => 23
	i32 2181898931, ; 210: Microsoft.Extensions.Options.dll => 0x820d22b3 => 53
	i32 2192057212, ; 211: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 52
	i32 2193016926, ; 212: System.ObjectModel.dll => 0x82b6c85e => 154
	i32 2201107256, ; 213: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 107
	i32 2201231467, ; 214: System.Net.Http => 0x8334206b => 140
	i32 2216717168, ; 215: Firebase.Auth.dll => 0x84206b70 => 41
	i32 2222056684, ; 216: System.Threading.Tasks.Parallel => 0x8471e4ec => 181
	i32 2266799131, ; 217: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 48
	i32 2270573516, ; 218: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 219: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 100
	i32 2289298199, ; 220: th/Microsoft.Maui.Controls.resources => 0x8873eb17 => 27
	i32 2295906218, ; 221: System.Net.Sockets => 0x88d8bfaa => 148
	i32 2298471582, ; 222: System.Net.Mail => 0x88ffe49e => 141
	i32 2305521784, ; 223: System.Private.CoreLib.dll => 0x896b7878 => 192
	i32 2320631194, ; 224: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 181
	i32 2340441535, ; 225: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 164
	i32 2353062107, ; 226: System.Net.Primitives => 0x8c40e0db => 144
	i32 2368005991, ; 227: System.Xml.ReaderWriter.dll => 0x8d24e767 => 187
	i32 2369760409, ; 228: tr/Microsoft.Maui.Controls.resources => 0x8d3fac99 => 28
	i32 2371007202, ; 229: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 47
	i32 2383496789, ; 230: System.Security.Principal.Windows.dll => 0x8e114655 => 175
	i32 2401565422, ; 231: System.Web.HttpUtility => 0x8f24faee => 185
	i32 2421992093, ; 232: nl/Microsoft.Maui.Controls.resources => 0x905caa9d => 19
	i32 2435356389, ; 233: System.Console.dll => 0x912896e5 => 121
	i32 2458678730, ; 234: System.Net.Sockets.dll => 0x928c75ca => 148
	i32 2465273461, ; 235: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 71
	i32 2471841756, ; 236: netstandard.dll => 0x93554fdc => 191
	i32 2475788418, ; 237: Java.Interop.dll => 0x93918882 => 193
	i32 2480646305, ; 238: Microsoft.Maui.Controls => 0x93dba8a1 => 56
	i32 2483903535, ; 239: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 117
	i32 2484371297, ; 240: System.Net.ServicePoint => 0x94147f61 => 147
	i32 2520433370, ; 241: sk/Microsoft.Maui.Controls.resources => 0x963ac2da => 25
	i32 2538310050, ; 242: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 159
	i32 2562349572, ; 243: Microsoft.CSharp => 0x98ba5a04 => 109
	i32 2585220780, ; 244: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 177
	i32 2605712449, ; 245: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 107
	i32 2617129537, ; 246: System.Private.Xml.dll => 0x9bfe3a41 => 157
	i32 2620871830, ; 247: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 87
	i32 2629843544, ; 248: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 132
	i32 2664396074, ; 249: System.Xml.XDocument.dll => 0x9ecf752a => 188
	i32 2665622720, ; 250: System.Drawing.Primitives => 0x9ee22cc0 => 128
	i32 2676780864, ; 251: System.Data.Common.dll => 0x9f8c6f40 => 122
	i32 2715334215, ; 252: System.Threading.Tasks.dll => 0xa1d8b647 => 182
	i32 2717744543, ; 253: System.Security.Claims => 0xa1fd7d9f => 171
	i32 2724373263, ; 254: System.Runtime.Numerics.dll => 0xa262a30f => 167
	i32 2732626843, ; 255: Xamarin.AndroidX.Activity => 0xa2e0939b => 80
	i32 2735172069, ; 256: System.Threading.Channels => 0xa30769e5 => 179
	i32 2737747696, ; 257: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 82
	i32 2754540824, ; 258: SQLitePCLRaw.nativelibrary.dll => 0xa42ef518 => 72
	i32 2758225723, ; 259: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 57
	i32 2764765095, ; 260: Microsoft.Maui.dll => 0xa4caf7a7 => 58
	i32 2765824710, ; 261: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 176
	i32 2778768386, ; 262: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 103
	i32 2801831435, ; 263: Microsoft.Maui.Graphics => 0xa7008e0b => 60
	i32 2802068195, ; 264: uk/Microsoft.Maui.Controls.resources => 0xa7042ae3 => 29
	i32 2806116107, ; 265: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 266: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 85
	i32 2831556043, ; 267: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2853208004, ; 268: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 103
	i32 2857259519, ; 269: el/Microsoft.Maui.Controls.resources => 0xaa4e51ff => 5
	i32 2861189240, ; 270: Microsoft.Maui.Essentials => 0xaa8a4878 => 59
	i32 2868488919, ; 271: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 37
	i32 2883495834, ; 272: ru/Microsoft.Maui.Controls.resources => 0xabdea79a => 24
	i32 2905242038, ; 273: mscorlib.dll => 0xad2a79b6 => 190
	i32 2909740682, ; 274: System.Private.CoreLib => 0xad6f1e8a => 192
	i32 2916838712, ; 275: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 104
	i32 2919462931, ; 276: System.Numerics.Vectors.dll => 0xae037813 => 153
	i32 2959614098, ; 277: System.ComponentModel.dll => 0xb0682092 => 120
	i32 2968338931, ; 278: System.Security.Principal.Windows => 0xb0ed41f3 => 175
	i32 2972252294, ; 279: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 172
	i32 2978675010, ; 280: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 89
	i32 3038032645, ; 281: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 35
	i32 3057625584, ; 282: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 96
	i32 3059408633, ; 283: Mono.Android.Runtime => 0xb65adef9 => 194
	i32 3059793426, ; 284: System.ComponentModel.Primitives => 0xb660be12 => 118
	i32 3075834255, ; 285: System.Threading.Tasks => 0xb755818f => 182
	i32 3077302341, ; 286: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3099732863, ; 287: System.Security.Claims.dll => 0xb8c22b7f => 171
	i32 3103600923, ; 288: System.Formats.Asn1 => 0xb8fd311b => 130
	i32 3124832203, ; 289: System.Threading.Tasks.Extensions => 0xba4127cb => 180
	i32 3135029042, ; 290: ICSharpCode.SharpZipLib.dll => 0xbadcbf32 => 67
	i32 3159123045, ; 291: System.Reflection.Primitives.dll => 0xbc4c6465 => 160
	i32 3178803400, ; 292: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 97
	i32 3178908327, ; 293: SixLabors.Fonts.dll => 0xbd7a4aa7 => 68
	i32 3220365878, ; 294: System.Threading => 0xbff2e236 => 184
	i32 3258312781, ; 295: Xamarin.AndroidX.CardView => 0xc235e84d => 83
	i32 3265493905, ; 296: System.Linq.Queryable.dll => 0xc2a37b91 => 137
	i32 3265893370, ; 297: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 180
	i32 3284441313, ; 298: SixLabors.ImageSharp => 0xc3c498e1 => 69
	i32 3286872994, ; 299: SQLite-net.dll => 0xc3e9b3a2 => 70
	i32 3316684772, ; 300: System.Net.Requests.dll => 0xc5b097e4 => 145
	i32 3317135071, ; 301: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 88
	i32 3322403133, ; 302: Firebase.dll => 0xc607d93d => 42
	i32 3346324047, ; 303: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 98
	i32 3360279109, ; 304: SQLitePCLRaw.core => 0xc849ca45 => 73
	i32 3362522851, ; 305: Xamarin.AndroidX.Core => 0xc86c06e3 => 86
	i32 3366347497, ; 306: Java.Interop => 0xc8a662e9 => 193
	i32 3374999561, ; 307: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 100
	i32 3395150330, ; 308: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 162
	i32 3428513518, ; 309: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 49
	i32 3430777524, ; 310: netstandard => 0xcc7d82b4 => 191
	i32 3452344032, ; 311: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 55
	i32 3463511458, ; 312: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 313: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 119
	i32 3476120550, ; 314: Mono.Android => 0xcf3163e6 => 195
	i32 3479583265, ; 315: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3509114376, ; 316: System.Xml.Linq => 0xd128d608 => 186
	i32 3542658132, ; 317: vi/Microsoft.Maui.Controls.resources => 0xd328ac54 => 30
	i32 3596207933, ; 318: LiteDB.dll => 0xd659c73d => 43
	i32 3596930546, ; 319: de/Microsoft.Maui.Controls.resources => 0xd664cdf2 => 4
	i32 3598340787, ; 320: System.Net.WebSockets.Client => 0xd67a52b3 => 151
	i32 3599988148, ; 321: Select.HtmlToPdf.dll => 0xd69375b4 => 66
	i32 3608519521, ; 322: System.Linq.dll => 0xd715a361 => 138
	i32 3623444314, ; 323: da/Microsoft.Maui.Controls.resources => 0xd7f95f5a => 3
	i32 3624195450, ; 324: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 164
	i32 3629588173, ; 325: LiteDB => 0xd8571ecd => 43
	i32 3641597786, ; 326: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 92
	i32 3643854240, ; 327: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 97
	i32 3647796983, ; 328: pt-BR/Microsoft.Maui.Controls.resources => 0xd96cf6f7 => 21
	i32 3657292374, ; 329: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 48
	i32 3660523487, ; 330: System.Net.NetworkInformation => 0xda2f27df => 143
	i32 3662115805, ; 331: he/Microsoft.Maui.Controls.resources => 0xda4773dd => 9
	i32 3672681054, ; 332: Mono.Android.dll => 0xdae8aa5e => 195
	i32 3686075795, ; 333: ms/Microsoft.Maui.Controls.resources => 0xdbb50d93 => 17
	i32 3689375977, ; 334: System.Drawing.Common => 0xdbe768e9 => 77
	i32 3697841164, ; 335: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3716563718, ; 336: System.Runtime.Intrinsics => 0xdd864306 => 166
	i32 3724971120, ; 337: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 96
	i32 3731644420, ; 338: System.Reactive => 0xde6c6004 => 79
	i32 3732100267, ; 339: System.Net.NameResolution => 0xde7354ab => 142
	i32 3748608112, ; 340: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 124
	i32 3754567612, ; 341: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 76
	i32 3786282454, ; 342: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 84
	i32 3792276235, ; 343: System.Collections.NonGeneric => 0xe2098b0b => 114
	i32 3800979733, ; 344: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 55
	i32 3802395368, ; 345: System.Collections.Specialized.dll => 0xe2a3f2e8 => 115
	i32 3817368567, ; 346: CommunityToolkit.Maui.dll => 0xe3886bf7 => 36
	i32 3822443793, ; 347: DocumentFormat.OpenXml => 0xe3d5dd11 => 39
	i32 3823082795, ; 348: System.Security.Cryptography.dll => 0xe3df9d2b => 174
	i32 3841636137, ; 349: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 50
	i32 3844307129, ; 350: System.Net.Mail.dll => 0xe52378b9 => 141
	i32 3849253459, ; 351: System.Runtime.InteropServices.dll => 0xe56ef253 => 165
	i32 3852754641, ; 352: MigraDocCore.Rendering => 0xe5a45ed1 => 62
	i32 3876362041, ; 353: SQLite-net => 0xe70c9739 => 70
	i32 3881078187, ; 354: Magick.NET-Q16-AnyCPU => 0xe7548dab => 44
	i32 3885497537, ; 355: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 150
	i32 3889960447, ; 356: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 357: System.Collections.Concurrent.dll => 0xe839deed => 112
	i32 3896760992, ; 358: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 86
	i32 3928044579, ; 359: System.Xml.ReaderWriter => 0xea213423 => 187
	i32 3931092270, ; 360: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 99
	i32 3952357212, ; 361: System.IO.Packaging.dll => 0xeb942f5c => 78
	i32 3953953790, ; 362: System.Text.Encoding.CodePages => 0xebac8bfe => 176
	i32 3955647286, ; 363: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 81
	i32 3980434154, ; 364: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 365: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4003436829, ; 366: System.Diagnostics.Process.dll => 0xee9f991d => 125
	i32 4024013275, ; 367: Firebase.Auth => 0xefd991db => 41
	i32 4025784931, ; 368: System.Memory => 0xeff49a63 => 139
	i32 4046471985, ; 369: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 57
	i32 4054681211, ; 370: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 158
	i32 4068434129, ; 371: System.Private.Xml.Linq.dll => 0xf27f60d1 => 156
	i32 4070331268, ; 372: id/Microsoft.Maui.Controls.resources => 0xf29c5384 => 13
	i32 4073602200, ; 373: System.Threading.dll => 0xf2ce3c98 => 184
	i32 4094352644, ; 374: Microsoft.Maui.Essentials.dll => 0xf40add04 => 59
	i32 4099507663, ; 375: System.Drawing.dll => 0xf45985cf => 129
	i32 4100113165, ; 376: System.Private.Uri => 0xf462c30d => 155
	i32 4102112229, ; 377: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4119206479, ; 378: pl/Microsoft.Maui.Controls.resources => 0xf5861a4f => 20
	i32 4125707920, ; 379: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 380: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 49
	i32 4147896353, ; 381: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 158
	i32 4181436372, ; 382: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 169
	i32 4182413190, ; 383: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 94
	i32 4196529839, ; 384: System.Net.WebClient.dll => 0xfa21f6af => 149
	i32 4213026141, ; 385: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 124
	i32 4234116406, ; 386: pt/Microsoft.Maui.Controls.resources => 0xfc5f7d36 => 22
	i32 4260525087, ; 387: System.Buffers => 0xfdf2741f => 111
	i32 4271975918, ; 388: Microsoft.Maui.Controls.dll => 0xfea12dee => 56
	i32 4274623895, ; 389: CommunityToolkit.Mvvm.dll => 0xfec99597 => 38
	i32 4274976490, ; 390: System.Runtime.Numerics => 0xfecef6ea => 167
	i32 4292120959 ; 391: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 94
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [392 x i32] [
	i32 143, ; 0
	i32 142, ; 1
	i32 166, ; 2
	i32 63, ; 3
	i32 152, ; 4
	i32 183, ; 5
	i32 1, ; 6
	i32 173, ; 7
	i32 60, ; 8
	i32 64, ; 9
	i32 31, ; 10
	i32 165, ; 11
	i32 179, ; 12
	i32 67, ; 13
	i32 150, ; 14
	i32 173, ; 15
	i32 84, ; 16
	i32 102, ; 17
	i32 30, ; 18
	i32 31, ; 19
	i32 120, ; 20
	i32 123, ; 21
	i32 109, ; 22
	i32 159, ; 23
	i32 40, ; 24
	i32 2, ; 25
	i32 45, ; 26
	i32 80, ; 27
	i32 68, ; 28
	i32 15, ; 29
	i32 91, ; 30
	i32 74, ; 31
	i32 14, ; 32
	i32 2, ; 33
	i32 135, ; 34
	i32 147, ; 35
	i32 183, ; 36
	i32 139, ; 37
	i32 42, ; 38
	i32 35, ; 39
	i32 34, ; 40
	i32 26, ; 41
	i32 116, ; 42
	i32 90, ; 43
	i32 185, ; 44
	i32 169, ; 45
	i32 190, ; 46
	i32 189, ; 47
	i32 154, ; 48
	i32 13, ; 49
	i32 7, ; 50
	i32 54, ; 51
	i32 10, ; 52
	i32 137, ; 53
	i32 51, ; 54
	i32 134, ; 55
	i32 163, ; 56
	i32 46, ; 57
	i32 21, ; 58
	i32 36, ; 59
	i32 79, ; 60
	i32 172, ; 61
	i32 88, ; 62
	i32 61, ; 63
	i32 112, ; 64
	i32 146, ; 65
	i32 1, ; 66
	i32 186, ; 67
	i32 132, ; 68
	i32 16, ; 69
	i32 4, ; 70
	i32 71, ; 71
	i32 75, ; 72
	i32 145, ; 73
	i32 135, ; 74
	i32 61, ; 75
	i32 133, ; 76
	i32 53, ; 77
	i32 122, ; 78
	i32 77, ; 79
	i32 155, ; 80
	i32 131, ; 81
	i32 0, ; 82
	i32 118, ; 83
	i32 44, ; 84
	i32 28, ; 85
	i32 72, ; 86
	i32 63, ; 87
	i32 91, ; 88
	i32 188, ; 89
	i32 126, ; 90
	i32 116, ; 91
	i32 32, ; 92
	i32 134, ; 93
	i32 6, ; 94
	i32 101, ; 95
	i32 129, ; 96
	i32 50, ; 97
	i32 3, ; 98
	i32 81, ; 99
	i32 128, ; 100
	i32 136, ; 101
	i32 93, ; 102
	i32 119, ; 103
	i32 78, ; 104
	i32 106, ; 105
	i32 65, ; 106
	i32 189, ; 107
	i32 98, ; 108
	i32 7, ; 109
	i32 20, ; 110
	i32 125, ; 111
	i32 38, ; 112
	i32 65, ; 113
	i32 64, ; 114
	i32 18, ; 115
	i32 73, ; 116
	i32 40, ; 117
	i32 89, ; 118
	i32 138, ; 119
	i32 39, ; 120
	i32 66, ; 121
	i32 101, ; 122
	i32 161, ; 123
	i32 85, ; 124
	i32 168, ; 125
	i32 162, ; 126
	i32 130, ; 127
	i32 126, ; 128
	i32 163, ; 129
	i32 146, ; 130
	i32 113, ; 131
	i32 133, ; 132
	i32 82, ; 133
	i32 54, ; 134
	i32 113, ; 135
	i32 131, ; 136
	i32 110, ; 137
	i32 69, ; 138
	i32 10, ; 139
	i32 34, ; 140
	i32 5, ; 141
	i32 178, ; 142
	i32 108, ; 143
	i32 25, ; 144
	i32 8, ; 145
	i32 45, ; 146
	i32 26, ; 147
	i32 33, ; 148
	i32 149, ; 149
	i32 151, ; 150
	i32 95, ; 151
	i32 104, ; 152
	i32 37, ; 153
	i32 87, ; 154
	i32 140, ; 155
	i32 178, ; 156
	i32 117, ; 157
	i32 170, ; 158
	i32 105, ; 159
	i32 144, ; 160
	i32 152, ; 161
	i32 174, ; 162
	i32 62, ; 163
	i32 123, ; 164
	i32 74, ; 165
	i32 108, ; 166
	i32 83, ; 167
	i32 23, ; 168
	i32 110, ; 169
	i32 127, ; 170
	i32 102, ; 171
	i32 51, ; 172
	i32 194, ; 173
	i32 90, ; 174
	i32 46, ; 175
	i32 95, ; 176
	i32 18, ; 177
	i32 106, ; 178
	i32 105, ; 179
	i32 99, ; 180
	i32 12, ; 181
	i32 177, ; 182
	i32 168, ; 183
	i32 52, ; 184
	i32 29, ; 185
	i32 136, ; 186
	i32 160, ; 187
	i32 161, ; 188
	i32 114, ; 189
	i32 156, ; 190
	i32 15, ; 191
	i32 47, ; 192
	i32 111, ; 193
	i32 11, ; 194
	i32 93, ; 195
	i32 0, ; 196
	i32 14, ; 197
	i32 157, ; 198
	i32 92, ; 199
	i32 127, ; 200
	i32 170, ; 201
	i32 75, ; 202
	i32 153, ; 203
	i32 76, ; 204
	i32 121, ; 205
	i32 115, ; 206
	i32 16, ; 207
	i32 58, ; 208
	i32 23, ; 209
	i32 53, ; 210
	i32 52, ; 211
	i32 154, ; 212
	i32 107, ; 213
	i32 140, ; 214
	i32 41, ; 215
	i32 181, ; 216
	i32 48, ; 217
	i32 8, ; 218
	i32 100, ; 219
	i32 27, ; 220
	i32 148, ; 221
	i32 141, ; 222
	i32 192, ; 223
	i32 181, ; 224
	i32 164, ; 225
	i32 144, ; 226
	i32 187, ; 227
	i32 28, ; 228
	i32 47, ; 229
	i32 175, ; 230
	i32 185, ; 231
	i32 19, ; 232
	i32 121, ; 233
	i32 148, ; 234
	i32 71, ; 235
	i32 191, ; 236
	i32 193, ; 237
	i32 56, ; 238
	i32 117, ; 239
	i32 147, ; 240
	i32 25, ; 241
	i32 159, ; 242
	i32 109, ; 243
	i32 177, ; 244
	i32 107, ; 245
	i32 157, ; 246
	i32 87, ; 247
	i32 132, ; 248
	i32 188, ; 249
	i32 128, ; 250
	i32 122, ; 251
	i32 182, ; 252
	i32 171, ; 253
	i32 167, ; 254
	i32 80, ; 255
	i32 179, ; 256
	i32 82, ; 257
	i32 72, ; 258
	i32 57, ; 259
	i32 58, ; 260
	i32 176, ; 261
	i32 103, ; 262
	i32 60, ; 263
	i32 29, ; 264
	i32 6, ; 265
	i32 85, ; 266
	i32 19, ; 267
	i32 103, ; 268
	i32 5, ; 269
	i32 59, ; 270
	i32 37, ; 271
	i32 24, ; 272
	i32 190, ; 273
	i32 192, ; 274
	i32 104, ; 275
	i32 153, ; 276
	i32 120, ; 277
	i32 175, ; 278
	i32 172, ; 279
	i32 89, ; 280
	i32 35, ; 281
	i32 96, ; 282
	i32 194, ; 283
	i32 118, ; 284
	i32 182, ; 285
	i32 12, ; 286
	i32 171, ; 287
	i32 130, ; 288
	i32 180, ; 289
	i32 67, ; 290
	i32 160, ; 291
	i32 97, ; 292
	i32 68, ; 293
	i32 184, ; 294
	i32 83, ; 295
	i32 137, ; 296
	i32 180, ; 297
	i32 69, ; 298
	i32 70, ; 299
	i32 145, ; 300
	i32 88, ; 301
	i32 42, ; 302
	i32 98, ; 303
	i32 73, ; 304
	i32 86, ; 305
	i32 193, ; 306
	i32 100, ; 307
	i32 162, ; 308
	i32 49, ; 309
	i32 191, ; 310
	i32 55, ; 311
	i32 11, ; 312
	i32 119, ; 313
	i32 195, ; 314
	i32 24, ; 315
	i32 186, ; 316
	i32 30, ; 317
	i32 43, ; 318
	i32 4, ; 319
	i32 151, ; 320
	i32 66, ; 321
	i32 138, ; 322
	i32 3, ; 323
	i32 164, ; 324
	i32 43, ; 325
	i32 92, ; 326
	i32 97, ; 327
	i32 21, ; 328
	i32 48, ; 329
	i32 143, ; 330
	i32 9, ; 331
	i32 195, ; 332
	i32 17, ; 333
	i32 77, ; 334
	i32 33, ; 335
	i32 166, ; 336
	i32 96, ; 337
	i32 79, ; 338
	i32 142, ; 339
	i32 124, ; 340
	i32 76, ; 341
	i32 84, ; 342
	i32 114, ; 343
	i32 55, ; 344
	i32 115, ; 345
	i32 36, ; 346
	i32 39, ; 347
	i32 174, ; 348
	i32 50, ; 349
	i32 141, ; 350
	i32 165, ; 351
	i32 62, ; 352
	i32 70, ; 353
	i32 44, ; 354
	i32 150, ; 355
	i32 32, ; 356
	i32 112, ; 357
	i32 86, ; 358
	i32 187, ; 359
	i32 99, ; 360
	i32 78, ; 361
	i32 176, ; 362
	i32 81, ; 363
	i32 27, ; 364
	i32 9, ; 365
	i32 125, ; 366
	i32 41, ; 367
	i32 139, ; 368
	i32 57, ; 369
	i32 158, ; 370
	i32 156, ; 371
	i32 13, ; 372
	i32 184, ; 373
	i32 59, ; 374
	i32 129, ; 375
	i32 155, ; 376
	i32 22, ; 377
	i32 20, ; 378
	i32 17, ; 379
	i32 49, ; 380
	i32 158, ; 381
	i32 169, ; 382
	i32 94, ; 383
	i32 149, ; 384
	i32 124, ; 385
	i32 22, ; 386
	i32 111, ; 387
	i32 56, ; 388
	i32 38, ; 389
	i32 167, ; 390
	i32 94 ; 391
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ af27162bee43b7fecdca59b4f67aa8c175cbc875"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
