import 'package:flutter/material.dart';
import 'package:medicare/features/personalization/screens/video_call/call_screen.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCallScreen> {
  final _callId = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _callId.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Video Call")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _callId,
              decoration: InputDecoration(
                hintText: "Call Id"
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder:(context) => CallPage(callID: _callId.text),
                ));
              },
              child: Text("Join Call")
            ),
          ],
        ),
      ),
    );
  }
}