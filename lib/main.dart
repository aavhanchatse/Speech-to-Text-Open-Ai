import 'package:chat_index_bar/chat_index_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final Color WeChatThemeColor = Color.fromRGBO(220, 220, 220, 1.0);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'use cases for chat index bar.',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.standard,
      ),
      home: const FriendsPage(),
    );
  }
}

class FriendsPage extends StatefulWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  // 字典里存放item和高度的对应数据
  final Map _groupOffsetMap = {
    indexWords[0]: 0.0,
    indexWords[0]: 0.0,
  };

  final ScrollController _scrollController = ScrollController();

  final List<Friends> _listDatas = [];

  @override
  void initState() {
    super.initState();

    // 方法一
    // _listDatas.addAll(datas);
    // _listDatas.addAll(datas);

    // 方法二 step1 链式 添加【增量数据】
    _listDatas
    // ..addAll(datas)
    // ..addAll(datas)
      ..addAll(datas);

    // step2 排序
    _listDatas.sort((Friends a, Friends b) {
      return a.indexLetter.compareTo(b.indexLetter);
    });

    var _groupOffset = 54.5 * 4;
    // 经过循环计算，将每一个头的位置算出来，放入字典。
    for (int i = 0; i < _listDatas.length; i++) {
      if (i < 1) {
        // 第一个Cell
        _groupOffsetMap.addAll({_listDatas[i].indexLetter: _groupOffset});
        // 保存完了再加_groupOffset偏移
        _groupOffset += 84.5;
      } else if (_listDatas[i].indexLetter == _listDatas[i - 1].indexLetter) {
        // 没有头部，只需要加偏移量
        _groupOffset += 54.5;
      } else {
        // 这部分是有头部的Cell
        _groupOffsetMap.addAll({_listDatas[i].indexLetter: _groupOffset});
        _groupOffset += 84.5;
      }
    }
  }

  final List _headerData = [
    Friends(imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png', name: '新的朋友'),
    Friends(imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png', name: '群聊'),
    Friends(imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png', name: '标签'),
    Friends(imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png', name: '公众号'),
  ];

  Widget _itemForRow(BuildContext context, int index) {
    // 显示头部 系统图标的cell
    if (index < _headerData.length) {
      // print(index);
      return _FriendCell(
        imageUrl: _headerData[index].imageUrl,
        name: _headerData[index].name,
      );
    }

    // 显示剩下的cell
    // 如果当前和上一个cell的IndexLetter一样， 就不显示
    bool _hideIndexLetter = (index - 4 > 0 &&
        (_listDatas[index - 4].indexLetter ==
            _listDatas[index - 5].indexLetter));
    return _FriendCell(
      imageUrl: _listDatas[index - 4].imageUrl,
      name: _listDatas[index - 4].name,
      groupTitle: _hideIndexLetter ? "" : _listDatas[index - 4].indexLetter,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WeChatThemeColor,
        title: const Text('通讯录'),
        actions: <Widget>[
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              child: const Icon(Icons.add, size: 25,),
            ),
            onTap: () {},
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            controller: _scrollController,
            itemCount: _listDatas.length + _headerData.length,
            itemBuilder: _itemForRow,
          ), // 列表
          IndexBar(
            bubbleImage: const Image(
              image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTxO8mUQcWnFsN2aEnvdSKNyJ9Bx61N-KxrA&usqp=CAU'),
            ),
            indexBarCallBack: (String str) {
              if (kDebugMode) {
                print('我收到了$str');
              }

              if (_groupOffsetMap[str] != null) {
                _scrollController.animateTo(_groupOffsetMap[str],
                    duration: const Duration(microseconds: 1),
                    curve: Curves.easeIn);
              }
            },
          ), // 悬浮检索控件
        ],
      ),
    );
  }
}

class _FriendCell extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String groupTitle;
  final String imageAssets;

  const _FriendCell(
      {this.imageUrl = '',
        this.name = '',
        this.groupTitle = '',
        this.imageAssets = ''});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 10),
          height: groupTitle != "" ? 30 : 0,
          color: const Color.fromRGBO(1, 1, 1, 0.0),
          child: groupTitle != ""
              ? Text(
            groupTitle,
            style: const TextStyle(color: Colors.grey),
          )
              : null,
        ), // Cell的头
        Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10),
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    image: DecorationImage(
                      image: imageUrl != ""
                          ? NetworkImage(imageUrl)
                          : AssetImage(imageAssets) as ImageProvider,
                    )),
              ), // 图片
              Text(
                name,
                style: const TextStyle(fontSize: 17),
              ), // 昵称
            ],
          ),
        ), // Cell的内容
        Container(
          height: 0.5,
          color: WeChatThemeColor,
          child: Row(
            children: <Widget>[
              Container(
                width: 50,
                color: Colors.white,
              ),
            ],
          ),
        ), // 分割线
      ],
    );
  }
}

