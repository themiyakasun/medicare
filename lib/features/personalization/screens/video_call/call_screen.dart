import 'dart:math';

import 'package:flutter/material.dart';
import 'package:medicare/features/personalization/screens/video_call/constant.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends StatelessWidget {
  const CallPage({Key? key, required this.callID}) : super(key: key);
  final String callID;

  @override
  Widget build(BuildContext context) {
    int userId = Random().nextInt(100000);
    return ZegoUIKitPrebuiltCall(
      appID: app_id, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign: app_sign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: userId.toString(),
      userName: 'user$userId',
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}