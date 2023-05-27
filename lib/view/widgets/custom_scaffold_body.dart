import 'package:flutter/material.dart';
import 'package:openaispeech/utils/size_config.dart';
import '../../utils/gesturedetector_util.dart';
import 'internet_subscription_widget.dart';

class CustomScaffoldBody extends StatelessWidget {
  final Widget body;

  const CustomScaffoldBody({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GestureDetectorUtil.onScreenTap();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            SizedBox(
              height: 100.h,
              width: 100.w,
              child: body,
            ),
            const NoInternetSubscriptionWidget(),
          ],
        ),
      ),
    );
  }
}