class _FriendHeaderCell extends StatelessWidget {
  final String name;
  final String imageAssets;

  const _FriendHeaderCell({this.name = '', this.imageAssets = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(10),
            width: 34,
            height: 34,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                image: DecorationImage(
                  image: AssetImage(imageAssets),
                )),
          ), // 图片
          Text(
            name,
            style: const TextStyle(fontSize: 17),
          ), // 昵称
        ],
      ),
    );
  }
}

class Friends {
  final String imageUrl;
  final String name;
  final String indexLetter;

  Friends({this.imageUrl = '', this.name = '', this.indexLetter = ''});
}

List<Friends> datas = [
  Friends(
      imageUrl: "https://randomuser.me/api/portraits/women/22.jpg",
      name: "Lina",
      indexLetter: "L"),
  Friends(
      imageUrl: "https://randomuser.me/api/portraits/women/17.jpg",
      name: "菲儿",
      indexLetter: "F"),
  Friends(
      imageUrl: "https://randomuser.me/api/portraits/women/16.jpg",
      name: "安莉",
      indexLetter: "A"),
  Friends(
      imageUrl: "https://randomuser.me/api/portraits/women/16.jpg",
      name: "Eam",
      indexLetter: "E"),
  Friends(
      imageUrl: "https://randomuser.me/api/portraits/women/16.jpg",
      name: "安莉",
      indexLetter: "A"),
  Friends(
      imageUrl: "https://randomuser.me/api/portraits/women/31.jpg",
      name: "阿贵",
      indexLetter: "A"),
  Friends(
      imageUrl: "https://randomuser.me/api/portraits/women/22.jpg",
      name: "贝拉",
      indexLetter: "B"),
  Friends(
      imageUrl: "https://randomuser.me/api/portraits/women/27.jpg",
      name: "Abby",
      indexLetter: "A"),
  Friends(
      imageUrl: "https://randomuser.me/api/portraits/women/31.jpg",
      name: "COCO",
      indexLetter: "C"),
  Friends(
      imageUrl: "https://randomuser.me/api/portraits/women/17.jpg",
      name: "wkk",
      indexLetter: "W"),
  Friends(
      imageUrl: "https://randomuser.me/api/portraits/women/16.jpg",
      name: "凯蒂",
      indexLetter: "K"),
  Friends(
      imageUrl: "https://randomuser.me/api/portraits/women/31.jpg",
      name: "盖茨",
      indexLetter: "G"),
  Friends(
      imageUrl: "https://randomuser.me/api/portraits/women/22.jpg",
      name: "Hank",
      indexLetter: "H"),
  Friends(
      imageUrl: "https://randomuser.me/api/portraits/women/16.jpg",
      name: "Yuki",
      indexLetter: "Y"),
  Friends(
      imageUrl: "https://randomuser.me/api/portraits/women/27.jpg",
      name: "张萌",
      indexLetter: "Z"),
  Friends(
      imageUrl: "https://randomuser.me/api/portraits/women/22.jpg",
      name: "COCO",
      indexLetter: "C"),
  Friends(
      imageUrl: "https://randomuser.me/api/portraits/women/17.jpg",
      name: "赛琳娜",
      indexLetter: "S"),
  Friends(
      imageUrl: "https://randomuser.me/api/portraits/women/16.jpg",
      name: "Wangle",
      indexLetter: "W"),
  Friends(
      imageUrl: "https://randomuser.me/api/portraits/women/31.jpg",
      name: "西涅",
      indexLetter: "X"),
  Friends(
      imageUrl: "https://randomuser.me/api/portraits/women/22.jpg",
      name: "Right",
      indexLetter: "R"),
  Friends(
      imageUrl: "https://randomuser.me/api/portraits/women/31.jpg",
      name: "Vivina",
      indexLetter: "V"),
  Friends(
      imageUrl: "https://randomuser.me/api/portraits/women/27.jpg",
      name: "秦小君",
      indexLetter: "Q"),
  Friends(
      imageUrl: "https://randomuser.me/api/portraits/women/31.jpg",
      name: "Peter",
      indexLetter: "P"),
  Friends(
      imageUrl: "https://randomuser.me/api/portraits/women/17.jpg",
      name: "欧拉琳",
      indexLetter: "O"),
  Friends(
      imageUrl: "https://randomuser.me/api/portraits/women/22.jpg",
      name: "Python",
      indexLetter: "P"),
  Friends(
      imageUrl: "https://randomuser.me/api/portraits/women/31.jpg",
      name: "C++",
      indexLetter: "C"),
  Friends(
      imageUrl: "https://randomuser.me/api/portraits/women/16.jpg",
      name: "Java",
      indexLetter: "J"),
  Friends(
      imageUrl: "https://randomuser.me/api/portraits/women/16.jpg",
      name: "Betty",
      indexLetter: "B"),
  Friends(
      imageUrl: "https://randomuser.me/api/portraits/women/17.jpg",
      name: "Objective-C",
      indexLetter: "O"),
  Friends(
      imageUrl: "https://randomuser.me/api/portraits/women/31.jpg",
      name: "Swift",
      indexLetter: "S"),
  Friends(
      imageUrl: 'https://randomuser.me/api/portraits/women/16.jpg',
      name: 'web',
      indexLetter: 'W'),
  Friends(
      imageUrl: 'https://randomuser.me/api/portraits/women/17.jpg',
      name: 'PHP',
      indexLetter: 'P'),
];

