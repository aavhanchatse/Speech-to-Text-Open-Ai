import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../../app_constants/constants.dart';

class NoInternetSubscriptionWidget extends StatefulWidget {
  const NoInternetSubscriptionWidget({Key? key}) : super(key: key);

  @override
  State<NoInternetSubscriptionWidget> createState() =>
      _NoInternetSubscriptionWidgetState();
}

class _NoInternetSubscriptionWidgetState
    extends State<NoInternetSubscriptionWidget> {
  late StreamSubscription _subscription;
  double _height = 0.0;
  Color _color = Colors.red;

  @override
  initState() {
    super.initState();

    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        _height = 0.0;
        _color = Colors.green;
        // _color = Constants.primaryGreen;
        setState(() {});
      } else {
        // _color = Constants.red;
        _color = Colors.red;
        _height = 50.0;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        elevation: 6.0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: _height,
          decoration: BoxDecoration(
            color: _color,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  // Icon(
                  //   Icons.wifi_off_rounded,
                  //   color: Constants.white,
                  // ),
                  // SizedBox(width: 4.w),
                  Text(
                    "You're currently offline",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Constants.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  dispose() {
    super.dispose();
    _subscription.cancel();
  }
}
