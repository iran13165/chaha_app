; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [196 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [392 x i64] [
	i64 98382396393917666, ; 0: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 54
	i64 120698629574877762, ; 1: Mono.Android => 0x1accec39cafe242 => 195
	i64 131669012237370309, ; 2: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 59
	i64 196720943101637631, ; 3: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 136
	i64 197751585713159992, ; 4: ICSharpCode.SharpZipLib.dll => 0x2be8e04fc33ff38 => 67
	i64 210515253464952879, ; 5: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 84
	i64 232391251801502327, ; 6: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 101
	i64 464346026994987652, ; 7: System.Reactive.dll => 0x671b04057e67284 => 79
	i64 545109961164950392, ; 8: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 7
	i64 560278790331054453, ; 9: System.Reflection.Primitives => 0x7c6829760de3975 => 160
	i64 702024105029695270, ; 10: System.Drawing.Common => 0x9be17343c0e7726 => 77
	i64 710500338161506772, ; 11: SixLabors.Fonts.dll => 0x9dc344b0ce959d4 => 68
	i64 750875890346172408, ; 12: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 183
	i64 799765834175365804, ; 13: System.ComponentModel.dll => 0xb1956c9f18442ac => 120
	i64 849051935479314978, ; 14: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 10
	i64 870603111519317375, ; 15: SQLitePCLRaw.lib.e_sqlite3.android => 0xc1500ead2756d7f => 74
	i64 872800313462103108, ; 16: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 89
	i64 1010599046655515943, ; 17: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 160
	i64 1055774368762298424, ; 18: ar/Microsoft.Maui.Controls.resources => 0xea6dd31d50a0038 => 0
	i64 1120440138749646132, ; 19: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 105
	i64 1121665720830085036, ; 20: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 18
	i64 1268860745194512059, ; 21: System.Drawing.dll => 0x119be62002c19ebb => 129
	i64 1301485588176585670, ; 22: SQLitePCLRaw.core => 0x120fce3f338e43c6 => 73
	i64 1369545283391376210, ; 23: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 97
	i64 1476839205573959279, ; 24: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 144
	i64 1486715745332614827, ; 25: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 56
	i64 1513467482682125403, ; 26: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 194
	i64 1518315023656898250, ; 27: SQLitePCLRaw.provider.e_sqlite3 => 0x151223783a354eca => 76
	i64 1537168428375924959, ; 28: System.Threading.Thread.dll => 0x15551e8a954ae0df => 183
	i64 1556147632182429976, ; 29: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 16
	i64 1599725984789764023, ; 30: Magick.NET.Core => 0x16335e4eb55b17b7 => 45
	i64 1624659445732251991, ; 31: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 82
	i64 1628611045998245443, ; 32: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 94
	i64 1643226597988041431, ; 33: pl/Microsoft.Maui.Controls.resources => 0x16cde9e27a8d02d7 => 20
	i64 1731380447121279447, ; 34: Newtonsoft.Json => 0x18071957e9b889d7 => 63
	i64 1735388228521408345, ; 35: System.Net.Mail.dll => 0x181556663c69b759 => 141
	i64 1743969030606105336, ; 36: System.Memory.dll => 0x1833d297e88f2af8 => 139
	i64 1767386781656293639, ; 37: System.Private.Uri.dll => 0x188704e9f5582107 => 155
	i64 1795316252682057001, ; 38: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 81
	i64 1825687700144851180, ; 39: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 164
	i64 1836611346387731153, ; 40: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 101
	i64 1847446322536158010, ; 41: DocumentFormat.OpenXml.Framework.dll => 0x19a372a4645e933a => 40
	i64 1865037103900624886, ; 42: Microsoft.Bcl.AsyncInterfaces => 0x19e1f15d56eb87f6 => 46
	i64 1875417405349196092, ; 43: System.Drawing.Primitives => 0x1a06d2319b6c713c => 128
	i64 1920760634179481754, ; 44: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 57
	i64 1930726298510463061, ; 45: CommunityToolkit.Mvvm.dll => 0x1acb5156cd389055 => 38
	i64 1959996714666907089, ; 46: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 28
	i64 1972385128188460614, ; 47: System.Security.Cryptography.Algorithms => 0x1b5f51d2edefbe46 => 172
	i64 1981742497975770890, ; 48: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 93
	i64 1983698669889758782, ; 49: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 2
	i64 2019660174692588140, ; 50: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 20
	i64 2040001226662520565, ; 51: System.Threading.Tasks.Extensions.dll => 0x1c4f8a4ea894a6f5 => 180
	i64 2102659300918482391, ; 52: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 128
	i64 2133195048986300728, ; 53: Newtonsoft.Json.dll => 0x1d9aa1984b735138 => 63
	i64 2145898162032646099, ; 54: ko/Microsoft.Maui.Controls.resources => 0x1dc7c302481e97d3 => 16
	i64 2207662933261301575, ; 55: DocumentFormat.OpenXml => 0x1ea331bdb8d63747 => 39
	i64 2262844636196693701, ; 56: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 89
	i64 2287834202362508563, ; 57: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 112
	i64 2302323944321350744, ; 58: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 24
	i64 2315304989185124968, ; 59: System.IO.FileSystem.dll => 0x20219d9ee311aa68 => 134
	i64 2329709569556905518, ; 60: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 92
	i64 2337758774805907496, ; 61: System.Runtime.CompilerServices.Unsafe => 0x207163383edbc828 => 162
	i64 2405413894731521496, ; 62: da/Microsoft.Maui.Controls.resources => 0x2161bf315d42ddd8 => 3
	i64 2470498323731680442, ; 63: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 85
	i64 2492380397191429704, ; 64: cs/Microsoft.Maui.Controls.resources => 0x2296b6c41bbdfe48 => 2
	i64 2497223385847772520, ; 65: System.Runtime => 0x22a7eb7046413568 => 170
	i64 2547086958574651984, ; 66: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 80
	i64 2624866290265602282, ; 67: mscorlib.dll => 0x246d65fbde2db8ea => 190
	i64 2632269733008246987, ; 68: System.Net.NameResolution => 0x2487b36034f808cb => 142
	i64 2656907746661064104, ; 69: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 49
	i64 2706075432581334785, ; 70: System.Net.WebSockets => 0x258de944be6c0701 => 152
	i64 2709927378921792331, ; 71: MigraDocCore.Rendering.dll => 0x259b9897e3bd234b => 62
	i64 2783046991838674048, ; 72: System.Runtime.CompilerServices.Unsafe.dll => 0x269f5e7e6dc37c80 => 162
	i64 3017704767998173186, ; 73: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 105
	i64 3107556380337382748, ; 74: pt/Microsoft.Maui.Controls.resources => 0x2b2042103982255c => 22
	i64 3202009568827554833, ; 75: th/Microsoft.Maui.Controls.resources => 0x2c6fd2bce55e3c11 => 27
	i64 3289520064315143713, ; 76: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 91
	i64 3311221304742556517, ; 77: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 153
	i64 3325875462027654285, ; 78: System.Runtime.Numerics => 0x2e27e21c8958b48d => 167
	i64 3328853167529574890, ; 79: System.Net.Sockets.dll => 0x2e327651a008c1ea => 148
	i64 3344514922410554693, ; 80: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 107
	i64 3429672777697402584, ; 81: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 59
	i64 3494946837667399002, ; 82: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 47
	i64 3522470458906976663, ; 83: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 102
	i64 3551103847008531295, ; 84: System.Private.CoreLib.dll => 0x31480e226177735f => 192
	i64 3571415421602489686, ; 85: System.Runtime.dll => 0x319037675df7e556 => 170
	i64 3638003163729360188, ; 86: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 48
	i64 3647754201059316852, ; 87: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 187
	i64 3655542548057982301, ; 88: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 47
	i64 3716579019761409177, ; 89: netstandard.dll => 0x3393f0ed5c8c5c99 => 191
	i64 3727469159507183293, ; 90: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 100
	i64 3869221888984012293, ; 91: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 51
	i64 3869649043256705283, ; 92: System.Diagnostics.Tools => 0x35b3c14d74bf0103 => 126
	i64 3890352374528606784, ; 93: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 57
	i64 3933965368022646939, ; 94: System.Net.Requests => 0x369840a8bfadc09b => 145
	i64 3966267475168208030, ; 95: System.Memory => 0x370b03412596249e => 139
	i64 4009997192427317104, ; 96: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 169
	i64 4073500526318903918, ; 97: System.Private.Xml.dll => 0x3887fb25779ae26e => 157
	i64 4073631083018132676, ; 98: Microsoft.Maui.Controls.Compatibility.dll => 0x388871e311491cc4 => 55
	i64 4077399594775053222, ; 99: PdfSharpCore.Charting.dll => 0x3895d55415e383a6 => 65
	i64 4154383907710350974, ; 100: System.ComponentModel => 0x39a7562737acb67e => 120
	i64 4168469861834746866, ; 101: System.Security.Claims.dll => 0x39d96140fb94ebf2 => 171
	i64 4187479170553454871, ; 102: System.Linq.Expressions => 0x3a1cea1e912fa117 => 136
	i64 4205801962323029395, ; 103: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 119
	i64 4337444564132831293, ; 104: SQLitePCLRaw.batteries_v2.dll => 0x3c31b2d9ae16203d => 71
	i64 4356591372459378815, ; 105: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 30
	i64 4373617458794931033, ; 106: System.IO.Pipes.dll => 0x3cb235e806eb2359 => 135
	i64 4477672992252076438, ; 107: System.Web.HttpUtility.dll => 0x3e23e3dcdb8ba196 => 185
	i64 4679594760078841447, ; 108: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 0
	i64 4794310189461587505, ; 109: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 80
	i64 4795410492532947900, ; 110: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 102
	i64 4809057822547766521, ; 111: System.Drawing => 0x42bd349c3145ecf9 => 129
	i64 4814660307502931973, ; 112: System.Net.NameResolution.dll => 0x42d11c0a5ee2a005 => 142
	i64 4835744211636393215, ; 113: fi/Microsoft.Maui.Controls.resources => 0x431c03bd573d14ff => 7
	i64 5081566143765835342, ; 114: System.Resources.ResourceManager.dll => 0x4685597c05d06e4e => 161
	i64 5099468265966638712, ; 115: System.Resources.ResourceManager => 0x46c4f35ea8519678 => 161
	i64 5103417709280584325, ; 116: System.Collections.Specialized => 0x46d2fb5e161b6285 => 115
	i64 5182934613077526976, ; 117: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 115
	i64 5278787618751394462, ; 118: System.Net.WebClient.dll => 0x4942055efc68329e => 149
	i64 5423376490970181369, ; 119: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 164
	i64 5446034149219586269, ; 120: System.Diagnostics.Debug => 0x4b94333452e150dd => 123
	i64 5570799893513421663, ; 121: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 131
	i64 5573260873512690141, ; 122: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 174
	i64 5624375662354994915, ; 123: SixLabors.ImageSharp.dll => 0x4e0dcbdd9e0596e3 => 69
	i64 5626675072969102346, ; 124: SQLitePCLRaw.nativelibrary.dll => 0x4e15f72adede540a => 72
	i64 5650097808083101034, ; 125: System.Security.Cryptography.Algorithms.dll => 0x4e692e055d01a56a => 172
	i64 5692067934154308417, ; 126: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 104
	i64 5939174725034091446, ; 127: pt-BR/Microsoft.Maui.Controls.resources => 0x526c2ff200a2a3b6 => 21
	i64 5979151488806146654, ; 128: System.Formats.Asn1 => 0x52fa3699a489d25e => 130
	i64 5984759512290286505, ; 129: System.Security.Cryptography.Primitives => 0x530e23115c33dba9 => 173
	i64 6068057819846744445, ; 130: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 23
	i64 6183170893902868313, ; 131: SQLitePCLRaw.batteries_v2 => 0x55cf092b0c9d6f59 => 71
	i64 6218967553231149354, ; 132: Firebase.Auth.dll => 0x564e360a4805d92a => 41
	i64 6284145129771520194, ; 133: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 158
	i64 6357457916754632952, ; 134: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 35
	i64 6401687960814735282, ; 135: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 92
	i64 6548213210057960872, ; 136: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 88
	i64 6560151584539558821, ; 137: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 53
	i64 6617685658146568858, ; 138: System.Text.Encoding.CodePages => 0x5bd6be0b4905fa9a => 176
	i64 6734140735192831707, ; 139: uk/Microsoft.Maui.Controls.resources => 0x5d747951d4a816db => 29
	i64 6777482997383978746, ; 140: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 22
	i64 6786606130239981554, ; 141: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 127
	i64 6814185388980153342, ; 142: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 188
	i64 6876862101832370452, ; 143: System.Xml.Linq => 0x5f6f85a57d108914 => 186
	i64 6894844156784520562, ; 144: System.Numerics.Vectors => 0x5faf683aead1ad72 => 153
	i64 7060896174307865760, ; 145: System.Threading.Tasks.Parallel.dll => 0x61fd57a90988f4a0 => 181
	i64 7083547580668757502, ; 146: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 156
	i64 7112547816752919026, ; 147: System.IO.FileSystem => 0x62b4d88e3189b1f2 => 134
	i64 7198443421380600601, ; 148: SQLitePCLRaw.provider.dynamic_cdecl.dll => 0x63e602271b236319 => 75
	i64 7220009545223068405, ; 149: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 26
	i64 7270811800166795866, ; 150: System.Linq => 0x64e71ccf51a90a5a => 138
	i64 7316205155833392065, ; 151: Microsoft.Win32.Primitives => 0x658861d38954abc1 => 110
	i64 7377312882064240630, ; 152: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 119
	i64 7413500132969298708, ; 153: MigraDocCore.DocumentObjectModel.dll => 0x66e20b17aff23b14 => 61
	i64 7439799228237803094, ; 154: it/Microsoft.Maui.Controls.resources => 0x673f79faf756ee56 => 14
	i64 7488575175965059935, ; 155: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 186
	i64 7489048572193775167, ; 156: System.ObjectModel => 0x67ee71ff6b419e3f => 154
	i64 7592577537120840276, ; 157: System.Diagnostics.Process => 0x695e410af5b2aa54 => 125
	i64 7602111570124318452, ; 158: System.Reactive => 0x698020320025a6f4 => 79
	i64 7637303409920963731, ; 159: System.IO.Compression.ZipFile.dll => 0x69fd26fcb637f493 => 132
	i64 7642002156153824904, ; 160: ro/Microsoft.Maui.Controls.resources => 0x6a0dd878d2516688 => 23
	i64 7654504624184590948, ; 161: System.Net.Http => 0x6a3a4366801b8264 => 140
	i64 7694700312542370399, ; 162: System.Net.Mail => 0x6ac9112a7e2cda5f => 141
	i64 7708790323521193081, ; 163: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 17
	i64 7714652370974252055, ; 164: System.Private.CoreLib => 0x6b0ff375198b9c17 => 192
	i64 7735176074855944702, ; 165: Microsoft.CSharp => 0x6b58dda848e391fe => 109
	i64 7735352534559001595, ; 166: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 106
	i64 7836164640616011524, ; 167: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 82
	i64 7940649815337427946, ; 168: chaha_app => 0x6e32daef88f563ea => 108
	i64 8031450141206250471, ; 169: System.Runtime.Intrinsics.dll => 0x6f757159d9dc03e7 => 166
	i64 8064050204834738623, ; 170: System.Collections.dll => 0x6fe942efa61731bf => 116
	i64 8083354569033831015, ; 171: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 91
	i64 8087206902342787202, ; 172: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 124
	i64 8167236081217502503, ; 173: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 193
	i64 8185542183669246576, ; 174: System.Collections => 0x7198e33f4794aa70 => 116
	i64 8246048515196606205, ; 175: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 60
	i64 8264926008854159966, ; 176: System.Diagnostics.Process.dll => 0x72b2ea6a64a3a25e => 125
	i64 8290740647658429042, ; 177: System.Runtime.Extensions => 0x730ea0b15c929a72 => 163
	i64 8329843434826495442, ; 178: ICSharpCode.SharpZipLib => 0x73998c787773f5d2 => 67
	i64 8368701292315763008, ; 179: System.Security.Cryptography => 0x7423997c6fd56140 => 174
	i64 8400357532724379117, ; 180: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 99
	i64 8410671156615598628, ; 181: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 159
	i64 8515752553183989521, ; 182: el/Microsoft.Maui.Controls.resources => 0x762e07d427a84f11 => 5
	i64 8518412311883997971, ; 183: System.Collections.Immutable => 0x76377add7c28e313 => 113
	i64 8557640666902467377, ; 184: tr/Microsoft.Maui.Controls.resources => 0x76c2d8d8a2289331 => 28
	i64 8563666267364444763, ; 185: System.Private.Uri => 0x76d841191140ca5b => 155
	i64 8573305974629105867, ; 186: sk/Microsoft.Maui.Controls.resources => 0x76fa805c508080cb => 25
	i64 8599632406834268464, ; 187: CommunityToolkit.Maui => 0x7758081c784b4930 => 36
	i64 8614108721271900878, ; 188: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 21
	i64 8626175481042262068, ; 189: Java.Interop => 0x77b654e585b55834 => 193
	i64 8638972117149407195, ; 190: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 109
	i64 8639588376636138208, ; 191: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 98
	i64 8649481918441731987, ; 192: PdfSharpCore => 0x780921fa57e23793 => 64
	i64 8702320156596882678, ; 193: Firebase.dll => 0x78c4da1357adccf6 => 42
	i64 8725526185868997716, ; 194: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 124
	i64 8906941675023136603, ; 195: he/Microsoft.Maui.Controls.resources => 0x7b9bd0432ee0775b => 9
	i64 8941376889969657626, ; 196: System.Xml.XDocument => 0x7c1626e87187471a => 188
	i64 9057635389615298436, ; 197: LiteDB => 0x7db32f65bf06d784 => 43
	i64 9296667808972889535, ; 198: LiteDB.dll => 0x8104661dcca35dbf => 43
	i64 9312692141327339315, ; 199: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 104
	i64 9324707631942237306, ; 200: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 81
	i64 9342122023452561803, ; 201: SixLabors.ImageSharp => 0x81a5e27bd03e518b => 69
	i64 9659729154652888475, ; 202: System.Text.RegularExpressions => 0x860e407c9991dd9b => 178
	i64 9678050649315576968, ; 203: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 85
	i64 9702891218465930390, ; 204: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 114
	i64 9787812591399684171, ; 205: Magick.NET.Core.dll => 0x87d54bb19e79484b => 45
	i64 9808709177481450983, ; 206: Mono.Android.dll => 0x881f890734e555e7 => 195
	i64 9884103019517044980, ; 207: hi/Microsoft.Maui.Controls.resources => 0x892b6353f9ade8f4 => 10
	i64 9933555792566666578, ; 208: System.Linq.Queryable.dll => 0x89db145cf475c552 => 137
	i64 9956195530459977388, ; 209: Microsoft.Maui => 0x8a2b8315b36616ac => 58
	i64 9991543690424095600, ; 210: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 6
	i64 10038780035334861115, ; 211: System.Net.Http.dll => 0x8b50e941206af13b => 140
	i64 10051358222726253779, ; 212: System.Private.Xml => 0x8b7d990c97ccccd3 => 157
	i64 10078727084704864206, ; 213: System.Net.WebSockets.Client => 0x8bded4e257f117ce => 151
	i64 10092835686693276772, ; 214: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 56
	i64 10105485790837105934, ; 215: System.Threading.Tasks.Parallel => 0x8c3de5c91d9a650e => 181
	i64 10144742755892837524, ; 216: Firebase => 0x8cc95dc98eb5bc94 => 42
	i64 10226489408795347955, ; 217: sv/Microsoft.Maui.Controls.resources => 0x8debc9ef5e8a8bf3 => 26
	i64 10229024438826829339, ; 218: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 88
	i64 10236703004850800690, ; 219: System.Net.ServicePoint.dll => 0x8e101325834e4832 => 147
	i64 10245369515835430794, ; 220: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 159
	i64 10364469296367737616, ; 221: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 158
	i64 10406448008575299332, ; 222: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 107
	i64 10430153318873392755, ; 223: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 86
	i64 10447083246144586668, ; 224: Microsoft.Bcl.AsyncInterfaces.dll => 0x90fb7edc816203ac => 46
	i64 10650478070646097812, ; 225: System.IO.Packaging => 0x93ce196068f2c794 => 78
	i64 10670374202010151210, ; 226: Microsoft.Win32.Primitives.dll => 0x9414c8cd7b4ea92a => 110
	i64 10714184849103829812, ; 227: System.Runtime.Extensions.dll => 0x94b06e5aa4b4bb34 => 163
	i64 10785150219063592792, ; 228: System.Net.Primitives => 0x95ac8cfb68830758 => 144
	i64 10790900590170376411, ; 229: chaha_app.dll => 0x95c0faea03a888db => 108
	i64 10822644899632537592, ; 230: System.Linq.Queryable => 0x9631c23204ca5ff8 => 137
	i64 10880838204485145808, ; 231: CommunityToolkit.Maui.dll => 0x970080b2a4d614d0 => 36
	i64 10984274332520666918, ; 232: zh-Hant/Microsoft.Maui.Controls.resources => 0x986ffb4ee955d726 => 33
	i64 11002576679268595294, ; 233: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 52
	i64 11009005086950030778, ; 234: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 58
	i64 11128133081269842136, ; 235: vi/Microsoft.Maui.Controls.resources => 0x9a6f1213fa5cb0d8 => 30
	i64 11150130305267896488, ; 236: zh-Hans/Microsoft.Maui.Controls.resources => 0x9abd386fcccf90a8 => 32
	i64 11162124722117608902, ; 237: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 103
	i64 11226290749488709958, ; 238: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 53
	i64 11242304880222449531, ; 239: Select.HtmlToPdf => 0x9c04b0b96a4caf7b => 66
	i64 11340910727871153756, ; 240: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 87
	i64 11485890710487134646, ; 241: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 165
	i64 11529969570048099689, ; 242: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 103
	i64 11530571088791430846, ; 243: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 51
	i64 11597940890313164233, ; 244: netstandard => 0xa0f429ca8d1805c9 => 191
	i64 11705530742807338875, ; 245: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 9
	i64 11739066727115742305, ; 246: SQLite-net.dll => 0xa2e98afdf8575c61 => 70
	i64 11743665907891708234, ; 247: System.Threading.Tasks => 0xa2f9e1ec30c0214a => 182
	i64 11806260347154423189, ; 248: SQLite-net => 0xa3d8433bc5eb5d95 => 70
	i64 11847327600875963004, ; 249: Magick.NET-Q16-AnyCPU.dll => 0xa46a29aee3e4827c => 44
	i64 11888774080858266727, ; 250: hu/Microsoft.Maui.Controls.resources => 0xa4fd6909806d9c67 => 12
	i64 12040886584167504988, ; 251: System.Net.ServicePoint => 0xa719d28d8e121c5c => 147
	i64 12102847907131387746, ; 252: System.Buffers => 0xa7f5f40c43256f62 => 111
	i64 12124060477258521817, ; 253: id/Microsoft.Maui.Controls.resources => 0xa84150c49e58dcd9 => 13
	i64 12201331334810686224, ; 254: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 169
	i64 12269460666702402136, ; 255: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 113
	i64 12279246230491828964, ; 256: SQLitePCLRaw.provider.e_sqlite3.dll => 0xaa68a5636e0512e4 => 76
	i64 12341818387765915815, ; 257: CommunityToolkit.Maui.Core.dll => 0xab46f26f152bf0a7 => 37
	i64 12381390062535625893, ; 258: MigraDocCore.DocumentObjectModel => 0xabd388a996fccca5 => 61
	i64 12451044538927396471, ; 259: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 90
	i64 12466513435562512481, ; 260: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 95
	i64 12475113361194491050, ; 261: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 35
	i64 12517810545449516888, ; 262: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 127
	i64 12528155905152483962, ; 263: Firebase.Auth => 0xaddcf36b3153827a => 41
	i64 12533156002265635263, ; 264: ru/Microsoft.Maui.Controls.resources => 0xadeeb6fb059919bf => 24
	i64 12538491095302438457, ; 265: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 83
	i64 12550732019250633519, ; 266: System.IO.Compression => 0xae2d28465e8e1b2f => 133
	i64 12681088699309157496, ; 267: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 14
	i64 12700543734426720211, ; 268: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 84
	i64 12708922737231849740, ; 269: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 177
	i64 12823819093633476069, ; 270: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 27
	i64 12835242264250840079, ; 271: System.IO.Pipes => 0xb21ff0d5d6c0740f => 135
	i64 12843321153144804894, ; 272: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 54
	i64 12859557719246324186, ; 273: System.Net.WebHeaderCollection.dll => 0xb276539ce04f41da => 150
	i64 12960470355117467131, ; 274: de/PdfSharpCore.resources => 0xb3dcd71ed6c1e5fb => 34
	i64 12963446364377008305, ; 275: System.Drawing.Common.dll => 0xb3e769c8fd8548b1 => 77
	i64 13068258254871114833, ; 276: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 168
	i64 13109727801987935684, ; 277: SixLabors.Fonts => 0xb5ef1bfa438dadc4 => 68
	i64 13221551921002590604, ; 278: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 1
	i64 13222659110913276082, ; 279: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 15
	i64 13239674268801700939, ; 280: ca/Microsoft.Maui.Controls.resources => 0xb7bcc599c5ce144b => 1
	i64 13343850469010654401, ; 281: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 194
	i64 13378179804543437641, ; 282: Select.HtmlToPdf.dll => 0xb9a8d7a6cf1dcb49 => 66
	i64 13431476299110033919, ; 283: System.Net.WebClient => 0xba663087f18829ff => 149
	i64 13465488254036897740, ; 284: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 106
	i64 13467053111158216594, ; 285: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 29
	i64 13545416393490209236, ; 286: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 13
	i64 13572454107664307259, ; 287: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 100
	i64 13702626353344114072, ; 288: System.Diagnostics.Tools.dll => 0xbe29821198fb6d98 => 126
	i64 13717397318615465333, ; 289: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 118
	i64 13755568601956062840, ; 290: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 8
	i64 13814445057219246765, ; 291: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 11
	i64 13881769479078963060, ; 292: System.Console.dll => 0xc0a5f3cade5c6774 => 121
	i64 13959074834287824816, ; 293: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 90
	i64 14100563506285742564, ; 294: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 3
	i64 14124974489674258913, ; 295: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 83
	i64 14125464355221830302, ; 296: System.Threading.dll => 0xc407bafdbc707a9e => 184
	i64 14148919944076435199, ; 297: DocumentFormat.OpenXml.dll => 0xc45b0fb9961d9eff => 39
	i64 14254574811015963973, ; 298: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 177
	i64 14286649581274246170, ; 299: SQLitePCLRaw.provider.dynamic_cdecl => 0xc6446019aa55ac1a => 75
	i64 14461014870687870182, ; 300: System.Net.Requests.dll => 0xc8afd8683afdece6 => 145
	i64 14522721392235705434, ; 301: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 5
	i64 14556034074661724008, ; 302: CommunityToolkit.Maui.Core => 0xca016bdea6b19f68 => 37
	i64 14561513370130550166, ; 303: System.Security.Cryptography.Primitives.dll => 0xca14e3428abb8d96 => 173
	i64 14622043554576106986, ; 304: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 168
	i64 14649655628568468462, ; 305: de/PdfSharpCore.resources.dll => 0xcb4e082d4ea01bee => 34
	i64 14669215534098758659, ; 306: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 49
	i64 14690985099581930927, ; 307: System.Web.HttpUtility => 0xcbe0dd1ca5233daf => 185
	i64 14832630590065248058, ; 308: System.Security.Claims => 0xcdd816ef5d6e873a => 171
	i64 14852515768018889994, ; 309: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 87
	i64 14892012299694389861, ; 310: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 33
	i64 14912225920358050525, ; 311: System.Security.Principal.Windows => 0xcef2de7759506add => 175
	i64 14935719434541007538, ; 312: System.Text.Encoding.CodePages.dll => 0xcf4655b160b702b2 => 176
	i64 14954917835170835695, ; 313: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 50
	i64 14984936317414011727, ; 314: System.Net.WebHeaderCollection => 0xcff5302fe54ff34f => 150
	i64 14987728460634540364, ; 315: System.IO.Compression.dll => 0xcfff1ba06622494c => 133
	i64 15015154896917945444, ; 316: System.Net.Security.dll => 0xd0608bd33642dc64 => 146
	i64 15055048765753425892, ; 317: SQLitePCLRaw.nativelibrary => 0xd0ee47165eea7fe4 => 72
	i64 15076659072870671916, ; 318: System.ObjectModel.dll => 0xd13b0d8c1620662c => 154
	i64 15115185479366240210, ; 319: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 131
	i64 15133485256822086103, ; 320: System.Linq.dll => 0xd204f0a9127dd9d7 => 138
	i64 15203992829448345623, ; 321: PdfSharpCore.dll => 0xd2ff6eec96dad817 => 64
	i64 15227001540531775957, ; 322: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 48
	i64 15269655435003964317, ; 323: PdfSharpCore.Charting => 0xd3e8b6b74e062b9d => 65
	i64 15273147323526128252, ; 324: de/Microsoft.Maui.Controls.resources => 0xd3f51e91f4fba27c => 4
	i64 15370334346939861994, ; 325: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 86
	i64 15391712275433856905, ; 326: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 50
	i64 15443314347085689186, ; 327: nl/Microsoft.Maui.Controls.resources => 0xd651ac9394bc7162 => 19
	i64 15474781042002767710, ; 328: hr/Microsoft.Maui.Controls.resources => 0xd6c1775e69862f5e => 11
	i64 15478373401424648762, ; 329: es/Microsoft.Maui.Controls.resources => 0xd6ce3a99c4c55a3a => 6
	i64 15527772828719725935, ; 330: System.Console => 0xd77dbb1e38cd3d6f => 121
	i64 15557562860424774966, ; 331: System.Net.Sockets => 0xd7e790fe7a6dc536 => 148
	i64 15582737692548360875, ; 332: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 94
	i64 15609085926864131306, ; 333: System.dll => 0xd89e9cf3334914ea => 189
	i64 15661133872274321916, ; 334: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 187
	i64 15664356999916475676, ; 335: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 4
	i64 15743187114543869802, ; 336: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 12
	i64 15817206913877585035, ; 337: System.Threading.Tasks.dll => 0xdb8201e29086ac8b => 182
	i64 15847085070278954535, ; 338: System.Threading.Channels.dll => 0xdbec27e8f35f8e27 => 179
	i64 15928521404965645318, ; 339: Microsoft.Maui.Controls.Compatibility => 0xdd0d79d32c2eec06 => 55
	i64 15963349826457351533, ; 340: System.Threading.Tasks.Extensions => 0xdd893616f748b56d => 180
	i64 15995174293784908801, ; 341: nb/Microsoft.Maui.Controls.resources => 0xddfa46462d825401 => 18
	i64 16018552496348375205, ; 342: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 143
	i64 16154507427712707110, ; 343: System => 0xe03056ea4e39aa26 => 189
	i64 16198848395322856833, ; 344: ms/Microsoft.Maui.Controls.resources => 0xe0cddeca55a01581 => 17
	i64 16219561732052121626, ; 345: System.Net.Security => 0xe1177575db7c781a => 146
	i64 16321164108206115771, ; 346: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 52
	i64 16337011941688632206, ; 347: System.Security.Principal.Windows.dll => 0xe2b8b9cdc3aa638e => 175
	i64 16454459195343277943, ; 348: System.Net.NetworkInformation => 0xe459fb756d988f77 => 143
	i64 16491294355724214223, ; 349: zh-HK/Microsoft.Maui.Controls.resources => 0xe4dcd8d787589fcf => 31
	i64 16648892297579399389, ; 350: CommunityToolkit.Mvvm => 0xe70cbf55c4f508dd => 38
	i64 16649148416072044166, ; 351: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 60
	i64 16677317093839702854, ; 352: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 99
	i64 16709499819875633724, ; 353: System.IO.Compression.ZipFile => 0xe7e4118e32240a3c => 132
	i64 16737304880976948124, ; 354: ja/Microsoft.Maui.Controls.resources => 0xe846da1c780aeb9c => 15
	i64 16737807731308835127, ; 355: System.Runtime.Intrinsics => 0xe848a3736f733137 => 166
	i64 16755018182064898362, ; 356: SQLitePCLRaw.core.dll => 0xe885c843c330813a => 73
	i64 16833383113903931215, ; 357: mscorlib => 0xe99c30c1484d7f4f => 190
	i64 16856067890322379635, ; 358: System.Data.Common.dll => 0xe9ecc87060889373 => 122
	i64 16890310621557459193, ; 359: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 178
	i64 16998075588627545693, ; 360: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 97
	i64 17002632880692658483, ; 361: Magick.NET-Q16-AnyCPU => 0xebf57c856c100133 => 44
	i64 17008137082415910100, ; 362: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 114
	i64 17031351772568316411, ; 363: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 96
	i64 17062143951396181894, ; 364: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 118
	i64 17089008752050867324, ; 365: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 32
	i64 17118171214553292978, ; 366: System.Threading.Channels => 0xed8ff6060fc420b2 => 179
	i64 17201328579425343169, ; 367: System.ComponentModel.EventBasedAsync => 0xeeb76534d96c16c1 => 117
	i64 17230721278011714856, ; 368: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 156
	i64 17260702271250283638, ; 369: System.Data.Common => 0xef8a5543bba6bc76 => 122
	i64 17338386382517543202, ; 370: System.Net.WebSockets.Client.dll => 0xf09e528d5c6da122 => 151
	i64 17438153253682247751, ; 371: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 25
	i64 17482873938501421891, ; 372: fr/Microsoft.Maui.Controls.resources => 0xf29fa538054fcb43 => 8
	i64 17509662556995089465, ; 373: System.Net.WebSockets.dll => 0xf2fed1534ea67439 => 152
	i64 17604961838774693804, ; 374: MigraDocCore.Rendering => 0xf45163846c792fac => 62
	i64 17685921127322830888, ; 375: System.Diagnostics.Debug.dll => 0xf571038fafa74828 => 123
	i64 17702523067201099846, ; 376: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 31
	i64 17704177640604968747, ; 377: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 95
	i64 17710060891934109755, ; 378: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 93
	i64 17712670374920797664, ; 379: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 165
	i64 17777860260071588075, ; 380: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 167
	i64 17838668724098252521, ; 381: System.Buffers.dll => 0xf78faeb0f5bf3ee9 => 111
	i64 18025913125965088385, ; 382: System.Threading => 0xfa28e87b91334681 => 184
	i64 18099568558057551825, ; 383: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 19
	i64 18121036031235206392, ; 384: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 96
	i64 18146411883821974900, ; 385: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 130
	i64 18146811631844267958, ; 386: System.ComponentModel.EventBasedAsync.dll => 0xfbd66d08820117b6 => 117
	i64 18245806341561545090, ; 387: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 112
	i64 18284618658670613420, ; 388: System.IO.Packaging.dll => 0xfdc003cb438a93ac => 78
	i64 18305135509493619199, ; 389: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 98
	i64 18341799084585866416, ; 390: DocumentFormat.OpenXml.Framework => 0xfe8b2916a25354b0 => 40
	i64 18370042311372477656 ; 391: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0xfeef80274e4094d8 => 74
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [392 x i32] [
	i32 54, ; 0
	i32 195, ; 1
	i32 59, ; 2
	i32 136, ; 3
	i32 67, ; 4
	i32 84, ; 5
	i32 101, ; 6
	i32 79, ; 7
	i32 7, ; 8
	i32 160, ; 9
	i32 77, ; 10
	i32 68, ; 11
	i32 183, ; 12
	i32 120, ; 13
	i32 10, ; 14
	i32 74, ; 15
	i32 89, ; 16
	i32 160, ; 17
	i32 0, ; 18
	i32 105, ; 19
	i32 18, ; 20
	i32 129, ; 21
	i32 73, ; 22
	i32 97, ; 23
	i32 144, ; 24
	i32 56, ; 25
	i32 194, ; 26
	i32 76, ; 27
	i32 183, ; 28
	i32 16, ; 29
	i32 45, ; 30
	i32 82, ; 31
	i32 94, ; 32
	i32 20, ; 33
	i32 63, ; 34
	i32 141, ; 35
	i32 139, ; 36
	i32 155, ; 37
	i32 81, ; 38
	i32 164, ; 39
	i32 101, ; 40
	i32 40, ; 41
	i32 46, ; 42
	i32 128, ; 43
	i32 57, ; 44
	i32 38, ; 45
	i32 28, ; 46
	i32 172, ; 47
	i32 93, ; 48
	i32 2, ; 49
	i32 20, ; 50
	i32 180, ; 51
	i32 128, ; 52
	i32 63, ; 53
	i32 16, ; 54
	i32 39, ; 55
	i32 89, ; 56
	i32 112, ; 57
	i32 24, ; 58
	i32 134, ; 59
	i32 92, ; 60
	i32 162, ; 61
	i32 3, ; 62
	i32 85, ; 63
	i32 2, ; 64
	i32 170, ; 65
	i32 80, ; 66
	i32 190, ; 67
	i32 142, ; 68
	i32 49, ; 69
	i32 152, ; 70
	i32 62, ; 71
	i32 162, ; 72
	i32 105, ; 73
	i32 22, ; 74
	i32 27, ; 75
	i32 91, ; 76
	i32 153, ; 77
	i32 167, ; 78
	i32 148, ; 79
	i32 107, ; 80
	i32 59, ; 81
	i32 47, ; 82
	i32 102, ; 83
	i32 192, ; 84
	i32 170, ; 85
	i32 48, ; 86
	i32 187, ; 87
	i32 47, ; 88
	i32 191, ; 89
	i32 100, ; 90
	i32 51, ; 91
	i32 126, ; 92
	i32 57, ; 93
	i32 145, ; 94
	i32 139, ; 95
	i32 169, ; 96
	i32 157, ; 97
	i32 55, ; 98
	i32 65, ; 99
	i32 120, ; 100
	i32 171, ; 101
	i32 136, ; 102
	i32 119, ; 103
	i32 71, ; 104
	i32 30, ; 105
	i32 135, ; 106
	i32 185, ; 107
	i32 0, ; 108
	i32 80, ; 109
	i32 102, ; 110
	i32 129, ; 111
	i32 142, ; 112
	i32 7, ; 113
	i32 161, ; 114
	i32 161, ; 115
	i32 115, ; 116
	i32 115, ; 117
	i32 149, ; 118
	i32 164, ; 119
	i32 123, ; 120
	i32 131, ; 121
	i32 174, ; 122
	i32 69, ; 123
	i32 72, ; 124
	i32 172, ; 125
	i32 104, ; 126
	i32 21, ; 127
	i32 130, ; 128
	i32 173, ; 129
	i32 23, ; 130
	i32 71, ; 131
	i32 41, ; 132
	i32 158, ; 133
	i32 35, ; 134
	i32 92, ; 135
	i32 88, ; 136
	i32 53, ; 137
	i32 176, ; 138
	i32 29, ; 139
	i32 22, ; 140
	i32 127, ; 141
	i32 188, ; 142
	i32 186, ; 143
	i32 153, ; 144
	i32 181, ; 145
	i32 156, ; 146
	i32 134, ; 147
	i32 75, ; 148
	i32 26, ; 149
	i32 138, ; 150
	i32 110, ; 151
	i32 119, ; 152
	i32 61, ; 153
	i32 14, ; 154
	i32 186, ; 155
	i32 154, ; 156
	i32 125, ; 157
	i32 79, ; 158
	i32 132, ; 159
	i32 23, ; 160
	i32 140, ; 161
	i32 141, ; 162
	i32 17, ; 163
	i32 192, ; 164
	i32 109, ; 165
	i32 106, ; 166
	i32 82, ; 167
	i32 108, ; 168
	i32 166, ; 169
	i32 116, ; 170
	i32 91, ; 171
	i32 124, ; 172
	i32 193, ; 173
	i32 116, ; 174
	i32 60, ; 175
	i32 125, ; 176
	i32 163, ; 177
	i32 67, ; 178
	i32 174, ; 179
	i32 99, ; 180
	i32 159, ; 181
	i32 5, ; 182
	i32 113, ; 183
	i32 28, ; 184
	i32 155, ; 185
	i32 25, ; 186
	i32 36, ; 187
	i32 21, ; 188
	i32 193, ; 189
	i32 109, ; 190
	i32 98, ; 191
	i32 64, ; 192
	i32 42, ; 193
	i32 124, ; 194
	i32 9, ; 195
	i32 188, ; 196
	i32 43, ; 197
	i32 43, ; 198
	i32 104, ; 199
	i32 81, ; 200
	i32 69, ; 201
	i32 178, ; 202
	i32 85, ; 203
	i32 114, ; 204
	i32 45, ; 205
	i32 195, ; 206
	i32 10, ; 207
	i32 137, ; 208
	i32 58, ; 209
	i32 6, ; 210
	i32 140, ; 211
	i32 157, ; 212
	i32 151, ; 213
	i32 56, ; 214
	i32 181, ; 215
	i32 42, ; 216
	i32 26, ; 217
	i32 88, ; 218
	i32 147, ; 219
	i32 159, ; 220
	i32 158, ; 221
	i32 107, ; 222
	i32 86, ; 223
	i32 46, ; 224
	i32 78, ; 225
	i32 110, ; 226
	i32 163, ; 227
	i32 144, ; 228
	i32 108, ; 229
	i32 137, ; 230
	i32 36, ; 231
	i32 33, ; 232
	i32 52, ; 233
	i32 58, ; 234
	i32 30, ; 235
	i32 32, ; 236
	i32 103, ; 237
	i32 53, ; 238
	i32 66, ; 239
	i32 87, ; 240
	i32 165, ; 241
	i32 103, ; 242
	i32 51, ; 243
	i32 191, ; 244
	i32 9, ; 245
	i32 70, ; 246
	i32 182, ; 247
	i32 70, ; 248
	i32 44, ; 249
	i32 12, ; 250
	i32 147, ; 251
	i32 111, ; 252
	i32 13, ; 253
	i32 169, ; 254
	i32 113, ; 255
	i32 76, ; 256
	i32 37, ; 257
	i32 61, ; 258
	i32 90, ; 259
	i32 95, ; 260
	i32 35, ; 261
	i32 127, ; 262
	i32 41, ; 263
	i32 24, ; 264
	i32 83, ; 265
	i32 133, ; 266
	i32 14, ; 267
	i32 84, ; 268
	i32 177, ; 269
	i32 27, ; 270
	i32 135, ; 271
	i32 54, ; 272
	i32 150, ; 273
	i32 34, ; 274
	i32 77, ; 275
	i32 168, ; 276
	i32 68, ; 277
	i32 1, ; 278
	i32 15, ; 279
	i32 1, ; 280
	i32 194, ; 281
	i32 66, ; 282
	i32 149, ; 283
	i32 106, ; 284
	i32 29, ; 285
	i32 13, ; 286
	i32 100, ; 287
	i32 126, ; 288
	i32 118, ; 289
	i32 8, ; 290
	i32 11, ; 291
	i32 121, ; 292
	i32 90, ; 293
	i32 3, ; 294
	i32 83, ; 295
	i32 184, ; 296
	i32 39, ; 297
	i32 177, ; 298
	i32 75, ; 299
	i32 145, ; 300
	i32 5, ; 301
	i32 37, ; 302
	i32 173, ; 303
	i32 168, ; 304
	i32 34, ; 305
	i32 49, ; 306
	i32 185, ; 307
	i32 171, ; 308
	i32 87, ; 309
	i32 33, ; 310
	i32 175, ; 311
	i32 176, ; 312
	i32 50, ; 313
	i32 150, ; 314
	i32 133, ; 315
	i32 146, ; 316
	i32 72, ; 317
	i32 154, ; 318
	i32 131, ; 319
	i32 138, ; 320
	i32 64, ; 321
	i32 48, ; 322
	i32 65, ; 323
	i32 4, ; 324
	i32 86, ; 325
	i32 50, ; 326
	i32 19, ; 327
	i32 11, ; 328
	i32 6, ; 329
	i32 121, ; 330
	i32 148, ; 331
	i32 94, ; 332
	i32 189, ; 333
	i32 187, ; 334
	i32 4, ; 335
	i32 12, ; 336
	i32 182, ; 337
	i32 179, ; 338
	i32 55, ; 339
	i32 180, ; 340
	i32 18, ; 341
	i32 143, ; 342
	i32 189, ; 343
	i32 17, ; 344
	i32 146, ; 345
	i32 52, ; 346
	i32 175, ; 347
	i32 143, ; 348
	i32 31, ; 349
	i32 38, ; 350
	i32 60, ; 351
	i32 99, ; 352
	i32 132, ; 353
	i32 15, ; 354
	i32 166, ; 355
	i32 73, ; 356
	i32 190, ; 357
	i32 122, ; 358
	i32 178, ; 359
	i32 97, ; 360
	i32 44, ; 361
	i32 114, ; 362
	i32 96, ; 363
	i32 118, ; 364
	i32 32, ; 365
	i32 179, ; 366
	i32 117, ; 367
	i32 156, ; 368
	i32 122, ; 369
	i32 151, ; 370
	i32 25, ; 371
	i32 8, ; 372
	i32 152, ; 373
	i32 62, ; 374
	i32 123, ; 375
	i32 31, ; 376
	i32 95, ; 377
	i32 93, ; 378
	i32 165, ; 379
	i32 167, ; 380
	i32 111, ; 381
	i32 184, ; 382
	i32 19, ; 383
	i32 96, ; 384
	i32 130, ; 385
	i32 117, ; 386
	i32 112, ; 387
	i32 78, ; 388
	i32 98, ; 389
	i32 40, ; 390
	i32 74 ; 391
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

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
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
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
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ af27162bee43b7fecdca59b4f67aa8c175cbc875"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