// import 'dart:async';
// import 'dart:io';

// import 'package:dart_openai/openai.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:openaispeech/app_constants/constants.dart';
// import 'package:record/record.dart';

// void main() {
//   runApp(const MyApp());
// }

// class AudioRecorder extends StatefulWidget {
//   const AudioRecorder({Key? key}) : super(key: key);

//   @override
//   State<AudioRecorder> createState() => _AudioRecorderState();
// }

// class _AudioRecorderState extends State<AudioRecorder> {
//   int _recordDuration = 0;
//   Timer? _timer;
//   final _audioRecorder = Record();
//   StreamSubscription<RecordState>? _recordSub;
//   RecordState _recordState = RecordState.stop;
//   StreamSubscription<Amplitude>? _amplitudeSub;
//   Amplitude? _amplitude;

//   @override
//   void initState() {
//     _recordSub = _audioRecorder.onStateChanged().listen((recordState) {
//       setState(() => _recordState = recordState);
//     });

//     _amplitudeSub = _audioRecorder
//         .onAmplitudeChanged(const Duration(milliseconds: 300))
//         .listen((amp) => setState(() => _amplitude = amp));

//     super.initState();
//   }

//   Future<void> _start() async {
//     try {
//       if (await _audioRecorder.hasPermission()) {
//         // We don't do anything with this but printing
//         final isSupported = await _audioRecorder.isEncoderSupported(
//           AudioEncoder.aacLc,
//         );
//         if (kDebugMode) {
//           print('${AudioEncoder.aacLc.name} supported: $isSupported');
//         }

//         // final devs = await _audioRecorder.listInputDevices();
//         // final isRecording = await _audioRecorder.isRecording();

//         await _audioRecorder.start();
//         _recordDuration = 0;

//         _startTimer();
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//   }

//   Future<void> _stop() async {
//     _timer?.cancel();
//     _recordDuration = 0;

//     final path = await _audioRecorder.stop();

//     if (path != null) {
//       if (kDebugMode) print('Recorded file path: $path');
//       createTranscription(path);
//     }
//   }

//   Future<void> _pause() async {
//     _timer?.cancel();
//     await _audioRecorder.pause();
//   }

//   Future<void> _resume() async {
//     _startTimer();
//     await _audioRecorder.resume();
//   }

//   void createTranscription(String path) async {
//     debugPrint('inside transcription: $path');

//     OpenAI.apiKey = Constants.OPENAI_API_KEY;

//     OpenAIAudioModel transcription =
//         await OpenAI.instance.audio.createTranscription(
//       file: File(path),
//       model: "whisper-1",
//       responseFormat: OpenAIAudioResponseFormat.json,
//     );

//     debugPrint('transcription: $transcription');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 _buildRecordStopControl(),
//                 const SizedBox(width: 20),
//                 _buildPauseResumeControl(),
//                 const SizedBox(width: 20),
//                 _buildText(),
//               ],
//             ),
//             if (_amplitude != null) ...[
//               const SizedBox(height: 40),
//               Text('Current: ${_amplitude?.current ?? 0.0}'),
//               Text('Max: ${_amplitude?.max ?? 0.0}'),
//             ],
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     _recordSub?.cancel();
//     _amplitudeSub?.cancel();
//     _audioRecorder.dispose();
//     super.dispose();
//   }

//   Widget _buildRecordStopControl() {
//     late Icon icon;
//     late Color color;

