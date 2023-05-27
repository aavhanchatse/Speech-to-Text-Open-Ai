// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:openaispeech/app_constants/constants.dart';
// import 'package:openaispeech/utils/size_config.dart';
// import 'package:openaispeech/utils/snackbar_util.dart';

// class Navbar extends StatefulWidget {
//   const Navbar({super.key});

//   @override
//   State<Navbar> createState() => _NavbarState();
// }

// class _NavbarState extends State<Navbar> {
//   List<Widget>? pages;
//   int _index = 0;
//   DateTime? currentBackPressTime;

//   final imageList = [
//     'assets/icons/nav_bar_icons/home.png',
//     'assets/icons/nav_bar_icons/chat.png',
//     'assets/icons/my_activity.png',
//     'assets/icons/nav_bar_icons/bag.png',
//   ];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     pages = [
//       const HomeScreen(),
//       const ChatScreen(),
//       const MyActivityWidget(
//         isFromNavBar: true,
//       ),
//       const MyOrderWidget(
//         isFromNavBar: true,
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       body: WillPopScope(
//         onWillPop: () {
//           if (_index == 0) {
//             return _onWillPop();
//           } else {
//             setIndex(0);
//             return Future.value(false);
//           }
//         },
//         child: pages![_index],
//       ),
//       bottomNavigationBar: AnimatedBottomNavigationBar.builder(
//         itemCount: imageList.length,
//         tabBuilder: (int index, bool isActive) {
//           final color = isActive ? Constants.white : Constants.primaryColor;

//           return Container(
//             padding: EdgeInsets.all(3.w),
//             child: Container(
//               height: 50,
//               width: 50,
//               padding: const EdgeInsets.all(4),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: color,
//               ),
//               child: ImageIcon(
//                 AssetImage(imageList[index]),
//                 color: Constants.black,
//               ),
//             ),
//           );
//         },
//         backgroundColor: Constants.primaryColor,
//         activeIndex: _index,
//         splashColor: Constants.primaryColor,
//         splashSpeedInMilliseconds: 300,
//         notchSmoothness: NotchSmoothness.smoothEdge,
//         gapLocation: GapLocation.center,
//         leftCornerRadius: 25,
//         rightCornerRadius: 25,
//         elevation: 50,
//         onTap: (index) {
//           setIndex(index);
//         },
//       ),
//     );
//   }

//   void setIndex(int index) {
//     _index = index;
//     setState(() {});
//   }

//   Future<bool> _onWillPop() {
//     debugPrint('inside will pop');
//     DateTime now = DateTime.now();
//     setIndex(0);

//     if (currentBackPressTime == null ||
//         now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
//       currentBackPressTime = now;
//       SnackBarUtil.getToast('Press again to exit');
//       return Future.value(false);
//     }
//     SystemChannels.platform.invokeMethod('SystemNavigator.pop');
//     return Future.value(true);
//   }
// }