//     if (_recordState != RecordState.stop) {
//       icon = const Icon(Icons.stop, color: Colors.red, size: 30);
//       color = Colors.red.withOpacity(0.1);
//     } else {
//       final theme = Theme.of(context);
//       icon = Icon(Icons.mic, color: theme.primaryColor, size: 30);
//       color = theme.primaryColor.withOpacity(0.1);
//     }

//     return ClipOval(
//       child: Material(
//         color: color,
//         child: InkWell(
//           child: SizedBox(width: 56, height: 56, child: icon),
//           onTap: () {
//             (_recordState != RecordState.stop) ? _stop() : _start();
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildPauseResumeControl() {
//     if (_recordState == RecordState.stop) {
//       return const SizedBox.shrink();
//     }

//     late Icon icon;
//     late Color color;

//     if (_recordState == RecordState.record) {
//       icon = const Icon(Icons.pause, color: Colors.red, size: 30);
//       color = Colors.red.withOpacity(0.1);
//     } else {
//       final theme = Theme.of(context);
//       icon = const Icon(Icons.play_arrow, color: Colors.red, size: 30);
//       color = theme.primaryColor.withOpacity(0.1);
//     }

//     return ClipOval(
//       child: Material(
//         color: color,
//         child: InkWell(
//           child: SizedBox(width: 56, height: 56, child: icon),
//           onTap: () {
//             (_recordState == RecordState.pause) ? _resume() : _pause();
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildText() {
//     if (_recordState != RecordState.stop) {
//       return _buildTimer();
//     }

//     return const Text("Waiting to record");
//   }

//   Widget _buildTimer() {
//     final String minutes = _formatNumber(_recordDuration ~/ 60);
//     final String seconds = _formatNumber(_recordDuration % 60);

//     return Text(
//       '$minutes : $seconds',
//       style: const TextStyle(color: Colors.red),
//     );
//   }

//   String _formatNumber(int number) {
//     String numberStr = number.toString();
//     if (number < 10) {
//       numberStr = '0$numberStr';
//     }

//     return numberStr;
//   }

//   void _startTimer() {
//     _timer?.cancel();

//     _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
//       setState(() => _recordDuration++);
//     });
//   }
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool showPlayer = false;
//   String? audioPath;

//   @override
//   void initState() {
//     showPlayer = false;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: showPlayer
//               ? const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 25),
//                   // child: AudioPlayer(
//                   //   source: audioPath!,
//                   //   onDelete: () {
//                   //     setState(() => showPlayer = false);
//                   //   },
//                   // ),
//                 )
//               : const AudioRecorder(),
//         ),
//       ),
//     );
//   }
// }


// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:openaispeech/app_constants/themes.dart';
// import 'package:openaispeech/utils/size_config.dart';
// import 'package:openaispeech/view/screens/splash_screen.dart';
// import 'package:openaispeech/view/widgets/internet_subscription_widget.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

//   // SystemChrome.setSystemUIOverlayStyle(
//   //   SystemUiOverlayStyle(
//   //     systemNavigationBarColor: Constants.primaryColor, // navigation bar color
//   //     statusBarColor: Constants.primaryColor, // status bar color
//   //     statusBarBrightness: Brightness.light,
//   //     statusBarIconBrightness: Brightness.light,
//   //   ),
//   // );

//   // await Firebase.initializeApp();
//   // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   // await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//   //   alert: true,
//   //   badge: true,
//   //   sound: true,
//   // );

//   if (kReleaseMode) {
//     debugPrint = (String? message, {int? wrapWidth}) {};
//   }

//   await GetStorage.init('pinktree_box');

//   runApp(const MyApp());
// }

// // Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
// //   // If you're going to use other Firebase services in the background, such as Firestore,
// //   // make sure you call `initializeApp` before using other Firebase services.
// //   // await Firebase.initializeApp();
// //   debugPrint('Handling a background message ${message}');
// // }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints constraints) {
//       return OrientationBuilder(
//           builder: (BuildContext context2, Orientation orientation) {
//         SizeConfig.init(constraints, orientation);

//         return GetMaterialApp(
//           title: "Speech2Text",
//           useInheritedMediaQuery: true,
//           builder: DevicePreview.appBuilder,
//           theme: Themes.light,
//           debugShowCheckedModeBanner: false,
//           defaultTransition:
//               GetPlatform.isIOS ? Transition.cupertino : Transition.rightToLeft,
//           home: const Stack(
//             children: [
//               SplashScreen(),
//               NoInternetSubscriptionWidget(),
//             ],
//           ),
//         );
//       });
//     });
//   }
// }
